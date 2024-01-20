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
-- Submodules: 172
entity screen_deo_0CLK_e32d09a0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_e32d09a0;
architecture arch of screen_deo_0CLK_e32d09a0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal is_pixel_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_sprite_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_drawing_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_addr : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_is_pixel_port : unsigned(0 downto 0);
signal REG_COMB_is_sprite_port : unsigned(0 downto 0);
signal REG_COMB_is_drawing_port : unsigned(0 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_auto_x : unsigned(0 downto 0);
signal REG_COMB_is_auto_y : unsigned(0 downto 0);
signal REG_COMB_is_auto_addr : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;
signal REG_COMB_screen_blit_result : screen_blit_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l161_c6_f52a]
signal BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_7dae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l161_c2_824e]
signal ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l161_c2_824e]
signal tmp8_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l161_c2_824e]
signal screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l161_c2_824e]
signal ctrl_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l161_c2_824e]
signal y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l161_c2_824e]
signal color_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c2_824e]
signal auto_advance_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l161_c2_824e]
signal ram_addr_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l161_c2_824e]
signal x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l161_c2_824e]
signal layer_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l161_c2_824e]
signal is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l161_c2_824e]
signal flip_x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l161_c2_824e]
signal is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l161_c2_824e]
signal is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l161_c2_824e]
signal is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l161_c2_824e]
signal is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l161_c2_824e]
signal is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l161_c2_824e]
signal result_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l161_c2_824e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c2_824e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l161_c2_824e_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l161_c2_824e]
signal flip_y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l162_c19_ba63]
signal BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l162_c19_57d0]
signal MUX_uxn_device_h_l162_c19_57d0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c19_57d0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c19_57d0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c19_57d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l163_c20_3a2b]
signal BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l163_c20_6e68]
signal MUX_uxn_device_h_l163_c20_6e68_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c20_6e68_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c20_6e68_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c20_6e68_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l164_c21_977a]
signal BIN_OP_OR_uxn_device_h_l164_c21_977a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c21_977a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l167_c3_2dae]
signal result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l167_c3_2dae]
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l168_c32_3086]
signal MUX_uxn_device_h_l168_c32_3086_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l168_c32_3086_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l168_c32_3086_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l168_c32_3086_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_ff26]
signal BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l177_c7_954f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l174_c7_7dae]
signal ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l174_c7_7dae]
signal tmp8_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l174_c7_7dae]
signal screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l174_c7_7dae]
signal ctrl_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l174_c7_7dae]
signal y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l174_c7_7dae]
signal color_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l174_c7_7dae]
signal auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l174_c7_7dae]
signal ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l174_c7_7dae]
signal x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l174_c7_7dae]
signal layer_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l174_c7_7dae]
signal is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l174_c7_7dae]
signal flip_x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l174_c7_7dae]
signal is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l174_c7_7dae]
signal is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l174_c7_7dae]
signal result_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_7dae_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_7dae_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_7dae_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l174_c7_7dae]
signal flip_y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l177_c11_8877]
signal BIN_OP_EQ_uxn_device_h_l177_c11_8877_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_8877_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l186_c7_97b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l177_c7_954f]
signal ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l177_c7_954f]
signal tmp8_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l177_c7_954f]
signal screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l177_c7_954f]
signal ctrl_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l177_c7_954f]
signal y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l177_c7_954f]
signal color_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l177_c7_954f]
signal auto_advance_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l177_c7_954f]
signal ram_addr_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l177_c7_954f]
signal x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l177_c7_954f]
signal layer_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l177_c7_954f]
signal is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l177_c7_954f]
signal flip_x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l177_c7_954f]
signal is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l177_c7_954f]
signal is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l177_c7_954f]
signal result_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c7_954f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_954f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_954f_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l177_c7_954f]
signal flip_y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l180_c25_262f]
signal CONST_SR_7_uxn_device_h_l180_c25_262f_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l180_c25_262f_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l181_c21_a90d]
signal CONST_SR_6_uxn_device_h_l181_c21_a90d_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l182_c22_cbbd]
signal CONST_SR_5_uxn_device_h_l182_c22_cbbd_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l183_c22_dcea]
signal CONST_SR_4_uxn_device_h_l183_c22_dcea_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l186_c11_a1df]
signal BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l190_c7_b8ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l186_c7_97b9]
signal tmp8_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l186_c7_97b9]
signal screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output : screen_blit_result_t;

-- y_MUX[uxn_device_h_l186_c7_97b9]
signal y_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l186_c7_97b9]
signal auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l186_c7_97b9]
signal ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l186_c7_97b9]
signal x_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l186_c7_97b9]
signal is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l186_c7_97b9]
signal is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l186_c7_97b9]
signal is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l186_c7_97b9]
signal result_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l186_c7_97b9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l186_c7_97b9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l186_c7_97b9_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l190_c11_8360]
signal BIN_OP_EQ_uxn_device_h_l190_c11_8360_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_8360_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l209_c7_17ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l190_c7_b8ae]
signal tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l190_c7_b8ae]
signal screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output : screen_blit_result_t;

-- y_MUX[uxn_device_h_l190_c7_b8ae]
signal y_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l190_c7_b8ae]
signal auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l190_c7_b8ae]
signal ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l190_c7_b8ae]
signal is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l190_c7_b8ae]
signal is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l190_c7_b8ae]
signal is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l190_c7_b8ae]
signal result_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l190_c7_b8ae_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_b8ae_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_b8ae_return_output : device_out_result_t;

-- tmp8_MUX[uxn_device_h_l192_c3_db69]
signal tmp8_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l192_c3_db69]
signal result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l192_c3_db69]
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l192_c3_db69]
signal result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l192_c3_db69]
signal result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l192_c3_db69]
signal result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l192_c3_db69]
signal result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l194_c11_2169]
signal BIN_OP_AND_uxn_device_h_l194_c11_2169_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c11_2169_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l195_c23_097d]
signal BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l198_c4_17bb]
signal tmp8_MUX_uxn_device_h_l198_c4_17bb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l198_c4_17bb]
signal result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l199_c13_548b]
signal MUX_uxn_device_h_l199_c13_548b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l199_c13_548b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l199_c13_548b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l199_c13_548b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l199_c5_a426]
signal BIN_OP_OR_uxn_device_h_l199_c5_a426_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l199_c5_a426_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l200_c13_0a38]
signal MUX_uxn_device_h_l200_c13_0a38_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l200_c13_0a38_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l200_c13_0a38_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l200_c13_0a38_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l200_c5_ce13]
signal BIN_OP_OR_uxn_device_h_l200_c5_ce13_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l200_c5_ce13_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l209_c11_dd1a]
signal BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l225_c7_8eb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l209_c7_17ce]
signal screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output : screen_blit_result_t;

-- auto_advance_MUX[uxn_device_h_l209_c7_17ce]
signal auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l209_c7_17ce]
signal ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l209_c7_17ce]
signal is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);

-- is_auto_addr_MUX[uxn_device_h_l209_c7_17ce]
signal is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
signal is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l209_c7_17ce]
signal is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l209_c7_17ce]
signal result_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l209_c7_17ce_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l209_c7_17ce_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l209_c7_17ce_return_output : device_out_result_t;

-- result_is_deo_done_MUX[uxn_device_h_l214_c3_819a]
signal result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l214_c3_819a]
signal result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l214_c3_819a]
signal result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l214_c3_819a]
signal result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l214_c3_819a]
signal result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l214_c3_819a]
signal result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l218_c35_db5f]
signal BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l218_c45_fb84]
signal BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l218_c22_eb78]
signal MUX_uxn_device_h_l218_c22_eb78_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c22_eb78_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l218_c22_eb78_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l218_c22_eb78_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l219_c32_d9ee]
signal MUX_uxn_device_h_l219_c32_d9ee_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l219_c32_d9ee_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l219_c32_d9ee_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l219_c32_d9ee_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l220_c27_dae7]
signal UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l225_c11_af68]
signal BIN_OP_EQ_uxn_device_h_l225_c11_af68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l225_c11_af68_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_318e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l225_c7_8eb1]
signal screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output : screen_blit_result_t;

-- ram_addr_MUX[uxn_device_h_l225_c7_8eb1]
signal ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l225_c7_8eb1]
signal result_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l225_c7_8eb1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l225_c7_8eb1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l225_c7_8eb1_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l226_c3_5fcf]
signal ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l226_c3_5fcf]
signal result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l226_c3_5fcf]
signal result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l226_c3_5fcf]
signal result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l226_c3_5fcf]
signal result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l228_c33_1cbd]
signal BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l230_c32_18dc]
signal BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l238_c11_ad74]
signal BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l242_c1_99bd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l238_c7_318e]
signal screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output : screen_blit_result_t;

-- ram_addr_MUX[uxn_device_h_l238_c7_318e]
signal ram_addr_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l238_c7_318e]
signal result_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l238_c7_318e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_318e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_318e_return_output : device_out_result_t;

-- BIN_OP_OR[uxn_device_h_l240_c3_a211]
signal BIN_OP_OR_uxn_device_h_l240_c3_a211_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l240_c3_a211_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l244_c1_05e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l246_c1_b26d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l244_c3_4309]
signal screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output : screen_blit_result_t;

-- BIN_OP_MINUS[uxn_device_h_l245_c37_dc54]
signal BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output : unsigned(7 downto 0);

-- screen_2bpp[uxn_device_h_l245_c25_3f3c]
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_phase : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_x1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_y1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output : screen_blit_result_t;

-- BIN_OP_MINUS[uxn_device_h_l247_c37_12fb]
signal BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output : unsigned(7 downto 0);

-- screen_1bpp[uxn_device_h_l247_c25_508d]
signal screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_phase : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_x1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_y1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l247_c25_508d_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c
signal CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_6243( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u16_addr := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_7e09( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint8_t_uint17_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(16 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_30c3( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u8_value := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base.is_device_ram_write := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_deo_done := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l161_c6_f52a
BIN_OP_EQ_uxn_device_h_l161_c6_f52a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left,
BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right,
BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- ctrl_mode_MUX_uxn_device_h_l161_c2_824e
ctrl_mode_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond,
ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue,
ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse,
ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output);

-- tmp8_MUX_uxn_device_h_l161_c2_824e
tmp8_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l161_c2_824e_cond,
tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue,
tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse,
tmp8_MUX_uxn_device_h_l161_c2_824e_return_output);

-- screen_blit_result_MUX_uxn_device_h_l161_c2_824e
screen_blit_result_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond,
screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue,
screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse,
screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output);

-- ctrl_MUX_uxn_device_h_l161_c2_824e
ctrl_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l161_c2_824e_cond,
ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue,
ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse,
ctrl_MUX_uxn_device_h_l161_c2_824e_return_output);

-- y_MUX_uxn_device_h_l161_c2_824e
y_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l161_c2_824e_cond,
y_MUX_uxn_device_h_l161_c2_824e_iftrue,
y_MUX_uxn_device_h_l161_c2_824e_iffalse,
y_MUX_uxn_device_h_l161_c2_824e_return_output);

-- color_MUX_uxn_device_h_l161_c2_824e
color_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l161_c2_824e_cond,
color_MUX_uxn_device_h_l161_c2_824e_iftrue,
color_MUX_uxn_device_h_l161_c2_824e_iffalse,
color_MUX_uxn_device_h_l161_c2_824e_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c2_824e
auto_advance_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c2_824e_cond,
auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue,
auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse,
auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output);

-- ram_addr_MUX_uxn_device_h_l161_c2_824e
ram_addr_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l161_c2_824e_cond,
ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue,
ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse,
ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output);

-- x_MUX_uxn_device_h_l161_c2_824e
x_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l161_c2_824e_cond,
x_MUX_uxn_device_h_l161_c2_824e_iftrue,
x_MUX_uxn_device_h_l161_c2_824e_iffalse,
x_MUX_uxn_device_h_l161_c2_824e_return_output);

-- layer_MUX_uxn_device_h_l161_c2_824e
layer_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l161_c2_824e_cond,
layer_MUX_uxn_device_h_l161_c2_824e_iftrue,
layer_MUX_uxn_device_h_l161_c2_824e_iffalse,
layer_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_auto_y_MUX_uxn_device_h_l161_c2_824e
is_auto_y_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond,
is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output);

-- flip_x_MUX_uxn_device_h_l161_c2_824e
flip_x_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l161_c2_824e_cond,
flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue,
flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse,
flip_x_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_sprite_port_MUX_uxn_device_h_l161_c2_824e
is_sprite_port_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond,
is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_pixel_port_MUX_uxn_device_h_l161_c2_824e
is_pixel_port_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond,
is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_drawing_port_MUX_uxn_device_h_l161_c2_824e
is_drawing_port_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond,
is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_auto_addr_MUX_uxn_device_h_l161_c2_824e
is_auto_addr_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond,
is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output);

-- is_auto_x_MUX_uxn_device_h_l161_c2_824e
is_auto_x_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond,
is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue,
is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse,
is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output);

-- result_MUX_uxn_device_h_l161_c2_824e
result_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l161_c2_824e_cond,
result_MUX_uxn_device_h_l161_c2_824e_iftrue,
result_MUX_uxn_device_h_l161_c2_824e_iffalse,
result_MUX_uxn_device_h_l161_c2_824e_return_output);

-- flip_y_MUX_uxn_device_h_l161_c2_824e
flip_y_MUX_uxn_device_h_l161_c2_824e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l161_c2_824e_cond,
flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue,
flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse,
flip_y_MUX_uxn_device_h_l161_c2_824e_return_output);

-- BIN_OP_EQ_uxn_device_h_l162_c19_ba63
BIN_OP_EQ_uxn_device_h_l162_c19_ba63 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left,
BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right,
BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output);

-- MUX_uxn_device_h_l162_c19_57d0
MUX_uxn_device_h_l162_c19_57d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l162_c19_57d0_cond,
MUX_uxn_device_h_l162_c19_57d0_iftrue,
MUX_uxn_device_h_l162_c19_57d0_iffalse,
MUX_uxn_device_h_l162_c19_57d0_return_output);

-- BIN_OP_EQ_uxn_device_h_l163_c20_3a2b
BIN_OP_EQ_uxn_device_h_l163_c20_3a2b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left,
BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right,
BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output);

-- MUX_uxn_device_h_l163_c20_6e68
MUX_uxn_device_h_l163_c20_6e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l163_c20_6e68_cond,
MUX_uxn_device_h_l163_c20_6e68_iftrue,
MUX_uxn_device_h_l163_c20_6e68_iffalse,
MUX_uxn_device_h_l163_c20_6e68_return_output);

-- BIN_OP_OR_uxn_device_h_l164_c21_977a
BIN_OP_OR_uxn_device_h_l164_c21_977a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l164_c21_977a_left,
BIN_OP_OR_uxn_device_h_l164_c21_977a_right,
BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae
result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond,
result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue,
result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse,
result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae
result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond,
result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue,
result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse,
result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output);

-- MUX_uxn_device_h_l168_c32_3086
MUX_uxn_device_h_l168_c32_3086 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l168_c32_3086_cond,
MUX_uxn_device_h_l168_c32_3086_iftrue,
MUX_uxn_device_h_l168_c32_3086_iffalse,
MUX_uxn_device_h_l168_c32_3086_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_ff26
BIN_OP_EQ_uxn_device_h_l174_c11_ff26 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left,
BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right,
BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l174_c7_7dae
ctrl_mode_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond,
ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue,
ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse,
ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- tmp8_MUX_uxn_device_h_l174_c7_7dae
tmp8_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l174_c7_7dae_cond,
tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue,
tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse,
tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- screen_blit_result_MUX_uxn_device_h_l174_c7_7dae
screen_blit_result_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond,
screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue,
screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse,
screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- ctrl_MUX_uxn_device_h_l174_c7_7dae
ctrl_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l174_c7_7dae_cond,
ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue,
ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse,
ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- y_MUX_uxn_device_h_l174_c7_7dae
y_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l174_c7_7dae_cond,
y_MUX_uxn_device_h_l174_c7_7dae_iftrue,
y_MUX_uxn_device_h_l174_c7_7dae_iffalse,
y_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- color_MUX_uxn_device_h_l174_c7_7dae
color_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l174_c7_7dae_cond,
color_MUX_uxn_device_h_l174_c7_7dae_iftrue,
color_MUX_uxn_device_h_l174_c7_7dae_iffalse,
color_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- auto_advance_MUX_uxn_device_h_l174_c7_7dae
auto_advance_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond,
auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue,
auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse,
auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_7dae
ram_addr_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond,
ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- x_MUX_uxn_device_h_l174_c7_7dae
x_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_7dae_cond,
x_MUX_uxn_device_h_l174_c7_7dae_iftrue,
x_MUX_uxn_device_h_l174_c7_7dae_iffalse,
x_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- layer_MUX_uxn_device_h_l174_c7_7dae
layer_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l174_c7_7dae_cond,
layer_MUX_uxn_device_h_l174_c7_7dae_iftrue,
layer_MUX_uxn_device_h_l174_c7_7dae_iffalse,
layer_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- is_auto_y_MUX_uxn_device_h_l174_c7_7dae
is_auto_y_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond,
is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue,
is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse,
is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- flip_x_MUX_uxn_device_h_l174_c7_7dae
flip_x_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l174_c7_7dae_cond,
flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue,
flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse,
flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- is_auto_addr_MUX_uxn_device_h_l174_c7_7dae
is_auto_addr_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond,
is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue,
is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse,
is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- is_auto_x_MUX_uxn_device_h_l174_c7_7dae
is_auto_x_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond,
is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue,
is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse,
is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- result_MUX_uxn_device_h_l174_c7_7dae
result_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_7dae_cond,
result_MUX_uxn_device_h_l174_c7_7dae_iftrue,
result_MUX_uxn_device_h_l174_c7_7dae_iffalse,
result_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- flip_y_MUX_uxn_device_h_l174_c7_7dae
flip_y_MUX_uxn_device_h_l174_c7_7dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l174_c7_7dae_cond,
flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue,
flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse,
flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output);

-- BIN_OP_EQ_uxn_device_h_l177_c11_8877
BIN_OP_EQ_uxn_device_h_l177_c11_8877 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l177_c11_8877_left,
BIN_OP_EQ_uxn_device_h_l177_c11_8877_right,
BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l177_c7_954f
ctrl_mode_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond,
ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue,
ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse,
ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output);

-- tmp8_MUX_uxn_device_h_l177_c7_954f
tmp8_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l177_c7_954f_cond,
tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue,
tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse,
tmp8_MUX_uxn_device_h_l177_c7_954f_return_output);

-- screen_blit_result_MUX_uxn_device_h_l177_c7_954f
screen_blit_result_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond,
screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue,
screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse,
screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output);

-- ctrl_MUX_uxn_device_h_l177_c7_954f
ctrl_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l177_c7_954f_cond,
ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue,
ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse,
ctrl_MUX_uxn_device_h_l177_c7_954f_return_output);

-- y_MUX_uxn_device_h_l177_c7_954f
y_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c7_954f_cond,
y_MUX_uxn_device_h_l177_c7_954f_iftrue,
y_MUX_uxn_device_h_l177_c7_954f_iffalse,
y_MUX_uxn_device_h_l177_c7_954f_return_output);

-- color_MUX_uxn_device_h_l177_c7_954f
color_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l177_c7_954f_cond,
color_MUX_uxn_device_h_l177_c7_954f_iftrue,
color_MUX_uxn_device_h_l177_c7_954f_iffalse,
color_MUX_uxn_device_h_l177_c7_954f_return_output);

-- auto_advance_MUX_uxn_device_h_l177_c7_954f
auto_advance_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l177_c7_954f_cond,
auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue,
auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse,
auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output);

-- ram_addr_MUX_uxn_device_h_l177_c7_954f
ram_addr_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l177_c7_954f_cond,
ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue,
ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse,
ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output);

-- x_MUX_uxn_device_h_l177_c7_954f
x_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l177_c7_954f_cond,
x_MUX_uxn_device_h_l177_c7_954f_iftrue,
x_MUX_uxn_device_h_l177_c7_954f_iffalse,
x_MUX_uxn_device_h_l177_c7_954f_return_output);

-- layer_MUX_uxn_device_h_l177_c7_954f
layer_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l177_c7_954f_cond,
layer_MUX_uxn_device_h_l177_c7_954f_iftrue,
layer_MUX_uxn_device_h_l177_c7_954f_iffalse,
layer_MUX_uxn_device_h_l177_c7_954f_return_output);

-- is_auto_y_MUX_uxn_device_h_l177_c7_954f
is_auto_y_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond,
is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue,
is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse,
is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output);

-- flip_x_MUX_uxn_device_h_l177_c7_954f
flip_x_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l177_c7_954f_cond,
flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue,
flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse,
flip_x_MUX_uxn_device_h_l177_c7_954f_return_output);

-- is_auto_addr_MUX_uxn_device_h_l177_c7_954f
is_auto_addr_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond,
is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue,
is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse,
is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output);

-- is_auto_x_MUX_uxn_device_h_l177_c7_954f
is_auto_x_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond,
is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue,
is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse,
is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output);

-- result_MUX_uxn_device_h_l177_c7_954f
result_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l177_c7_954f_cond,
result_MUX_uxn_device_h_l177_c7_954f_iftrue,
result_MUX_uxn_device_h_l177_c7_954f_iffalse,
result_MUX_uxn_device_h_l177_c7_954f_return_output);

-- flip_y_MUX_uxn_device_h_l177_c7_954f
flip_y_MUX_uxn_device_h_l177_c7_954f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l177_c7_954f_cond,
flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue,
flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse,
flip_y_MUX_uxn_device_h_l177_c7_954f_return_output);

-- CONST_SR_7_uxn_device_h_l180_c25_262f
CONST_SR_7_uxn_device_h_l180_c25_262f : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l180_c25_262f_x,
CONST_SR_7_uxn_device_h_l180_c25_262f_return_output);

-- CONST_SR_6_uxn_device_h_l181_c21_a90d
CONST_SR_6_uxn_device_h_l181_c21_a90d : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l181_c21_a90d_x,
CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output);

-- CONST_SR_5_uxn_device_h_l182_c22_cbbd
CONST_SR_5_uxn_device_h_l182_c22_cbbd : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l182_c22_cbbd_x,
CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output);

-- CONST_SR_4_uxn_device_h_l183_c22_dcea
CONST_SR_4_uxn_device_h_l183_c22_dcea : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l183_c22_dcea_x,
CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output);

-- BIN_OP_EQ_uxn_device_h_l186_c11_a1df
BIN_OP_EQ_uxn_device_h_l186_c11_a1df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left,
BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right,
BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- tmp8_MUX_uxn_device_h_l186_c7_97b9
tmp8_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l186_c7_97b9_cond,
tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue,
tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse,
tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- screen_blit_result_MUX_uxn_device_h_l186_c7_97b9
screen_blit_result_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond,
screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue,
screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse,
screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- y_MUX_uxn_device_h_l186_c7_97b9
y_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l186_c7_97b9_cond,
y_MUX_uxn_device_h_l186_c7_97b9_iftrue,
y_MUX_uxn_device_h_l186_c7_97b9_iffalse,
y_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- auto_advance_MUX_uxn_device_h_l186_c7_97b9
auto_advance_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond,
auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue,
auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse,
auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- ram_addr_MUX_uxn_device_h_l186_c7_97b9
ram_addr_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond,
ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue,
ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse,
ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- x_MUX_uxn_device_h_l186_c7_97b9
x_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l186_c7_97b9_cond,
x_MUX_uxn_device_h_l186_c7_97b9_iftrue,
x_MUX_uxn_device_h_l186_c7_97b9_iffalse,
x_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- is_auto_y_MUX_uxn_device_h_l186_c7_97b9
is_auto_y_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond,
is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue,
is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse,
is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- is_auto_addr_MUX_uxn_device_h_l186_c7_97b9
is_auto_addr_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond,
is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue,
is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse,
is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- is_auto_x_MUX_uxn_device_h_l186_c7_97b9
is_auto_x_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond,
is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue,
is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse,
is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- result_MUX_uxn_device_h_l186_c7_97b9
result_MUX_uxn_device_h_l186_c7_97b9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l186_c7_97b9_cond,
result_MUX_uxn_device_h_l186_c7_97b9_iftrue,
result_MUX_uxn_device_h_l186_c7_97b9_iffalse,
result_MUX_uxn_device_h_l186_c7_97b9_return_output);

-- BIN_OP_EQ_uxn_device_h_l190_c11_8360
BIN_OP_EQ_uxn_device_h_l190_c11_8360 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l190_c11_8360_left,
BIN_OP_EQ_uxn_device_h_l190_c11_8360_right,
BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- tmp8_MUX_uxn_device_h_l190_c7_b8ae
tmp8_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond,
tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae
screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond,
screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- y_MUX_uxn_device_h_l190_c7_b8ae
y_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l190_c7_b8ae_cond,
y_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
y_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
y_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- auto_advance_MUX_uxn_device_h_l190_c7_b8ae
auto_advance_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond,
auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- ram_addr_MUX_uxn_device_h_l190_c7_b8ae
ram_addr_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond,
ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- is_auto_y_MUX_uxn_device_h_l190_c7_b8ae
is_auto_y_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond,
is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae
is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond,
is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- is_auto_x_MUX_uxn_device_h_l190_c7_b8ae
is_auto_x_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond,
is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- result_MUX_uxn_device_h_l190_c7_b8ae
result_MUX_uxn_device_h_l190_c7_b8ae : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l190_c7_b8ae_cond,
result_MUX_uxn_device_h_l190_c7_b8ae_iftrue,
result_MUX_uxn_device_h_l190_c7_b8ae_iffalse,
result_MUX_uxn_device_h_l190_c7_b8ae_return_output);

-- tmp8_MUX_uxn_device_h_l192_c3_db69
tmp8_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l192_c3_db69_cond,
tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue,
tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse,
tmp8_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l192_c3_db69
result_is_deo_done_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond,
result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l192_c3_db69
result_device_ram_address_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond,
result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l192_c3_db69
result_is_vram_write_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond,
result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_u16_addr_MUX_uxn_device_h_l192_c3_db69
result_u16_addr_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond,
result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69
result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond,
result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output);

-- result_u8_value_MUX_uxn_device_h_l192_c3_db69
result_u8_value_MUX_uxn_device_h_l192_c3_db69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond,
result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue,
result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse,
result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output);

-- BIN_OP_AND_uxn_device_h_l194_c11_2169
BIN_OP_AND_uxn_device_h_l194_c11_2169 : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l194_c11_2169_left,
BIN_OP_AND_uxn_device_h_l194_c11_2169_right,
BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output);

-- BIN_OP_PLUS_uxn_device_h_l195_c23_097d
BIN_OP_PLUS_uxn_device_h_l195_c23_097d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left,
BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right,
BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output);

-- tmp8_MUX_uxn_device_h_l198_c4_17bb
tmp8_MUX_uxn_device_h_l198_c4_17bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l198_c4_17bb_cond,
tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue,
tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse,
tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb
result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond,
result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output);

-- MUX_uxn_device_h_l199_c13_548b
MUX_uxn_device_h_l199_c13_548b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l199_c13_548b_cond,
MUX_uxn_device_h_l199_c13_548b_iftrue,
MUX_uxn_device_h_l199_c13_548b_iffalse,
MUX_uxn_device_h_l199_c13_548b_return_output);

-- BIN_OP_OR_uxn_device_h_l199_c5_a426
BIN_OP_OR_uxn_device_h_l199_c5_a426 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l199_c5_a426_left,
BIN_OP_OR_uxn_device_h_l199_c5_a426_right,
BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output);

-- MUX_uxn_device_h_l200_c13_0a38
MUX_uxn_device_h_l200_c13_0a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l200_c13_0a38_cond,
MUX_uxn_device_h_l200_c13_0a38_iftrue,
MUX_uxn_device_h_l200_c13_0a38_iffalse,
MUX_uxn_device_h_l200_c13_0a38_return_output);

-- BIN_OP_OR_uxn_device_h_l200_c5_ce13
BIN_OP_OR_uxn_device_h_l200_c5_ce13 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l200_c5_ce13_left,
BIN_OP_OR_uxn_device_h_l200_c5_ce13_right,
BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output);

-- BIN_OP_EQ_uxn_device_h_l209_c11_dd1a
BIN_OP_EQ_uxn_device_h_l209_c11_dd1a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left,
BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right,
BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output);

-- screen_blit_result_MUX_uxn_device_h_l209_c7_17ce
screen_blit_result_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond,
screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue,
screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse,
screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- auto_advance_MUX_uxn_device_h_l209_c7_17ce
auto_advance_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond,
auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue,
auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse,
auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c7_17ce
ram_addr_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond,
ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue,
ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse,
ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- is_auto_y_MUX_uxn_device_h_l209_c7_17ce
is_auto_y_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond,
is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue,
is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse,
is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- is_auto_addr_MUX_uxn_device_h_l209_c7_17ce
is_auto_addr_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond,
is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue,
is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse,
is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- is_auto_x_MUX_uxn_device_h_l209_c7_17ce
is_auto_x_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond,
is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue,
is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse,
is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- result_MUX_uxn_device_h_l209_c7_17ce
result_MUX_uxn_device_h_l209_c7_17ce : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l209_c7_17ce_cond,
result_MUX_uxn_device_h_l209_c7_17ce_iftrue,
result_MUX_uxn_device_h_l209_c7_17ce_iffalse,
result_MUX_uxn_device_h_l209_c7_17ce_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l214_c3_819a
result_is_deo_done_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond,
result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l214_c3_819a
result_device_ram_address_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond,
result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l214_c3_819a
result_is_vram_write_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond,
result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a
result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output);

-- result_u16_addr_MUX_uxn_device_h_l214_c3_819a
result_u16_addr_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond,
result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output);

-- result_u8_value_MUX_uxn_device_h_l214_c3_819a
result_u8_value_MUX_uxn_device_h_l214_c3_819a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond,
result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue,
result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse,
result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l218_c35_db5f
BIN_OP_PLUS_uxn_device_h_l218_c35_db5f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left,
BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right,
BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l218_c45_fb84
BIN_OP_PLUS_uxn_device_h_l218_c45_fb84 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left,
BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right,
BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output);

-- MUX_uxn_device_h_l218_c22_eb78
MUX_uxn_device_h_l218_c22_eb78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l218_c22_eb78_cond,
MUX_uxn_device_h_l218_c22_eb78_iftrue,
MUX_uxn_device_h_l218_c22_eb78_iffalse,
MUX_uxn_device_h_l218_c22_eb78_return_output);

-- MUX_uxn_device_h_l219_c32_d9ee
MUX_uxn_device_h_l219_c32_d9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l219_c32_d9ee_cond,
MUX_uxn_device_h_l219_c32_d9ee_iftrue,
MUX_uxn_device_h_l219_c32_d9ee_iffalse,
MUX_uxn_device_h_l219_c32_d9ee_return_output);

-- UNARY_OP_NOT_uxn_device_h_l220_c27_dae7
UNARY_OP_NOT_uxn_device_h_l220_c27_dae7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr,
UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output);

-- BIN_OP_EQ_uxn_device_h_l225_c11_af68
BIN_OP_EQ_uxn_device_h_l225_c11_af68 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l225_c11_af68_left,
BIN_OP_EQ_uxn_device_h_l225_c11_af68_right,
BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output);

-- screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1
screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond,
screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue,
screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse,
screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output);

-- ram_addr_MUX_uxn_device_h_l225_c7_8eb1
ram_addr_MUX_uxn_device_h_l225_c7_8eb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond,
ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue,
ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse,
ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output);

-- result_MUX_uxn_device_h_l225_c7_8eb1
result_MUX_uxn_device_h_l225_c7_8eb1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l225_c7_8eb1_cond,
result_MUX_uxn_device_h_l225_c7_8eb1_iftrue,
result_MUX_uxn_device_h_l225_c7_8eb1_iffalse,
result_MUX_uxn_device_h_l225_c7_8eb1_return_output);

-- ram_addr_MUX_uxn_device_h_l226_c3_5fcf
ram_addr_MUX_uxn_device_h_l226_c3_5fcf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond,
ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue,
ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse,
ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf
result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf
result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond,
result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf
result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond,
result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output);

-- result_u8_value_MUX_uxn_device_h_l226_c3_5fcf
result_u8_value_MUX_uxn_device_h_l226_c3_5fcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond,
result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue,
result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse,
result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output);

-- BIN_OP_AND_uxn_device_h_l228_c33_1cbd
BIN_OP_AND_uxn_device_h_l228_c33_1cbd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left,
BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right,
BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l230_c32_18dc
BIN_OP_PLUS_uxn_device_h_l230_c32_18dc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left,
BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right,
BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output);

-- BIN_OP_EQ_uxn_device_h_l238_c11_ad74
BIN_OP_EQ_uxn_device_h_l238_c11_ad74 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left,
BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right,
BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output);

-- screen_blit_result_MUX_uxn_device_h_l238_c7_318e
screen_blit_result_MUX_uxn_device_h_l238_c7_318e : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond,
screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue,
screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse,
screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output);

-- ram_addr_MUX_uxn_device_h_l238_c7_318e
ram_addr_MUX_uxn_device_h_l238_c7_318e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l238_c7_318e_cond,
ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue,
ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse,
ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output);

-- result_MUX_uxn_device_h_l238_c7_318e
result_MUX_uxn_device_h_l238_c7_318e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l238_c7_318e_cond,
result_MUX_uxn_device_h_l238_c7_318e_iftrue,
result_MUX_uxn_device_h_l238_c7_318e_iffalse,
result_MUX_uxn_device_h_l238_c7_318e_return_output);

-- BIN_OP_OR_uxn_device_h_l240_c3_a211
BIN_OP_OR_uxn_device_h_l240_c3_a211 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l240_c3_a211_left,
BIN_OP_OR_uxn_device_h_l240_c3_a211_right,
BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output);

-- screen_blit_result_MUX_uxn_device_h_l244_c3_4309
screen_blit_result_MUX_uxn_device_h_l244_c3_4309 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond,
screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue,
screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse,
screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output);

-- BIN_OP_MINUS_uxn_device_h_l245_c37_dc54
BIN_OP_MINUS_uxn_device_h_l245_c37_dc54 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left,
BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right,
BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output);

-- screen_2bpp_uxn_device_h_l245_c25_3f3c
screen_2bpp_uxn_device_h_l245_c25_3f3c : entity work.screen_2bpp_0CLK_c97a7bcc port map (
clk,
screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l245_c25_3f3c_phase,
screen_2bpp_uxn_device_h_l245_c25_3f3c_x1,
screen_2bpp_uxn_device_h_l245_c25_3f3c_y1,
screen_2bpp_uxn_device_h_l245_c25_3f3c_color,
screen_2bpp_uxn_device_h_l245_c25_3f3c_fx,
screen_2bpp_uxn_device_h_l245_c25_3f3c_fy,
screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr,
screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read,
screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output);

-- BIN_OP_MINUS_uxn_device_h_l247_c37_12fb
BIN_OP_MINUS_uxn_device_h_l247_c37_12fb : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left,
BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right,
BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output);

-- screen_1bpp_uxn_device_h_l247_c25_508d
screen_1bpp_uxn_device_h_l247_c25_508d : entity work.screen_1bpp_0CLK_b46fbcba port map (
clk,
screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l247_c25_508d_phase,
screen_1bpp_uxn_device_h_l247_c25_508d_x1,
screen_1bpp_uxn_device_h_l247_c25_508d_y1,
screen_1bpp_uxn_device_h_l247_c25_508d_color,
screen_1bpp_uxn_device_h_l247_c25_508d_fx,
screen_1bpp_uxn_device_h_l247_c25_508d_fy,
screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr,
screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read,
screen_1bpp_uxn_device_h_l247_c25_508d_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c
CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x,
CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output);



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
 ctrl,
 auto_advance,
 tmp8,
 color,
 is_pixel_port,
 is_sprite_port,
 is_drawing_port,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_auto_x,
 is_auto_y,
 is_auto_addr,
 result,
 screen_blit_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output,
 ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output,
 tmp8_MUX_uxn_device_h_l161_c2_824e_return_output,
 screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output,
 ctrl_MUX_uxn_device_h_l161_c2_824e_return_output,
 y_MUX_uxn_device_h_l161_c2_824e_return_output,
 color_MUX_uxn_device_h_l161_c2_824e_return_output,
 auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output,
 ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output,
 x_MUX_uxn_device_h_l161_c2_824e_return_output,
 layer_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output,
 flip_x_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output,
 is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output,
 result_MUX_uxn_device_h_l161_c2_824e_return_output,
 flip_y_MUX_uxn_device_h_l161_c2_824e_return_output,
 BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output,
 MUX_uxn_device_h_l162_c19_57d0_return_output,
 BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output,
 MUX_uxn_device_h_l163_c20_6e68_return_output,
 BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output,
 MUX_uxn_device_h_l168_c32_3086_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output,
 ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output,
 tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output,
 screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output,
 ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output,
 y_MUX_uxn_device_h_l174_c7_7dae_return_output,
 color_MUX_uxn_device_h_l174_c7_7dae_return_output,
 auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output,
 x_MUX_uxn_device_h_l174_c7_7dae_return_output,
 layer_MUX_uxn_device_h_l174_c7_7dae_return_output,
 is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output,
 flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output,
 is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output,
 is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output,
 result_MUX_uxn_device_h_l174_c7_7dae_return_output,
 flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output,
 BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output,
 ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output,
 tmp8_MUX_uxn_device_h_l177_c7_954f_return_output,
 screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output,
 ctrl_MUX_uxn_device_h_l177_c7_954f_return_output,
 y_MUX_uxn_device_h_l177_c7_954f_return_output,
 color_MUX_uxn_device_h_l177_c7_954f_return_output,
 auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output,
 ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output,
 x_MUX_uxn_device_h_l177_c7_954f_return_output,
 layer_MUX_uxn_device_h_l177_c7_954f_return_output,
 is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output,
 flip_x_MUX_uxn_device_h_l177_c7_954f_return_output,
 is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output,
 is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output,
 result_MUX_uxn_device_h_l177_c7_954f_return_output,
 flip_y_MUX_uxn_device_h_l177_c7_954f_return_output,
 CONST_SR_7_uxn_device_h_l180_c25_262f_return_output,
 CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output,
 CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output,
 CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output,
 BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output,
 screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output,
 y_MUX_uxn_device_h_l186_c7_97b9_return_output,
 auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output,
 ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output,
 x_MUX_uxn_device_h_l186_c7_97b9_return_output,
 is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output,
 is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output,
 is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output,
 result_MUX_uxn_device_h_l186_c7_97b9_return_output,
 BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output,
 tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 y_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 result_MUX_uxn_device_h_l190_c7_b8ae_return_output,
 tmp8_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output,
 result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output,
 BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output,
 BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output,
 tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output,
 MUX_uxn_device_h_l199_c13_548b_return_output,
 BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output,
 MUX_uxn_device_h_l200_c13_0a38_return_output,
 BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output,
 BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output,
 screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output,
 auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output,
 ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output,
 is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output,
 is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output,
 is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output,
 result_MUX_uxn_device_h_l209_c7_17ce_return_output,
 result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output,
 result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output,
 result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output,
 BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output,
 BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output,
 MUX_uxn_device_h_l218_c22_eb78_return_output,
 MUX_uxn_device_h_l219_c32_d9ee_return_output,
 UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output,
 BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output,
 screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output,
 ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output,
 result_MUX_uxn_device_h_l225_c7_8eb1_return_output,
 ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output,
 result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output,
 BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output,
 BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output,
 BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output,
 screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output,
 ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output,
 result_MUX_uxn_device_h_l238_c7_318e_return_output,
 BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output,
 screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output,
 BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output,
 screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output,
 BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output,
 screen_1bpp_uxn_device_h_l247_c25_508d_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l161_c2_824e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l161_c2_824e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c2_824e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_7dae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c2_824e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c19_57d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c19_57d0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c19_57d0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c19_57d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c20_6e68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c20_6e68_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c20_6e68_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c20_6e68_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l168_c32_3086_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l168_c32_3086_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l168_c32_3086_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l168_c32_3086_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_7dae_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l174_c7_7dae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_7dae_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_954f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c7_954f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_954f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_954f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_97b9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l179_c11_cf9c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l180_c15_b743_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l181_c11_c9f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l182_c12_7be0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l183_c12_0593_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l186_c7_97b9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_97b9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_97b9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_b8ae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6243_uxn_device_h_l190_c7_b8ae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l209_c7_17ce_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_b8ae_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l193_c4_a8c7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l195_c4_647e : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l194_c4_beb9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l199_c13_548b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l199_c13_548b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l199_c13_548b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l199_c13_548b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l200_c13_0a38_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l200_c13_0a38_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l200_c13_0a38_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l200_c13_0a38_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l209_c7_17ce_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7e09_uxn_device_h_l209_c7_17ce_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l209_c7_17ce_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l225_c7_8eb1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l209_c7_17ce_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l212_c15_99d7_return_output : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l213_c18_689b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l216_c4_1885 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c22_eb78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c22_eb78_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c22_eb78_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c22_eb78_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l219_c32_d9ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l219_c32_d9ee_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l219_c32_d9ee_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l219_c32_d9ee_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_30c3_uxn_device_h_l225_c7_8eb1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_318e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l225_c7_8eb1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l230_c22_0dbc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l238_c7_318e_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_318e_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l238_c7_318e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_318e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output : unsigned(15 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_phase : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_x1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_y1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_phase : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_x1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_y1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l247_c25_508d_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l251_c3_8079 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l252_c26_a93f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l253_c21_d63b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l255_c21_b83e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l256_c24_70f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l167_l226_DUPLICATE_fea6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l192_l214_DUPLICATE_5e11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l192_l214_DUPLICATE_4a26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l214_l226_DUPLICATE_9944_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_is_pixel_port : unsigned(0 downto 0);
variable REG_VAR_is_sprite_port : unsigned(0 downto 0);
variable REG_VAR_is_drawing_port : unsigned(0 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_auto_x : unsigned(0 downto 0);
variable REG_VAR_is_auto_y : unsigned(0 downto 0);
variable REG_VAR_is_auto_addr : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
variable REG_VAR_screen_blit_result : screen_blit_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ram_addr := ram_addr;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_color := color;
  REG_VAR_is_pixel_port := is_pixel_port;
  REG_VAR_is_sprite_port := is_sprite_port;
  REG_VAR_is_drawing_port := is_drawing_port;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_auto_x := is_auto_x;
  REG_VAR_is_auto_y := is_auto_y;
  REG_VAR_is_auto_addr := is_auto_addr;
  REG_VAR_result := result;
  REG_VAR_screen_blit_result := screen_blit_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right := to_unsigned(5, 8);
     VAR_MUX_uxn_device_h_l219_c32_d9ee_iftrue := to_unsigned(41, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l163_c20_6e68_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l199_c13_548b_iffalse := to_unsigned(16, 8);
     VAR_result_device_ram_address_uxn_device_h_l251_c3_8079 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right := to_unsigned(0, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse := to_unsigned(44, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse := to_unsigned(45, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_right := to_unsigned(6, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l199_c13_548b_iftrue := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l162_c19_57d0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right := to_unsigned(7, 8);
     VAR_MUX_uxn_device_h_l168_c32_3086_iffalse := to_unsigned(47, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l168_c32_3086_iftrue := to_unsigned(46, 8);
     VAR_MUX_uxn_device_h_l219_c32_d9ee_iffalse := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l200_c13_0a38_iftrue := to_unsigned(4, 8);
     VAR_result_device_ram_address_uxn_device_h_l193_c4_a8c7 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue := VAR_result_device_ram_address_uxn_device_h_l193_c4_a8c7;
     VAR_MUX_uxn_device_h_l163_c20_6e68_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l162_c19_57d0_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue := to_unsigned(43, 8);
     VAR_MUX_uxn_device_h_l200_c13_0a38_iffalse := to_unsigned(0, 8);
     VAR_result_u16_addr_uxn_device_h_l216_c4_1885 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue := VAR_result_u16_addr_uxn_device_h_l216_c4_1885;
     VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right := to_unsigned(8, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right := to_unsigned(3, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_left := color;
     VAR_color_MUX_uxn_device_h_l161_c2_824e_iftrue := color;
     VAR_color_MUX_uxn_device_h_l174_c7_7dae_iftrue := color;
     VAR_color_MUX_uxn_device_h_l177_c7_954f_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_color := color;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_color := color;
     VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond := ctrl_mode;
     VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l199_c13_548b_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fx := flip_x;
     VAR_MUX_uxn_device_h_l200_c13_0a38_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fy := flip_y;
     VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue := is_auto_addr;
     VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue := is_auto_addr;
     VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue := is_auto_addr;
     VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue := is_auto_addr;
     VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue := is_auto_addr;
     VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse := is_auto_addr;
     VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse := is_auto_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse := is_drawing_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_cond := is_pixel_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l161_c2_824e_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l177_c7_954f_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l238_c7_318e_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue := screen_blit_result;
     VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left := x;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_x1 := resize(x, 8);
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_x1 := resize(x, 8);
     VAR_x_MUX_uxn_device_h_l161_c2_824e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_7dae_iftrue := x;
     VAR_x_MUX_uxn_device_h_l177_c7_954f_iftrue := x;
     VAR_x_MUX_uxn_device_h_l186_c7_97b9_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left := y;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_y1 := resize(y, 8);
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_y1 := resize(y, 8);
     VAR_y_MUX_uxn_device_h_l161_c2_824e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l174_c7_7dae_iftrue := y;
     VAR_y_MUX_uxn_device_h_l177_c7_954f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l186_c7_97b9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse := y;
     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l161_c6_f52a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_left;
     BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output := BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l218_c35_db5f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_left;
     BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output := BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output;

     -- CONST_SR_6[uxn_device_h_l181_c21_a90d] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l181_c21_a90d_x <= VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output := CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output;

     -- MUX[uxn_device_h_l200_c13_0a38] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l200_c13_0a38_cond <= VAR_MUX_uxn_device_h_l200_c13_0a38_cond;
     MUX_uxn_device_h_l200_c13_0a38_iftrue <= VAR_MUX_uxn_device_h_l200_c13_0a38_iftrue;
     MUX_uxn_device_h_l200_c13_0a38_iffalse <= VAR_MUX_uxn_device_h_l200_c13_0a38_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l200_c13_0a38_return_output := MUX_uxn_device_h_l200_c13_0a38_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_ff26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;

     -- uint8_1_1[uxn_device_h_l212_c15_99d7] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l212_c15_99d7_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l238_c11_ad74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_left;
     BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output := BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l192_l214_DUPLICATE_4a26 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l192_l214_DUPLICATE_4a26_return_output := result.u16_addr;

     -- CONST_SR_4[uxn_device_h_l183_c22_dcea] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l183_c22_dcea_x <= VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output := CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l218_c45_fb84] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left <= VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_left;
     BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right <= VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output := BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l186_c7_97b9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_97b9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_AND[uxn_device_h_l228_c33_1cbd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left <= VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_left;
     BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right <= VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output := BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l192_c3_db69] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l192_c3_db69_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l214_l226_DUPLICATE_9944 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l214_l226_DUPLICATE_9944_return_output := result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_device_h_l247_c37_12fb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left <= VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_left;
     BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right <= VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output := BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l192_l214_DUPLICATE_5e11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l192_l214_DUPLICATE_5e11_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l190_c11_8360] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l190_c11_8360_left <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_left;
     BIN_OP_EQ_uxn_device_h_l190_c11_8360_right <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output := BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;

     -- CONST_SR_5[uxn_device_h_l182_c22_cbbd] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l182_c22_cbbd_x <= VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output := CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l162_c19_ba63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left <= VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_left;
     BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right <= VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output := BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output;

     -- BIN_OP_EQ[uxn_device_h_l163_c20_3a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left <= VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_left;
     BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right <= VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output := BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853_return_output := result.u8_value;

     -- BIN_OP_AND[uxn_device_h_l194_c11_2169] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l194_c11_2169_left <= VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_left;
     BIN_OP_AND_uxn_device_h_l194_c11_2169_right <= VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output := BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output;

     -- BIN_OP_EQ[uxn_device_h_l177_c11_8877] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l177_c11_8877_left <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_left;
     BIN_OP_EQ_uxn_device_h_l177_c11_8877_right <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output := BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;

     -- MUX[uxn_device_h_l199_c13_548b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l199_c13_548b_cond <= VAR_MUX_uxn_device_h_l199_c13_548b_cond;
     MUX_uxn_device_h_l199_c13_548b_iftrue <= VAR_MUX_uxn_device_h_l199_c13_548b_iftrue;
     MUX_uxn_device_h_l199_c13_548b_iffalse <= VAR_MUX_uxn_device_h_l199_c13_548b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l199_c13_548b_return_output := MUX_uxn_device_h_l199_c13_548b_return_output;

     -- uint8_2_2[uxn_device_h_l213_c18_689b] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l213_c18_689b_return_output := uint8_2_2(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l174_c7_7dae] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l174_c7_7dae_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l167_l226_DUPLICATE_fea6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l167_l226_DUPLICATE_fea6_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l177_c7_954f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_954f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- CONST_SR_7[uxn_device_h_l180_c25_262f] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l180_c25_262f_x <= VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_return_output := CONST_SR_7_uxn_device_h_l180_c25_262f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l186_c11_a1df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left <= VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_left;
     BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right <= VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output := BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;

     -- BIN_OP_EQ[uxn_device_h_l209_c11_dd1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left <= VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_left;
     BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right <= VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output := BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l179_c11_cf9c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l179_c11_cf9c_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l225_c11_af68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l225_c11_af68_left <= VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_left;
     BIN_OP_EQ_uxn_device_h_l225_c11_af68_right <= VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output := BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output := result.is_deo_done;

     -- BIN_OP_PLUS[uxn_device_h_l230_c32_18dc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left <= VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_left;
     BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right <= VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output := BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output;

     -- uint8_0_0[uxn_device_h_l211_c15_63c7] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- result_device_ram_address_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_cond;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output := result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l245_c37_dc54] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left <= VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_left;
     BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right <= VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output := BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output;

     -- Submodule level 1
     VAR_tmp8_uxn_device_h_l194_c4_beb9 := resize(VAR_BIN_OP_AND_uxn_device_h_l194_c11_2169_return_output, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue := VAR_BIN_OP_AND_uxn_device_h_l228_c33_1cbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_color_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_layer_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_result_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_x_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_y_MUX_uxn_device_h_l161_c2_824e_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c6_f52a_return_output;
     VAR_MUX_uxn_device_h_l162_c19_57d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l162_c19_ba63_return_output;
     VAR_MUX_uxn_device_h_l163_c20_6e68_cond := VAR_BIN_OP_EQ_uxn_device_h_l163_c20_3a2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_color_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_layer_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_y_MUX_uxn_device_h_l174_c7_7dae_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_ff26_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_x_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_954f_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_8877_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_result_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_x_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_y_MUX_uxn_device_h_l186_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_a1df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_b8ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_8360_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_result_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond := VAR_BIN_OP_EQ_uxn_device_h_l209_c11_dd1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond := VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output;
     VAR_result_MUX_uxn_device_h_l225_c7_8eb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l225_c11_af68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_318e_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_ad74_return_output;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_phase := VAR_BIN_OP_MINUS_uxn_device_h_l245_c37_dc54_return_output;
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_phase := VAR_BIN_OP_MINUS_uxn_device_h_l247_c37_12fb_return_output;
     VAR_MUX_uxn_device_h_l218_c22_eb78_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l218_c35_db5f_return_output, 8);
     VAR_MUX_uxn_device_h_l218_c22_eb78_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l218_c45_fb84_return_output, 8);
     VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output;
     VAR_x_MUX_uxn_device_h_l186_c7_97b9_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l191_l240_l187_l234_DUPLICATE_2081_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l179_c11_cf9c_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l192_l214_DUPLICATE_4a26_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l192_l214_DUPLICATE_4a26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l214_l192_l198_l226_DUPLICATE_cd20_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l214_l226_DUPLICATE_9944_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l214_l226_DUPLICATE_9944_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l192_l214_DUPLICATE_5e11_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l192_l214_DUPLICATE_5e11_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l167_l226_DUPLICATE_fea6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l167_l226_DUPLICATE_fea6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l192_l214_l226_DUPLICATE_3853_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_right := VAR_MUX_uxn_device_h_l199_c13_548b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_right := VAR_MUX_uxn_device_h_l200_c13_0a38_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_7dae_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l174_c7_7dae_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_954f_return_output;
     VAR_result_MUX_uxn_device_h_l186_c7_97b9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_97b9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l192_c3_db69_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left := VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output;
     VAR_MUX_uxn_device_h_l218_c22_eb78_cond := VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output;
     VAR_MUX_uxn_device_h_l219_c32_d9ee_cond := VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue := VAR_uint8_0_0_uxn_device_h_l211_c15_63c7_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right := VAR_uint8_1_1_uxn_device_h_l212_c15_99d7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue := VAR_uint8_1_1_uxn_device_h_l212_c15_99d7_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue := VAR_uint8_2_2_uxn_device_h_l213_c18_689b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_left := VAR_tmp8_uxn_device_h_l194_c4_beb9;
     VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse := VAR_tmp8_uxn_device_h_l194_c4_beb9;
     -- y_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_y_MUX_uxn_device_h_l190_c7_b8ae_cond;
     y_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     y_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l190_c7_b8ae_return_output := y_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- color_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_color_MUX_uxn_device_h_l177_c7_954f_cond;
     color_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_color_MUX_uxn_device_h_l177_c7_954f_iftrue;
     color_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_color_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l177_c7_954f_return_output := color_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- x_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_x_MUX_uxn_device_h_l186_c7_97b9_cond;
     x_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_x_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     x_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_x_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l186_c7_97b9_return_output := x_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_cond;
     result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output := result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_cond;
     result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output := result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- BIN_OP_OR[uxn_device_h_l240_c3_a211] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l240_c3_a211_left <= VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_left;
     BIN_OP_OR_uxn_device_h_l240_c3_a211_right <= VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output := BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output;

     -- MUX[uxn_device_h_l218_c22_eb78] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l218_c22_eb78_cond <= VAR_MUX_uxn_device_h_l218_c22_eb78_cond;
     MUX_uxn_device_h_l218_c22_eb78_iftrue <= VAR_MUX_uxn_device_h_l218_c22_eb78_iftrue;
     MUX_uxn_device_h_l218_c22_eb78_iffalse <= VAR_MUX_uxn_device_h_l218_c22_eb78_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l218_c22_eb78_return_output := MUX_uxn_device_h_l218_c22_eb78_return_output;

     -- auto_advance_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_cond;
     auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output := auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- ctrl_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_cond;
     ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iftrue;
     ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_return_output := ctrl_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_auto_x_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_cond;
     is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output := is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l230_c22_0dbc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l230_c22_0dbc_return_output := CAST_TO_uint8_t_uint17_t(
     VAR_BIN_OP_PLUS_uxn_device_h_l230_c32_18dc_return_output);

     -- result_u16_addr_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_cond;
     result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output := result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output := CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l180_c15_b743] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l180_c15_b743_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l180_c25_262f_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l182_c12_7be0] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l182_c12_7be0_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l182_c22_cbbd_return_output);

     -- MUX[uxn_device_h_l219_c32_d9ee] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l219_c32_d9ee_cond <= VAR_MUX_uxn_device_h_l219_c32_d9ee_cond;
     MUX_uxn_device_h_l219_c32_d9ee_iftrue <= VAR_MUX_uxn_device_h_l219_c32_d9ee_iftrue;
     MUX_uxn_device_h_l219_c32_d9ee_iffalse <= VAR_MUX_uxn_device_h_l219_c32_d9ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l219_c32_d9ee_return_output := MUX_uxn_device_h_l219_c32_d9ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l181_c11_c9f5] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l181_c11_c9f5_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l181_c21_a90d_return_output);

     -- BIN_OP_OR[uxn_device_h_l199_c5_a426] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l199_c5_a426_left <= VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_left;
     BIN_OP_OR_uxn_device_h_l199_c5_a426_right <= VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output := BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l198_c4_17bb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_cond;
     result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output := result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output;

     -- MUX[uxn_device_h_l163_c20_6e68] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l163_c20_6e68_cond <= VAR_MUX_uxn_device_h_l163_c20_6e68_cond;
     MUX_uxn_device_h_l163_c20_6e68_iftrue <= VAR_MUX_uxn_device_h_l163_c20_6e68_iftrue;
     MUX_uxn_device_h_l163_c20_6e68_iffalse <= VAR_MUX_uxn_device_h_l163_c20_6e68_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l163_c20_6e68_return_output := MUX_uxn_device_h_l163_c20_6e68_return_output;

     -- is_auto_y_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_cond;
     is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output := is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l226_c3_5fcf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_cond;
     result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output := result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output;

     -- MUX[uxn_device_h_l162_c19_57d0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l162_c19_57d0_cond <= VAR_MUX_uxn_device_h_l162_c19_57d0_cond;
     MUX_uxn_device_h_l162_c19_57d0_iftrue <= VAR_MUX_uxn_device_h_l162_c19_57d0_iftrue;
     MUX_uxn_device_h_l162_c19_57d0_iffalse <= VAR_MUX_uxn_device_h_l162_c19_57d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l162_c19_57d0_return_output := MUX_uxn_device_h_l162_c19_57d0_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l183_c12_0593] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l183_c12_0593_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l183_c22_dcea_return_output);

     -- is_auto_addr_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_cond;
     is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output := is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l226_c3_5fcf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_cond;
     result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output := result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l226_c3_5fcf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_cond;
     result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output := result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_left := VAR_BIN_OP_OR_uxn_device_h_l199_c5_a426_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l240_c3_a211_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l220_l217_DUPLICATE_f00e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l180_c15_b743_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l181_c11_c9f5_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l182_c12_7be0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l183_c12_0593_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l230_c22_0dbc_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left := VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse := VAR_CONST_SL_8_uint16_t_uxn_device_h_l235_l195_DUPLICATE_5f5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_left := VAR_MUX_uxn_device_h_l162_c19_57d0_return_output;
     VAR_MUX_uxn_device_h_l168_c32_3086_cond := VAR_MUX_uxn_device_h_l162_c19_57d0_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue := VAR_MUX_uxn_device_h_l162_c19_57d0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_right := VAR_MUX_uxn_device_h_l163_c20_6e68_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue := VAR_MUX_uxn_device_h_l163_c20_6e68_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue := VAR_MUX_uxn_device_h_l218_c22_eb78_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue := VAR_MUX_uxn_device_h_l219_c32_d9ee_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_auto_advance_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_color_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_color_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_ctrl_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_is_auto_addr_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l198_c4_17bb_return_output;
     VAR_x_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_x_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_y_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_y_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     -- auto_advance_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_cond;
     auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output := auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- MUX[uxn_device_h_l168_c32_3086] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l168_c32_3086_cond <= VAR_MUX_uxn_device_h_l168_c32_3086_cond;
     MUX_uxn_device_h_l168_c32_3086_iftrue <= VAR_MUX_uxn_device_h_l168_c32_3086_iftrue;
     MUX_uxn_device_h_l168_c32_3086_iffalse <= VAR_MUX_uxn_device_h_l168_c32_3086_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l168_c32_3086_return_output := MUX_uxn_device_h_l168_c32_3086_return_output;

     -- ram_addr_MUX[uxn_device_h_l226_c3_5fcf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond <= VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_cond;
     ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iftrue;
     ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output := ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output;

     -- color_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_color_MUX_uxn_device_h_l174_c7_7dae_cond;
     color_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_color_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     color_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_color_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l174_c7_7dae_return_output := color_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_cond;
     result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output := result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l226_c3_5fcf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond <= VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_cond;
     result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iftrue;
     result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output := result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output;

     -- result_u8_value_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_cond;
     result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output := result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_cond;
     ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output := ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- x_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_x_MUX_uxn_device_h_l177_c7_954f_cond;
     x_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_x_MUX_uxn_device_h_l177_c7_954f_iftrue;
     x_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_x_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l177_c7_954f_return_output := x_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_cond;
     is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output := is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- flip_x_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_cond;
     flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iftrue;
     flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_return_output := flip_x_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- flip_y_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_cond;
     flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iftrue;
     flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_return_output := flip_y_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- layer_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_layer_MUX_uxn_device_h_l177_c7_954f_cond;
     layer_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_layer_MUX_uxn_device_h_l177_c7_954f_iftrue;
     layer_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_layer_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l177_c7_954f_return_output := layer_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_auto_y_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_cond;
     is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output := is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- y_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_y_MUX_uxn_device_h_l186_c7_97b9_cond;
     y_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_y_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     y_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_y_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l186_c7_97b9_return_output := y_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- BIN_OP_OR[uxn_device_h_l164_c21_977a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l164_c21_977a_left <= VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_left;
     BIN_OP_OR_uxn_device_h_l164_c21_977a_right <= VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output := BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_cond;
     result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output := result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- BIN_OP_OR[uxn_device_h_l200_c5_ce13] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l200_c5_ce13_left <= VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_left;
     BIN_OP_OR_uxn_device_h_l200_c5_ce13_right <= VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output := BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output;

     -- is_auto_addr_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_cond;
     is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output := is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l220_c27_dae7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output := UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output;

     -- ctrl_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_cond;
     ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output := ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- is_auto_x_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_cond;
     is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output := is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- ram_addr_MUX[uxn_device_h_l238_c7_318e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l238_c7_318e_cond <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_cond;
     ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iftrue;
     ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output := ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l195_c23_097d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_left;
     BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output := BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_cond;
     is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output := is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond := VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond := VAR_BIN_OP_OR_uxn_device_h_l164_c21_977a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue := VAR_BIN_OP_OR_uxn_device_h_l200_c5_ce13_return_output;
     VAR_result_u16_addr_uxn_device_h_l195_c4_647e := resize(VAR_BIN_OP_PLUS_uxn_device_h_l195_c23_097d_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue := VAR_MUX_uxn_device_h_l168_c32_3086_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l220_c27_dae7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_color_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_color_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_ctrl_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_flip_x_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_flip_y_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_is_auto_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_layer_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue := VAR_ram_addr_MUX_uxn_device_h_l226_c3_5fcf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse := VAR_ram_addr_MUX_uxn_device_h_l238_c7_318e_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_x_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_y_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue := VAR_result_u16_addr_uxn_device_h_l195_c4_647e;
     -- flip_y_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_cond;
     flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output := flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- ctrl_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_cond;
     ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iftrue;
     ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_return_output := ctrl_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l167_c3_2dae] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_cond;
     result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output := result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- x_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_x_MUX_uxn_device_h_l174_c7_7dae_cond;
     x_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     x_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_7dae_return_output := x_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- ram_addr_MUX[uxn_device_h_l225_c7_8eb1] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond <= VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_cond;
     ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iftrue;
     ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output := ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output;

     -- color_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_color_MUX_uxn_device_h_l161_c2_824e_cond;
     color_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_color_MUX_uxn_device_h_l161_c2_824e_iftrue;
     color_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_color_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l161_c2_824e_return_output := color_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_cond;
     result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output := result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_30c3[uxn_device_h_l225_c7_8eb1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_30c3_uxn_device_h_l225_c7_8eb1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_30c3(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l226_c3_5fcf_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l226_c3_5fcf_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l226_c3_5fcf_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l226_c3_5fcf_return_output);

     -- is_drawing_port_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_cond;
     is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output := is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- flip_x_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_cond;
     flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output := flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- y_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_y_MUX_uxn_device_h_l177_c7_954f_cond;
     y_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_y_MUX_uxn_device_h_l177_c7_954f_iftrue;
     y_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_y_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c7_954f_return_output := y_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_auto_y_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_cond;
     is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output := is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- is_auto_addr_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_cond;
     is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output := is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- tmp8_MUX[uxn_device_h_l198_c4_17bb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l198_c4_17bb_cond <= VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_cond;
     tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iftrue;
     tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output := tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output;

     -- layer_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_layer_MUX_uxn_device_h_l174_c7_7dae_cond;
     layer_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     layer_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_layer_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l174_c7_7dae_return_output := layer_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- auto_advance_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_cond;
     auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output := auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_cond;
     ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output := ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l214_c3_819a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_cond;
     result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output := result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l167_c3_2dae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_cond;
     result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output := result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output;

     -- is_auto_x_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_cond;
     is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output := is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l186_c7_97b9_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_flip_x_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_flip_y_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_is_auto_addr_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l186_c7_97b9_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_layer_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_layer_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse := VAR_ram_addr_MUX_uxn_device_h_l225_c7_8eb1_return_output;
     VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_30c3_uxn_device_h_l225_c7_8eb1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue := VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output;
     VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue := VAR_tmp8_MUX_uxn_device_h_l198_c4_17bb_return_output;
     VAR_x_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_y_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_y_MUX_uxn_device_h_l177_c7_954f_return_output;
     -- x_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_x_MUX_uxn_device_h_l161_c2_824e_cond;
     x_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_x_MUX_uxn_device_h_l161_c2_824e_iftrue;
     x_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_x_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l161_c2_824e_return_output := x_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- tmp8_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_cond;
     tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iftrue;
     tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_return_output := tmp8_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- flip_y_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_cond;
     flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iftrue;
     flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_return_output := flip_y_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- is_auto_y_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_cond;
     is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iftrue;
     is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output := is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l161_c2_824e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l161_c2_824e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l167_c3_2dae_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l167_c3_2dae_return_output);

     -- flip_x_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_cond;
     flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iftrue;
     flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_return_output := flip_x_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- auto_advance_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_cond;
     auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iftrue;
     auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output := auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_cond;
     ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output := ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- is_auto_addr_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_cond;
     is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iftrue;
     is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output := is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- is_auto_x_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_cond;
     is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iftrue;
     is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output := is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- result_u8_value_MUX[uxn_device_h_l192_c3_db69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_cond;
     result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iftrue;
     result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output := result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output;

     -- layer_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_layer_MUX_uxn_device_h_l161_c2_824e_cond;
     layer_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_layer_MUX_uxn_device_h_l161_c2_824e_iftrue;
     layer_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_layer_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l161_c2_824e_return_output := layer_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7e09[uxn_device_h_l209_c7_17ce] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7e09_uxn_device_h_l209_c7_17ce_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_7e09(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l214_c3_819a_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l214_c3_819a_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l214_c3_819a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l214_c3_819a_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l214_c3_819a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l214_c3_819a_return_output);

     -- y_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_y_MUX_uxn_device_h_l174_c7_7dae_cond;
     y_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_y_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     y_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_y_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l174_c7_7dae_return_output := y_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_cond;
     ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output := ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_auto_advance_MUX_uxn_device_h_l177_c7_954f_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_is_auto_addr_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l177_c7_954f_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_ram_addr_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_result_MUX_uxn_device_h_l161_c2_824e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l161_c2_824e_return_output;
     VAR_result_MUX_uxn_device_h_l209_c7_17ce_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7e09_uxn_device_h_l209_c7_17ce_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue := VAR_tmp8_MUX_uxn_device_h_l192_c3_db69_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_y_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_y_MUX_uxn_device_h_l174_c7_7dae_return_output;
     -- y_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_y_MUX_uxn_device_h_l161_c2_824e_cond;
     y_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_y_MUX_uxn_device_h_l161_c2_824e_iftrue;
     y_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_y_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l161_c2_824e_return_output := y_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6243[uxn_device_h_l190_c7_b8ae] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6243_uxn_device_h_l190_c7_b8ae_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_6243(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l192_c3_db69_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l192_c3_db69_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l192_c3_db69_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l192_c3_db69_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l192_c3_db69_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l192_c3_db69_return_output);

     -- is_auto_addr_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_cond;
     is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output := is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- auto_advance_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_cond;
     auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output := auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- is_auto_x_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_cond;
     is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output := is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- is_auto_y_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_cond;
     is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output := is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- tmp8_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_cond;
     tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output := tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- ram_addr_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_cond;
     ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output := ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_is_auto_addr_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6243_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_tmp8_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l161_c2_824e_return_output;
     -- is_auto_addr_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_cond;
     is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output := is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_cond;
     auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output := auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- ram_addr_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_cond;
     ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output := ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- is_auto_x_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_cond;
     is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output := is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l225_c7_8eb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output;

     -- is_auto_y_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_cond;
     is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iftrue;
     is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output := is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- tmp8_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_cond;
     tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output := tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l225_c7_8eb1_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_is_auto_addr := VAR_is_auto_addr_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_tmp8_MUX_uxn_device_h_l186_c7_97b9_return_output;
     -- ram_addr_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_cond;
     ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iftrue;
     ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output := ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- tmp8_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_cond;
     tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iftrue;
     tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_return_output := tmp8_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_318e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_318e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_ram_addr_MUX_uxn_device_h_l177_c7_954f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_tmp8_MUX_uxn_device_h_l177_c7_954f_return_output;
     -- tmp8_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_cond;
     tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output := tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- ram_addr_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output := ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l242_c1_99bd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l242_c1_99bd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_7dae_return_output;
     VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_tmp8_MUX_uxn_device_h_l174_c7_7dae_return_output;
     -- tmp8_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_cond;
     tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iftrue;
     tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_return_output := tmp8_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l246_c1_b26d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output;

     -- ram_addr_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_cond;
     ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iftrue;
     ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output := ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l244_c1_05e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output;

     -- Submodule level 10
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l246_c1_b26d_return_output;
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l244_c1_05e1_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l161_c2_824e_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l161_c2_824e_return_output;
     -- screen_1bpp[uxn_device_h_l247_c25_508d] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l247_c25_508d_phase <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_phase;
     screen_1bpp_uxn_device_h_l247_c25_508d_x1 <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_x1;
     screen_1bpp_uxn_device_h_l247_c25_508d_y1 <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_y1;
     screen_1bpp_uxn_device_h_l247_c25_508d_color <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_color;
     screen_1bpp_uxn_device_h_l247_c25_508d_fx <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fx;
     screen_1bpp_uxn_device_h_l247_c25_508d_fy <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_fy;
     screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_ram_addr;
     screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l247_c25_508d_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l247_c25_508d_return_output := screen_1bpp_uxn_device_h_l247_c25_508d_return_output;

     -- screen_2bpp[uxn_device_h_l245_c25_3f3c] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l245_c25_3f3c_phase <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_phase;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_x1 <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_x1;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_y1 <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_y1;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_color <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_color;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_fx <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fx;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_fy <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_fy;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_ram_addr;
     screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output := screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output;

     -- Submodule level 11
     VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse := VAR_screen_1bpp_uxn_device_h_l247_c25_508d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue := VAR_screen_2bpp_uxn_device_h_l245_c25_3f3c_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l244_c3_4309] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_cond;
     screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iftrue;
     screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output := screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output;

     -- Submodule level 12
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output;
     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l255_c21_b83e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l255_c21_b83e_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l253_c21_d63b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l253_c21_d63b_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l256_c24_70f6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l256_c24_70f6_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output.is_blit_done;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l252_c26_a93f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l252_c26_a93f_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l244_c3_4309_return_output.is_vram_write;

     -- screen_blit_result_MUX[uxn_device_h_l238_c7_318e] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_cond;
     screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iftrue;
     screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output := screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output;

     -- Submodule level 13
     VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_318e_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba[uxn_device_h_l238_c7_318e] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l238_c7_318e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l251_c3_8079,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l252_c26_a93f_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l253_c21_d63b_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l255_c21_b83e_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l256_c24_70f6_return_output);

     -- screen_blit_result_MUX[uxn_device_h_l225_c7_8eb1] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_cond;
     screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue;
     screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output := screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l238_c7_318e_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_a3ba_uxn_device_h_l238_c7_318e_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l225_c7_8eb1_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_cond;
     screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output := screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- result_MUX[uxn_device_h_l238_c7_318e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l238_c7_318e_cond <= VAR_result_MUX_uxn_device_h_l238_c7_318e_cond;
     result_MUX_uxn_device_h_l238_c7_318e_iftrue <= VAR_result_MUX_uxn_device_h_l238_c7_318e_iftrue;
     result_MUX_uxn_device_h_l238_c7_318e_iffalse <= VAR_result_MUX_uxn_device_h_l238_c7_318e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l238_c7_318e_return_output := result_MUX_uxn_device_h_l238_c7_318e_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse := VAR_result_MUX_uxn_device_h_l238_c7_318e_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l209_c7_17ce_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_cond;
     screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output := screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- result_MUX[uxn_device_h_l225_c7_8eb1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l225_c7_8eb1_cond <= VAR_result_MUX_uxn_device_h_l225_c7_8eb1_cond;
     result_MUX_uxn_device_h_l225_c7_8eb1_iftrue <= VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iftrue;
     result_MUX_uxn_device_h_l225_c7_8eb1_iffalse <= VAR_result_MUX_uxn_device_h_l225_c7_8eb1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l225_c7_8eb1_return_output := result_MUX_uxn_device_h_l225_c7_8eb1_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l209_c7_17ce_iffalse := VAR_result_MUX_uxn_device_h_l225_c7_8eb1_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     -- result_MUX[uxn_device_h_l209_c7_17ce] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l209_c7_17ce_cond <= VAR_result_MUX_uxn_device_h_l209_c7_17ce_cond;
     result_MUX_uxn_device_h_l209_c7_17ce_iftrue <= VAR_result_MUX_uxn_device_h_l209_c7_17ce_iftrue;
     result_MUX_uxn_device_h_l209_c7_17ce_iffalse <= VAR_result_MUX_uxn_device_h_l209_c7_17ce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l209_c7_17ce_return_output := result_MUX_uxn_device_h_l209_c7_17ce_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_cond;
     screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output := screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse := VAR_result_MUX_uxn_device_h_l209_c7_17ce_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l186_c7_97b9_return_output;
     -- result_MUX[uxn_device_h_l190_c7_b8ae] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l190_c7_b8ae_cond <= VAR_result_MUX_uxn_device_h_l190_c7_b8ae_cond;
     result_MUX_uxn_device_h_l190_c7_b8ae_iftrue <= VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iftrue;
     result_MUX_uxn_device_h_l190_c7_b8ae_iffalse <= VAR_result_MUX_uxn_device_h_l190_c7_b8ae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l190_c7_b8ae_return_output := result_MUX_uxn_device_h_l190_c7_b8ae_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_cond;
     screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iftrue;
     screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output := screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l186_c7_97b9_iffalse := VAR_result_MUX_uxn_device_h_l190_c7_b8ae_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l177_c7_954f_return_output;
     -- result_MUX[uxn_device_h_l186_c7_97b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l186_c7_97b9_cond <= VAR_result_MUX_uxn_device_h_l186_c7_97b9_cond;
     result_MUX_uxn_device_h_l186_c7_97b9_iftrue <= VAR_result_MUX_uxn_device_h_l186_c7_97b9_iftrue;
     result_MUX_uxn_device_h_l186_c7_97b9_iffalse <= VAR_result_MUX_uxn_device_h_l186_c7_97b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l186_c7_97b9_return_output := result_MUX_uxn_device_h_l186_c7_97b9_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_cond;
     screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output := screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l177_c7_954f_iffalse := VAR_result_MUX_uxn_device_h_l186_c7_97b9_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l174_c7_7dae_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_cond;
     screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iftrue;
     screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output := screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- result_MUX[uxn_device_h_l177_c7_954f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l177_c7_954f_cond <= VAR_result_MUX_uxn_device_h_l177_c7_954f_cond;
     result_MUX_uxn_device_h_l177_c7_954f_iftrue <= VAR_result_MUX_uxn_device_h_l177_c7_954f_iftrue;
     result_MUX_uxn_device_h_l177_c7_954f_iffalse <= VAR_result_MUX_uxn_device_h_l177_c7_954f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l177_c7_954f_return_output := result_MUX_uxn_device_h_l177_c7_954f_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l174_c7_7dae_iffalse := VAR_result_MUX_uxn_device_h_l177_c7_954f_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l161_c2_824e_return_output;
     -- result_MUX[uxn_device_h_l174_c7_7dae] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_7dae_cond <= VAR_result_MUX_uxn_device_h_l174_c7_7dae_cond;
     result_MUX_uxn_device_h_l174_c7_7dae_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_7dae_iftrue;
     result_MUX_uxn_device_h_l174_c7_7dae_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_7dae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_7dae_return_output := result_MUX_uxn_device_h_l174_c7_7dae_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l161_c2_824e_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_7dae_return_output;
     -- result_MUX[uxn_device_h_l161_c2_824e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l161_c2_824e_cond <= VAR_result_MUX_uxn_device_h_l161_c2_824e_cond;
     result_MUX_uxn_device_h_l161_c2_824e_iftrue <= VAR_result_MUX_uxn_device_h_l161_c2_824e_iftrue;
     result_MUX_uxn_device_h_l161_c2_824e_iffalse <= VAR_result_MUX_uxn_device_h_l161_c2_824e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l161_c2_824e_return_output := result_MUX_uxn_device_h_l161_c2_824e_return_output;

     -- Submodule level 22
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l161_c2_824e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l161_c2_824e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_pixel_port <= REG_VAR_is_pixel_port;
REG_COMB_is_sprite_port <= REG_VAR_is_sprite_port;
REG_COMB_is_drawing_port <= REG_VAR_is_drawing_port;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_auto_x <= REG_VAR_is_auto_x;
REG_COMB_is_auto_y <= REG_VAR_is_auto_y;
REG_COMB_is_auto_addr <= REG_VAR_is_auto_addr;
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
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     tmp8 <= REG_COMB_tmp8;
     color <= REG_COMB_color;
     is_pixel_port <= REG_COMB_is_pixel_port;
     is_sprite_port <= REG_COMB_is_sprite_port;
     is_drawing_port <= REG_COMB_is_drawing_port;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_auto_x <= REG_COMB_is_auto_x;
     is_auto_y <= REG_COMB_is_auto_y;
     is_auto_addr <= REG_COMB_is_auto_addr;
     result <= REG_COMB_result;
     screen_blit_result <= REG_COMB_screen_blit_result;
 end if;
 end if;
end process;

end arch;
