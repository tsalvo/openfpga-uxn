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
-- Submodules: 97
entity step_gpu_0CLK_a341b2ce is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(15 downto 0);
 vram_value : in unsigned(7 downto 0);
 cycle : in unsigned(31 downto 0);
 enable_buffer_swap : in unsigned(0 downto 0);
 swap_buffers : in unsigned(0 downto 0);
 return_output : out gpu_step_result_t);
end step_gpu_0CLK_a341b2ce;
architecture arch of step_gpu_0CLK_a341b2ce is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : gpu_step_result_t := (
color => to_unsigned(0, 2),
is_new_frame => to_unsigned(0, 1))
;
signal queue_read_ptr : unsigned(9 downto 0) := to_unsigned(0, 10);
signal queue_write_ptr : unsigned(9 downto 0) := to_unsigned(0, 10);
signal current_queue_item : draw_command_t := (
vram_address => to_unsigned(0, 16),
color => to_unsigned(0, 2),
layer => to_unsigned(0, 1),
is_fill => to_unsigned(0, 1),
fill_left => to_unsigned(0, 1),
fill_top => to_unsigned(0, 1),
is_valid => to_unsigned(0, 1))
;
signal queue_write_value : unsigned(23 downto 0) := to_unsigned(0, 24);
signal queue_read_value : unsigned(23 downto 0) := to_unsigned(0, 24);
signal queue_write_enable : unsigned(0 downto 0) := to_unsigned(0, 1);
signal queue_phase : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_buffer_swapped : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_x0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y0 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_x1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_y1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_new_fill_row : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_last_fill_col : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_top : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_left : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_caught_up : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_read_ready : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_queue_read_ptr : unsigned(9 downto 0);
signal REG_COMB_queue_write_ptr : unsigned(9 downto 0);
signal REG_COMB_current_queue_item : draw_command_t;
signal REG_COMB_queue_write_value : unsigned(23 downto 0);
signal REG_COMB_queue_read_value : unsigned(23 downto 0);
signal REG_COMB_queue_write_enable : unsigned(0 downto 0);
signal REG_COMB_queue_phase : unsigned(1 downto 0);
signal REG_COMB_is_buffer_swapped : unsigned(0 downto 0);
signal REG_COMB_fill_x0 : unsigned(15 downto 0);
signal REG_COMB_fill_y0 : unsigned(15 downto 0);
signal REG_COMB_fill_x1 : unsigned(15 downto 0);
signal REG_COMB_fill_y1 : unsigned(15 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_new_fill_row : unsigned(0 downto 0);
signal REG_COMB_is_last_fill_col : unsigned(0 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_is_fill_top : unsigned(0 downto 0);
signal REG_COMB_is_fill_left : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_is_caught_up : unsigned(0 downto 0);
signal REG_COMB_is_read_ready : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_XOR[uxn_c_l157_c2_3542]
signal BIN_OP_XOR_uxn_c_l157_c2_3542_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_3542_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_3542_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_0a27]
signal BIN_OP_EQ_uxn_c_l158_c17_0a27_left : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_0a27_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_dae4]
signal MUX_uxn_c_l158_c17_dae4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dae4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dae4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dae4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_ad48]
signal BIN_OP_EQ_uxn_c_l159_c18_ad48_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_ad48_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_b12c]
signal MUX_uxn_c_l159_c18_b12c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_b12c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_b12c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_b12c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_a860]
signal UNARY_OP_NOT_uxn_c_l161_c7_a860_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_25e6]
signal UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_358e]
signal BIN_OP_AND_uxn_c_l161_c7_358e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_358e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_358e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_442e]
signal BIN_OP_AND_uxn_c_l161_c7_442e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_442e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_442e_return_output : unsigned(0 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_a282]
signal current_queue_item_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_a282_return_output : draw_command_t;

-- queue_read_ptr_MUX[uxn_c_l161_c2_a282]
signal queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l161_c2_a282]
signal queue_phase_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_a282_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_a282_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_a282_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_a749]
signal BIN_OP_PLUS_uxn_c_l170_c3_a749_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_a749_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output : unsigned(10 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_9f5f]
signal queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(9 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_9f5f]
signal queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(23 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_9f5f]
signal queue_phase_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_f4a4]
signal BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output : unsigned(10 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_b8da]
signal BIN_OP_EQ_uxn_c_l182_c16_b8da_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_b8da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_935b]
signal BIN_OP_PLUS_uxn_c_l182_c39_935b_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_935b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_0faf]
signal MUX_uxn_c_l182_c16_0faf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_0faf_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_0faf_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_0faf_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_a40d]
signal BIN_OP_AND_uxn_c_l184_c6_a40d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_a40d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_a40d_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l184_c66_beaf]
signal UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_2779]
signal BIN_OP_AND_uxn_c_l184_c6_2779_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_2779_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_2779_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l184_c2_a077]
signal is_fill_active_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l184_c2_a077]
signal fill_y0_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l184_c2_a077]
signal fill_x0_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l184_c2_a077]
signal x_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l184_c2_a077]
signal fill_y1_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l184_c2_a077]
signal fill_color_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_a077_return_output : unsigned(1 downto 0);

-- is_fill_left_MUX[uxn_c_l184_c2_a077]
signal is_fill_left_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l184_c2_a077]
signal y_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l184_c2_a077]
signal fill_layer_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l184_c2_a077]
signal is_fill_top_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l184_c2_a077]
signal fill_x1_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l188_c13_a244]
signal MUX_uxn_c_l188_c13_a244_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_a244_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_a244_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_a244_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c28_5fb9]
signal BIN_OP_AND_uxn_c_l189_c28_5fb9_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_5fb9_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l189_c13_6ea2]
signal MUX_uxn_c_l189_c13_6ea2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_6ea2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_6ea2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_6ea2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l190_c13_3522]
signal MUX_uxn_c_l190_c13_3522_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_3522_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_3522_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_3522_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c32_d9e8]
signal BIN_OP_AND_uxn_c_l191_c32_d9e8_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_d9e8_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l191_c13_4916]
signal MUX_uxn_c_l191_c13_4916_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_4916_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_4916_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_4916_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l200_c52_5137]
signal BIN_OP_AND_uxn_c_l200_c52_5137_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_5137_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_5137_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l200_c52_7cf9]
signal MUX_uxn_c_l200_c52_7cf9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l200_c52_7cf9_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_7cf9_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_7cf9_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l200_c35_51ce]
signal BIN_OP_OR_uxn_c_l200_c35_51ce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_51ce_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_51ce_return_output : unsigned(16 downto 0);

-- CONST_SL_8[uxn_c_l201_c56_93d1]
signal CONST_SL_8_uxn_c_l201_c56_93d1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l201_c56_93d1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l201_c56_6b76]
signal BIN_OP_PLUS_uxn_c_l201_c56_6b76_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_6b76_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l201_c37_e57f]
signal MUX_uxn_c_l201_c37_e57f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c37_e57f_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_e57f_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_e57f_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l201_c108_2e7c]
signal UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c108_30e2]
signal BIN_OP_AND_uxn_c_l201_c108_30e2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_30e2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_30e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c108_4488]
signal MUX_uxn_c_l201_c108_4488_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c108_4488_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_4488_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_4488_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l201_c37_654f]
signal BIN_OP_OR_uxn_c_l201_c37_654f_left : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_654f_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_654f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l203_c21_019a]
signal BIN_OP_EQ_uxn_c_l203_c21_019a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_019a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_019a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l203_c21_532b]
signal MUX_uxn_c_l203_c21_532b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_532b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_532b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_532b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l204_c22_046b]
signal BIN_OP_EQ_uxn_c_l204_c22_046b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_046b_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_046b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l204_c22_41b6]
signal MUX_uxn_c_l204_c22_41b6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_41b6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_41b6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_41b6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l205_c25_956c]
signal BIN_OP_PLUS_uxn_c_l205_c25_956c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_956c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l205_c6_e742]
signal MUX_uxn_c_l205_c6_e742_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c6_e742_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_e742_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_e742_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l206_c34_9a54]
signal BIN_OP_PLUS_uxn_c_l206_c34_9a54_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_9a54_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l206_c6_3070]
signal MUX_uxn_c_l206_c6_3070_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l206_c6_3070_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_3070_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_3070_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l208_c46_c4a3]
signal UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l208_c27_8a0b]
signal BIN_OP_AND_uxn_c_l208_c27_8a0b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_8a0b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l209_c27_0043]
signal BIN_OP_AND_uxn_c_l209_c27_0043_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_0043_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_0043_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l214_c3_a497]
signal MUX_uxn_c_l214_c3_a497_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l214_c3_a497_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_a497_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_a497_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l215_c71_4c6f]
signal UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l215_c22_38e9]
signal BIN_OP_AND_uxn_c_l215_c22_38e9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_38e9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_38e9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l215_c3_ec0b]
signal BIN_OP_OR_uxn_c_l215_c3_ec0b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_ec0b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l211_c27_c760]
signal bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_c760_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_c760_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_c760_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l211_c27_c760_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_c760_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l221_c3_0e1d]
signal MUX_uxn_c_l221_c3_0e1d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c3_0e1d_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_0e1d_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_0e1d_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l222_c22_1d20]
signal BIN_OP_AND_uxn_c_l222_c22_1d20_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_1d20_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_1d20_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l222_c3_2cc7]
signal BIN_OP_OR_uxn_c_l222_c3_2cc7_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_2cc7_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l218_c27_03a0]
signal fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_03a0_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_03a0_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_03a0_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l218_c27_03a0_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_03a0_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l225_c21_1cf3]
signal draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_1cf3_read_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_1cf3_write_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_1cf3_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l225_c21_1cf3_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_1cf3_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l232_c38_fb82]
signal BIN_OP_AND_uxn_c_l232_c38_fb82_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_fb82_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_fb82_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l232_c38_dd0e]
signal UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l232_c19_6414]
signal MUX_uxn_c_l232_c19_6414_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_6414_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_6414_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_6414_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l234_c19_5984]
signal BIN_OP_EQ_uxn_c_l234_c19_5984_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_5984_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_5984_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l234_c76_2650]
signal BIN_OP_PLUS_uxn_c_l234_c76_2650_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_2650_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l234_c50_5434]
signal MUX_uxn_c_l234_c50_5434_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c50_5434_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_5434_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_5434_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l234_c19_c06d]
signal MUX_uxn_c_l234_c19_c06d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c19_c06d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_c06d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_c06d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l235_c25_07fc]
signal BIN_OP_EQ_uxn_c_l235_c25_07fc_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_07fc_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l235_c25_ba64]
signal MUX_uxn_c_l235_c25_ba64_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_ba64_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_ba64_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_ba64_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c17_8278]
signal BIN_OP_EQ_uxn_c_l236_c17_8278_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_8278_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_8278_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l236_c17_d335]
signal MUX_uxn_c_l236_c17_d335_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c17_d335_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_d335_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_d335_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output : unsigned(0 downto 0);

function uint24_15_0( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(15 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 0)));
return return_output;
end function;

function uint24_17_16( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(17 downto 16)));
return return_output;
end function;

function uint24_18_18( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(18- i);
      end loop;
return return_output;
end function;

function uint24_19_19( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(19- i);
      end loop;
return return_output;
end function;

function uint24_20_20( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(20- i);
      end loop;
return return_output;
end function;

function uint24_21_21( x : unsigned) return unsigned is
--variable x : unsigned(23 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(21- i);
      end loop;
return return_output;
end function;

function CONST_REF_RD_draw_command_t_draw_command_t_e099( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return draw_command_t is
 
  variable base : draw_command_t; 
  variable return_output : draw_command_t;
begin
      base.vram_address := ref_toks_0;
      base.color := ref_toks_1;
      base.fill_top := ref_toks_2;
      base.fill_left := ref_toks_3;
      base.is_fill := ref_toks_4;
      base.layer := ref_toks_5;
      base.is_valid := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function uint32_uint16_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(15 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(15 downto 0) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_uint5_16( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(4 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(20 downto 16) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function uint32_uint1_21( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(31 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(31 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    intermediate := (others => '0');
    intermediate(31 downto 0) := unsigned(inp);
    intermediate(21 downto 21) := x;
    
    return_output := intermediate(31 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_draw_command_t_draw_command_t_11bf( ref_toks_0 : draw_command_t;
 ref_toks_1 : unsigned) return draw_command_t is
 
  variable base : draw_command_t; 
  variable return_output : draw_command_t;
begin
      base := ref_toks_0;
      base.is_valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned) return gpu_step_result_t is
 
  variable base : gpu_step_result_t; 
  variable return_output : gpu_step_result_t;
begin
      base.is_new_frame := ref_toks_0;
      base.color := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_XOR_uxn_c_l157_c2_3542
BIN_OP_XOR_uxn_c_l157_c2_3542 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_3542_left,
BIN_OP_XOR_uxn_c_l157_c2_3542_right,
BIN_OP_XOR_uxn_c_l157_c2_3542_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_0a27
BIN_OP_EQ_uxn_c_l158_c17_0a27 : entity work.BIN_OP_EQ_uint10_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_0a27_left,
BIN_OP_EQ_uxn_c_l158_c17_0a27_right,
BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output);

-- MUX_uxn_c_l158_c17_dae4
MUX_uxn_c_l158_c17_dae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_dae4_cond,
MUX_uxn_c_l158_c17_dae4_iftrue,
MUX_uxn_c_l158_c17_dae4_iffalse,
MUX_uxn_c_l158_c17_dae4_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_ad48
BIN_OP_EQ_uxn_c_l159_c18_ad48 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_ad48_left,
BIN_OP_EQ_uxn_c_l159_c18_ad48_right,
BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output);

-- MUX_uxn_c_l159_c18_b12c
MUX_uxn_c_l159_c18_b12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_b12c_cond,
MUX_uxn_c_l159_c18_b12c_iftrue,
MUX_uxn_c_l159_c18_b12c_iffalse,
MUX_uxn_c_l159_c18_b12c_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_a860
UNARY_OP_NOT_uxn_c_l161_c7_a860 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_a860_expr,
UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_25e6
UNARY_OP_NOT_uxn_c_l161_c38_25e6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr,
UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_358e
BIN_OP_AND_uxn_c_l161_c7_358e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_358e_left,
BIN_OP_AND_uxn_c_l161_c7_358e_right,
BIN_OP_AND_uxn_c_l161_c7_358e_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_442e
BIN_OP_AND_uxn_c_l161_c7_442e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_442e_left,
BIN_OP_AND_uxn_c_l161_c7_442e_right,
BIN_OP_AND_uxn_c_l161_c7_442e_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_a282
current_queue_item_MUX_uxn_c_l161_c2_a282 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_a282_cond,
current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_a282_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_a282
queue_read_ptr_MUX_uxn_c_l161_c2_a282 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_a282
queue_phase_MUX_uxn_c_l161_c2_a282 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_a282_cond,
queue_phase_MUX_uxn_c_l161_c2_a282_iftrue,
queue_phase_MUX_uxn_c_l161_c2_a282_iffalse,
queue_phase_MUX_uxn_c_l161_c2_a282_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_a749
BIN_OP_PLUS_uxn_c_l170_c3_a749 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_a749_left,
BIN_OP_PLUS_uxn_c_l170_c3_a749_right,
BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_9f5f
queue_write_ptr_MUX_uxn_c_l173_c2_9f5f : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_9f5f
queue_write_value_MUX_uxn_c_l173_c2_9f5f : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond,
queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_9f5f
queue_phase_MUX_uxn_c_l173_c2_9f5f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_9f5f_cond,
queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue,
queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse,
queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_f4a4
BIN_OP_PLUS_uxn_c_l178_c3_f4a4 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left,
BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right,
BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_b8da
BIN_OP_EQ_uxn_c_l182_c16_b8da : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_b8da_left,
BIN_OP_EQ_uxn_c_l182_c16_b8da_right,
BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_935b
BIN_OP_PLUS_uxn_c_l182_c39_935b : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_935b_left,
BIN_OP_PLUS_uxn_c_l182_c39_935b_right,
BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output);

-- MUX_uxn_c_l182_c16_0faf
MUX_uxn_c_l182_c16_0faf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_0faf_cond,
MUX_uxn_c_l182_c16_0faf_iftrue,
MUX_uxn_c_l182_c16_0faf_iffalse,
MUX_uxn_c_l182_c16_0faf_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_a40d
BIN_OP_AND_uxn_c_l184_c6_a40d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_a40d_left,
BIN_OP_AND_uxn_c_l184_c6_a40d_right,
BIN_OP_AND_uxn_c_l184_c6_a40d_return_output);

-- UNARY_OP_NOT_uxn_c_l184_c66_beaf
UNARY_OP_NOT_uxn_c_l184_c66_beaf : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr,
UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_2779
BIN_OP_AND_uxn_c_l184_c6_2779 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_2779_left,
BIN_OP_AND_uxn_c_l184_c6_2779_right,
BIN_OP_AND_uxn_c_l184_c6_2779_return_output);

-- is_fill_active_MUX_uxn_c_l184_c2_a077
is_fill_active_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l184_c2_a077_cond,
is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue,
is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse,
is_fill_active_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_y0_MUX_uxn_c_l184_c2_a077
fill_y0_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l184_c2_a077_cond,
fill_y0_MUX_uxn_c_l184_c2_a077_iftrue,
fill_y0_MUX_uxn_c_l184_c2_a077_iffalse,
fill_y0_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_x0_MUX_uxn_c_l184_c2_a077
fill_x0_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l184_c2_a077_cond,
fill_x0_MUX_uxn_c_l184_c2_a077_iftrue,
fill_x0_MUX_uxn_c_l184_c2_a077_iffalse,
fill_x0_MUX_uxn_c_l184_c2_a077_return_output);

-- x_MUX_uxn_c_l184_c2_a077
x_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l184_c2_a077_cond,
x_MUX_uxn_c_l184_c2_a077_iftrue,
x_MUX_uxn_c_l184_c2_a077_iffalse,
x_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_y1_MUX_uxn_c_l184_c2_a077
fill_y1_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l184_c2_a077_cond,
fill_y1_MUX_uxn_c_l184_c2_a077_iftrue,
fill_y1_MUX_uxn_c_l184_c2_a077_iffalse,
fill_y1_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_color_MUX_uxn_c_l184_c2_a077
fill_color_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l184_c2_a077_cond,
fill_color_MUX_uxn_c_l184_c2_a077_iftrue,
fill_color_MUX_uxn_c_l184_c2_a077_iffalse,
fill_color_MUX_uxn_c_l184_c2_a077_return_output);

-- is_fill_left_MUX_uxn_c_l184_c2_a077
is_fill_left_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l184_c2_a077_cond,
is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue,
is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse,
is_fill_left_MUX_uxn_c_l184_c2_a077_return_output);

-- y_MUX_uxn_c_l184_c2_a077
y_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l184_c2_a077_cond,
y_MUX_uxn_c_l184_c2_a077_iftrue,
y_MUX_uxn_c_l184_c2_a077_iffalse,
y_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_layer_MUX_uxn_c_l184_c2_a077
fill_layer_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l184_c2_a077_cond,
fill_layer_MUX_uxn_c_l184_c2_a077_iftrue,
fill_layer_MUX_uxn_c_l184_c2_a077_iffalse,
fill_layer_MUX_uxn_c_l184_c2_a077_return_output);

-- is_fill_top_MUX_uxn_c_l184_c2_a077
is_fill_top_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l184_c2_a077_cond,
is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue,
is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse,
is_fill_top_MUX_uxn_c_l184_c2_a077_return_output);

-- fill_x1_MUX_uxn_c_l184_c2_a077
fill_x1_MUX_uxn_c_l184_c2_a077 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l184_c2_a077_cond,
fill_x1_MUX_uxn_c_l184_c2_a077_iftrue,
fill_x1_MUX_uxn_c_l184_c2_a077_iffalse,
fill_x1_MUX_uxn_c_l184_c2_a077_return_output);

-- MUX_uxn_c_l188_c13_a244
MUX_uxn_c_l188_c13_a244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_a244_cond,
MUX_uxn_c_l188_c13_a244_iftrue,
MUX_uxn_c_l188_c13_a244_iffalse,
MUX_uxn_c_l188_c13_a244_return_output);

-- BIN_OP_AND_uxn_c_l189_c28_5fb9
BIN_OP_AND_uxn_c_l189_c28_5fb9 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c28_5fb9_left,
BIN_OP_AND_uxn_c_l189_c28_5fb9_right,
BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output);

-- MUX_uxn_c_l189_c13_6ea2
MUX_uxn_c_l189_c13_6ea2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_6ea2_cond,
MUX_uxn_c_l189_c13_6ea2_iftrue,
MUX_uxn_c_l189_c13_6ea2_iffalse,
MUX_uxn_c_l189_c13_6ea2_return_output);

-- MUX_uxn_c_l190_c13_3522
MUX_uxn_c_l190_c13_3522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_3522_cond,
MUX_uxn_c_l190_c13_3522_iftrue,
MUX_uxn_c_l190_c13_3522_iffalse,
MUX_uxn_c_l190_c13_3522_return_output);

-- BIN_OP_AND_uxn_c_l191_c32_d9e8
BIN_OP_AND_uxn_c_l191_c32_d9e8 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c32_d9e8_left,
BIN_OP_AND_uxn_c_l191_c32_d9e8_right,
BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output);

-- MUX_uxn_c_l191_c13_4916
MUX_uxn_c_l191_c13_4916 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_4916_cond,
MUX_uxn_c_l191_c13_4916_iftrue,
MUX_uxn_c_l191_c13_4916_iffalse,
MUX_uxn_c_l191_c13_4916_return_output);

-- BIN_OP_AND_uxn_c_l200_c52_5137
BIN_OP_AND_uxn_c_l200_c52_5137 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l200_c52_5137_left,
BIN_OP_AND_uxn_c_l200_c52_5137_right,
BIN_OP_AND_uxn_c_l200_c52_5137_return_output);

-- MUX_uxn_c_l200_c52_7cf9
MUX_uxn_c_l200_c52_7cf9 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l200_c52_7cf9_cond,
MUX_uxn_c_l200_c52_7cf9_iftrue,
MUX_uxn_c_l200_c52_7cf9_iffalse,
MUX_uxn_c_l200_c52_7cf9_return_output);

-- BIN_OP_OR_uxn_c_l200_c35_51ce
BIN_OP_OR_uxn_c_l200_c35_51ce : entity work.BIN_OP_OR_uint16_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l200_c35_51ce_left,
BIN_OP_OR_uxn_c_l200_c35_51ce_right,
BIN_OP_OR_uxn_c_l200_c35_51ce_return_output);

-- CONST_SL_8_uxn_c_l201_c56_93d1
CONST_SL_8_uxn_c_l201_c56_93d1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l201_c56_93d1_x,
CONST_SL_8_uxn_c_l201_c56_93d1_return_output);

-- BIN_OP_PLUS_uxn_c_l201_c56_6b76
BIN_OP_PLUS_uxn_c_l201_c56_6b76 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l201_c56_6b76_left,
BIN_OP_PLUS_uxn_c_l201_c56_6b76_right,
BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output);

-- MUX_uxn_c_l201_c37_e57f
MUX_uxn_c_l201_c37_e57f : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c37_e57f_cond,
MUX_uxn_c_l201_c37_e57f_iftrue,
MUX_uxn_c_l201_c37_e57f_iffalse,
MUX_uxn_c_l201_c37_e57f_return_output);

-- UNARY_OP_NOT_uxn_c_l201_c108_2e7c
UNARY_OP_NOT_uxn_c_l201_c108_2e7c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr,
UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output);

-- BIN_OP_AND_uxn_c_l201_c108_30e2
BIN_OP_AND_uxn_c_l201_c108_30e2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c108_30e2_left,
BIN_OP_AND_uxn_c_l201_c108_30e2_right,
BIN_OP_AND_uxn_c_l201_c108_30e2_return_output);

-- MUX_uxn_c_l201_c108_4488
MUX_uxn_c_l201_c108_4488 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c108_4488_cond,
MUX_uxn_c_l201_c108_4488_iftrue,
MUX_uxn_c_l201_c108_4488_iffalse,
MUX_uxn_c_l201_c108_4488_return_output);

-- BIN_OP_OR_uxn_c_l201_c37_654f
BIN_OP_OR_uxn_c_l201_c37_654f : entity work.BIN_OP_OR_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l201_c37_654f_left,
BIN_OP_OR_uxn_c_l201_c37_654f_right,
BIN_OP_OR_uxn_c_l201_c37_654f_return_output);

-- BIN_OP_EQ_uxn_c_l203_c21_019a
BIN_OP_EQ_uxn_c_l203_c21_019a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l203_c21_019a_left,
BIN_OP_EQ_uxn_c_l203_c21_019a_right,
BIN_OP_EQ_uxn_c_l203_c21_019a_return_output);

-- MUX_uxn_c_l203_c21_532b
MUX_uxn_c_l203_c21_532b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l203_c21_532b_cond,
MUX_uxn_c_l203_c21_532b_iftrue,
MUX_uxn_c_l203_c21_532b_iffalse,
MUX_uxn_c_l203_c21_532b_return_output);

-- BIN_OP_EQ_uxn_c_l204_c22_046b
BIN_OP_EQ_uxn_c_l204_c22_046b : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l204_c22_046b_left,
BIN_OP_EQ_uxn_c_l204_c22_046b_right,
BIN_OP_EQ_uxn_c_l204_c22_046b_return_output);

-- MUX_uxn_c_l204_c22_41b6
MUX_uxn_c_l204_c22_41b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l204_c22_41b6_cond,
MUX_uxn_c_l204_c22_41b6_iftrue,
MUX_uxn_c_l204_c22_41b6_iffalse,
MUX_uxn_c_l204_c22_41b6_return_output);

-- BIN_OP_PLUS_uxn_c_l205_c25_956c
BIN_OP_PLUS_uxn_c_l205_c25_956c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l205_c25_956c_left,
BIN_OP_PLUS_uxn_c_l205_c25_956c_right,
BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output);

-- MUX_uxn_c_l205_c6_e742
MUX_uxn_c_l205_c6_e742 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l205_c6_e742_cond,
MUX_uxn_c_l205_c6_e742_iftrue,
MUX_uxn_c_l205_c6_e742_iffalse,
MUX_uxn_c_l205_c6_e742_return_output);

-- BIN_OP_PLUS_uxn_c_l206_c34_9a54
BIN_OP_PLUS_uxn_c_l206_c34_9a54 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l206_c34_9a54_left,
BIN_OP_PLUS_uxn_c_l206_c34_9a54_right,
BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output);

-- MUX_uxn_c_l206_c6_3070
MUX_uxn_c_l206_c6_3070 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l206_c6_3070_cond,
MUX_uxn_c_l206_c6_3070_iftrue,
MUX_uxn_c_l206_c6_3070_iffalse,
MUX_uxn_c_l206_c6_3070_return_output);

-- UNARY_OP_NOT_uxn_c_l208_c46_c4a3
UNARY_OP_NOT_uxn_c_l208_c46_c4a3 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr,
UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output);

-- BIN_OP_AND_uxn_c_l208_c27_8a0b
BIN_OP_AND_uxn_c_l208_c27_8a0b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l208_c27_8a0b_left,
BIN_OP_AND_uxn_c_l208_c27_8a0b_right,
BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output);

-- BIN_OP_AND_uxn_c_l209_c27_0043
BIN_OP_AND_uxn_c_l209_c27_0043 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c27_0043_left,
BIN_OP_AND_uxn_c_l209_c27_0043_right,
BIN_OP_AND_uxn_c_l209_c27_0043_return_output);

-- MUX_uxn_c_l214_c3_a497
MUX_uxn_c_l214_c3_a497 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l214_c3_a497_cond,
MUX_uxn_c_l214_c3_a497_iftrue,
MUX_uxn_c_l214_c3_a497_iffalse,
MUX_uxn_c_l214_c3_a497_return_output);

-- UNARY_OP_NOT_uxn_c_l215_c71_4c6f
UNARY_OP_NOT_uxn_c_l215_c71_4c6f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr,
UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output);

-- BIN_OP_AND_uxn_c_l215_c22_38e9
BIN_OP_AND_uxn_c_l215_c22_38e9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c22_38e9_left,
BIN_OP_AND_uxn_c_l215_c22_38e9_right,
BIN_OP_AND_uxn_c_l215_c22_38e9_return_output);

-- BIN_OP_OR_uxn_c_l215_c3_ec0b
BIN_OP_OR_uxn_c_l215_c3_ec0b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l215_c3_ec0b_left,
BIN_OP_OR_uxn_c_l215_c3_ec0b_right,
BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output);

-- bg_vram_update_uxn_c_l211_c27_c760
bg_vram_update_uxn_c_l211_c27_c760 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE,
bg_vram_update_uxn_c_l211_c27_c760_read_address,
bg_vram_update_uxn_c_l211_c27_c760_write_address,
bg_vram_update_uxn_c_l211_c27_c760_write_value,
bg_vram_update_uxn_c_l211_c27_c760_write_enable,
bg_vram_update_uxn_c_l211_c27_c760_return_output);

-- MUX_uxn_c_l221_c3_0e1d
MUX_uxn_c_l221_c3_0e1d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c3_0e1d_cond,
MUX_uxn_c_l221_c3_0e1d_iftrue,
MUX_uxn_c_l221_c3_0e1d_iffalse,
MUX_uxn_c_l221_c3_0e1d_return_output);

-- BIN_OP_AND_uxn_c_l222_c22_1d20
BIN_OP_AND_uxn_c_l222_c22_1d20 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c22_1d20_left,
BIN_OP_AND_uxn_c_l222_c22_1d20_right,
BIN_OP_AND_uxn_c_l222_c22_1d20_return_output);

-- BIN_OP_OR_uxn_c_l222_c3_2cc7
BIN_OP_OR_uxn_c_l222_c3_2cc7 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c3_2cc7_left,
BIN_OP_OR_uxn_c_l222_c3_2cc7_right,
BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output);

-- fg_vram_update_uxn_c_l218_c27_03a0
fg_vram_update_uxn_c_l218_c27_03a0 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE,
fg_vram_update_uxn_c_l218_c27_03a0_read_address,
fg_vram_update_uxn_c_l218_c27_03a0_write_address,
fg_vram_update_uxn_c_l218_c27_03a0_write_value,
fg_vram_update_uxn_c_l218_c27_03a0_write_enable,
fg_vram_update_uxn_c_l218_c27_03a0_return_output);

-- draw_queue_update_uxn_c_l225_c21_1cf3
draw_queue_update_uxn_c_l225_c21_1cf3 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE,
draw_queue_update_uxn_c_l225_c21_1cf3_read_address,
draw_queue_update_uxn_c_l225_c21_1cf3_write_address,
draw_queue_update_uxn_c_l225_c21_1cf3_write_value,
draw_queue_update_uxn_c_l225_c21_1cf3_write_enable,
draw_queue_update_uxn_c_l225_c21_1cf3_return_output);

-- BIN_OP_AND_uxn_c_l232_c38_fb82
BIN_OP_AND_uxn_c_l232_c38_fb82 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c38_fb82_left,
BIN_OP_AND_uxn_c_l232_c38_fb82_right,
BIN_OP_AND_uxn_c_l232_c38_fb82_return_output);

-- UNARY_OP_NOT_uxn_c_l232_c38_dd0e
UNARY_OP_NOT_uxn_c_l232_c38_dd0e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr,
UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output);

-- MUX_uxn_c_l232_c19_6414
MUX_uxn_c_l232_c19_6414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l232_c19_6414_cond,
MUX_uxn_c_l232_c19_6414_iftrue,
MUX_uxn_c_l232_c19_6414_iffalse,
MUX_uxn_c_l232_c19_6414_return_output);

-- BIN_OP_EQ_uxn_c_l234_c19_5984
BIN_OP_EQ_uxn_c_l234_c19_5984 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l234_c19_5984_left,
BIN_OP_EQ_uxn_c_l234_c19_5984_right,
BIN_OP_EQ_uxn_c_l234_c19_5984_return_output);

-- BIN_OP_PLUS_uxn_c_l234_c76_2650
BIN_OP_PLUS_uxn_c_l234_c76_2650 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l234_c76_2650_left,
BIN_OP_PLUS_uxn_c_l234_c76_2650_right,
BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output);

-- MUX_uxn_c_l234_c50_5434
MUX_uxn_c_l234_c50_5434 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c50_5434_cond,
MUX_uxn_c_l234_c50_5434_iftrue,
MUX_uxn_c_l234_c50_5434_iffalse,
MUX_uxn_c_l234_c50_5434_return_output);

-- MUX_uxn_c_l234_c19_c06d
MUX_uxn_c_l234_c19_c06d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c19_c06d_cond,
MUX_uxn_c_l234_c19_c06d_iftrue,
MUX_uxn_c_l234_c19_c06d_iffalse,
MUX_uxn_c_l234_c19_c06d_return_output);

-- BIN_OP_EQ_uxn_c_l235_c25_07fc
BIN_OP_EQ_uxn_c_l235_c25_07fc : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l235_c25_07fc_left,
BIN_OP_EQ_uxn_c_l235_c25_07fc_right,
BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output);

-- MUX_uxn_c_l235_c25_ba64
MUX_uxn_c_l235_c25_ba64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l235_c25_ba64_cond,
MUX_uxn_c_l235_c25_ba64_iftrue,
MUX_uxn_c_l235_c25_ba64_iffalse,
MUX_uxn_c_l235_c25_ba64_return_output);

-- BIN_OP_EQ_uxn_c_l236_c17_8278
BIN_OP_EQ_uxn_c_l236_c17_8278 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c17_8278_left,
BIN_OP_EQ_uxn_c_l236_c17_8278_right,
BIN_OP_EQ_uxn_c_l236_c17_8278_return_output);

-- MUX_uxn_c_l236_c17_d335
MUX_uxn_c_l236_c17_d335 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l236_c17_d335_cond,
MUX_uxn_c_l236_c17_d335_iftrue,
MUX_uxn_c_l236_c17_d335_iffalse,
MUX_uxn_c_l236_c17_d335_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x,
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_active_drawing_area,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 cycle,
 enable_buffer_swap,
 swap_buffers,
 -- Registers
 result,
 queue_read_ptr,
 queue_write_ptr,
 current_queue_item,
 queue_write_value,
 queue_read_value,
 queue_write_enable,
 queue_phase,
 is_buffer_swapped,
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 fill_color,
 is_new_fill_row,
 is_last_fill_col,
 is_fill_active,
 fill_layer,
 is_fill_top,
 is_fill_left,
 pixel_counter,
 x,
 y,
 is_caught_up,
 is_read_ready,
 -- All submodule outputs
 BIN_OP_XOR_uxn_c_l157_c2_3542_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output,
 MUX_uxn_c_l158_c17_dae4_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output,
 MUX_uxn_c_l159_c18_b12c_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output,
 BIN_OP_AND_uxn_c_l161_c7_358e_return_output,
 BIN_OP_AND_uxn_c_l161_c7_442e_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_a282_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output,
 queue_phase_MUX_uxn_c_l161_c2_a282_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output,
 queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output,
 MUX_uxn_c_l182_c16_0faf_return_output,
 BIN_OP_AND_uxn_c_l184_c6_a40d_return_output,
 UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output,
 BIN_OP_AND_uxn_c_l184_c6_2779_return_output,
 is_fill_active_MUX_uxn_c_l184_c2_a077_return_output,
 fill_y0_MUX_uxn_c_l184_c2_a077_return_output,
 fill_x0_MUX_uxn_c_l184_c2_a077_return_output,
 x_MUX_uxn_c_l184_c2_a077_return_output,
 fill_y1_MUX_uxn_c_l184_c2_a077_return_output,
 fill_color_MUX_uxn_c_l184_c2_a077_return_output,
 is_fill_left_MUX_uxn_c_l184_c2_a077_return_output,
 y_MUX_uxn_c_l184_c2_a077_return_output,
 fill_layer_MUX_uxn_c_l184_c2_a077_return_output,
 is_fill_top_MUX_uxn_c_l184_c2_a077_return_output,
 fill_x1_MUX_uxn_c_l184_c2_a077_return_output,
 MUX_uxn_c_l188_c13_a244_return_output,
 BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output,
 MUX_uxn_c_l189_c13_6ea2_return_output,
 MUX_uxn_c_l190_c13_3522_return_output,
 BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output,
 MUX_uxn_c_l191_c13_4916_return_output,
 BIN_OP_AND_uxn_c_l200_c52_5137_return_output,
 MUX_uxn_c_l200_c52_7cf9_return_output,
 BIN_OP_OR_uxn_c_l200_c35_51ce_return_output,
 CONST_SL_8_uxn_c_l201_c56_93d1_return_output,
 BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output,
 MUX_uxn_c_l201_c37_e57f_return_output,
 UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output,
 BIN_OP_AND_uxn_c_l201_c108_30e2_return_output,
 MUX_uxn_c_l201_c108_4488_return_output,
 BIN_OP_OR_uxn_c_l201_c37_654f_return_output,
 BIN_OP_EQ_uxn_c_l203_c21_019a_return_output,
 MUX_uxn_c_l203_c21_532b_return_output,
 BIN_OP_EQ_uxn_c_l204_c22_046b_return_output,
 MUX_uxn_c_l204_c22_41b6_return_output,
 BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output,
 MUX_uxn_c_l205_c6_e742_return_output,
 BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output,
 MUX_uxn_c_l206_c6_3070_return_output,
 UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output,
 BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output,
 BIN_OP_AND_uxn_c_l209_c27_0043_return_output,
 MUX_uxn_c_l214_c3_a497_return_output,
 UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output,
 BIN_OP_AND_uxn_c_l215_c22_38e9_return_output,
 BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output,
 bg_vram_update_uxn_c_l211_c27_c760_return_output,
 MUX_uxn_c_l221_c3_0e1d_return_output,
 BIN_OP_AND_uxn_c_l222_c22_1d20_return_output,
 BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output,
 fg_vram_update_uxn_c_l218_c27_03a0_return_output,
 draw_queue_update_uxn_c_l225_c21_1cf3_return_output,
 BIN_OP_AND_uxn_c_l232_c38_fb82_return_output,
 UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output,
 MUX_uxn_c_l232_c19_6414_return_output,
 BIN_OP_EQ_uxn_c_l234_c19_5984_return_output,
 BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output,
 MUX_uxn_c_l234_c50_5434_return_output,
 MUX_uxn_c_l234_c19_c06d_return_output,
 BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output,
 MUX_uxn_c_l235_c25_ba64_return_output,
 BIN_OP_EQ_uxn_c_l236_c17_8278_return_output,
 MUX_uxn_c_l236_c17_d335_return_output,
 CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : gpu_step_result_t;
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(15 downto 0);
 variable VAR_vram_value : unsigned(7 downto 0);
 variable VAR_cycle : unsigned(31 downto 0);
 variable VAR_enable_buffer_swap : unsigned(0 downto 0);
 variable VAR_swap_buffers : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dae4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dae4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dae4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dae4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_b12c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_b12c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_b12c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_b12c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_8fc9_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_358e_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_358e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_358e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_442e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_442e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_442e_return_output : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_a282_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_0fe1 : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_f615 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_a282_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_a282_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_5adf_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_60d0_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_4032_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_3ac7_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_c38f_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_2f23_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output : unsigned(10 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_8a77 : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l176_c3_9144 : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_aefa : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l174_c3_5c2d : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l174_c23_953e_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l175_c3_1453 : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l175_c23_1909_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l176_c23_9249_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output : unsigned(10 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_0faf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_0faf_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_0faf_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_0faf_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5920_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_2779_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_2779_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_a077_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_a077_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_a077_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_e07e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_93d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_a244_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_a244_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_a244_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_a244_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_6ea2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_6ea2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_6ea2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_6ea2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3522_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3522_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3522_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3522_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_4916_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_4916_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_4916_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_4916_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_read_address : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_7cf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5137_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5137_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5137_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_7cf9_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_7cf9_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_7cf9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_e57f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_93d1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_93d1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_e57f_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_e57f_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_e57f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_654f_left : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_4488_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_4488_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_4488_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_4488_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_654f_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_654f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_532b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_532b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_532b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_532b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_41b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_41b6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_41b6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_41b6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_e742_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_e742_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_e742_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_e742_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_3070_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_3070_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_3070_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_3070_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0043_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0043_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0043_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_a497_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_a497_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_a497_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_a497_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_c760_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_0e1d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_0e1d_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_0e1d_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_0e1d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_03a0_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_read_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_1cf3_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_6414_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_6414_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_6414_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_6414_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_c06d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_c06d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_c06d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_5434_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_5434_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_5434_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_5434_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_c06d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_ba64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_ba64_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_ba64_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_ba64_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_d335_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_d335_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_d335_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_d335_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_b34b_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l222_l215_DUPLICATE_6217_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_9af1_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_queue_read_ptr : unsigned(9 downto 0);
variable REG_VAR_queue_write_ptr : unsigned(9 downto 0);
variable REG_VAR_current_queue_item : draw_command_t;
variable REG_VAR_queue_write_value : unsigned(23 downto 0);
variable REG_VAR_queue_read_value : unsigned(23 downto 0);
variable REG_VAR_queue_write_enable : unsigned(0 downto 0);
variable REG_VAR_queue_phase : unsigned(1 downto 0);
variable REG_VAR_is_buffer_swapped : unsigned(0 downto 0);
variable REG_VAR_fill_x0 : unsigned(15 downto 0);
variable REG_VAR_fill_y0 : unsigned(15 downto 0);
variable REG_VAR_fill_x1 : unsigned(15 downto 0);
variable REG_VAR_fill_y1 : unsigned(15 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_new_fill_row : unsigned(0 downto 0);
variable REG_VAR_is_last_fill_col : unsigned(0 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_is_fill_top : unsigned(0 downto 0);
variable REG_VAR_is_fill_left : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_is_caught_up : unsigned(0 downto 0);
variable REG_VAR_is_read_ready : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_queue_read_ptr := queue_read_ptr;
  REG_VAR_queue_write_ptr := queue_write_ptr;
  REG_VAR_current_queue_item := current_queue_item;
  REG_VAR_queue_write_value := queue_write_value;
  REG_VAR_queue_read_value := queue_read_value;
  REG_VAR_queue_write_enable := queue_write_enable;
  REG_VAR_queue_phase := queue_phase;
  REG_VAR_is_buffer_swapped := is_buffer_swapped;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_new_fill_row := is_new_fill_row;
  REG_VAR_is_last_fill_col := is_last_fill_col;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_is_fill_top := is_fill_top;
  REG_VAR_is_fill_left := is_fill_left;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_is_caught_up := is_caught_up;
  REG_VAR_is_read_ready := is_read_ready;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l204_c22_41b6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l190_c13_3522_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l203_c21_532b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l234_c19_c06d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l189_c13_6ea2_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l158_c17_dae4_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l158_c17_dae4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l201_c108_4488_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l200_c52_7cf9_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l188_c13_a244_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l200_c52_7cf9_iftrue := to_unsigned(65536, 17);
     VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_right := to_unsigned(3, 2);
     VAR_queue_phase_uxn_c_l177_c3_aefa := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue := VAR_queue_phase_uxn_c_l177_c3_aefa;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l232_c19_6414_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_right := to_unsigned(255, 16);
     VAR_queue_phase_uxn_c_l169_c3_f615 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iftrue := VAR_queue_phase_uxn_c_l169_c3_f615;
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l182_c16_0faf_iftrue := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l201_c108_4488_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l159_c18_b12c_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l203_c21_532b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l204_c22_41b6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l235_c25_ba64_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l159_c18_b12c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l235_c25_ba64_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l191_c13_4916_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_active_drawing_area := is_active_drawing_area;
     VAR_is_vram_write := is_vram_write;
     VAR_vram_write_layer := vram_write_layer;
     VAR_vram_address := vram_address;
     VAR_vram_value := vram_value;
     VAR_cycle := cycle;
     VAR_enable_buffer_swap := enable_buffer_swap;
     VAR_swap_buffers := swap_buffers;

     -- Submodule level 0
     VAR_bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l200_c52_5137_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l184_c2_a077_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iffalse := fill_y1;
     VAR_MUX_uxn_c_l234_c50_5434_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_left := pixel_counter;
     VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_left := pixel_counter;
     VAR_MUX_uxn_c_l234_c50_5434_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l184_c2_a077_iffalse := x;
     VAR_y_MUX_uxn_c_l184_c2_a077_iffalse := y;
     -- uint32_uint16_0[uxn_c_l174_c23_953e] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l174_c23_953e_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- BIN_OP_PLUS[uxn_c_l170_c3_a749] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_a749_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_left;
     BIN_OP_PLUS_uxn_c_l170_c3_a749_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output := BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output;

     -- BIN_OP_XOR[uxn_c_l157_c2_3542] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_3542_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_left;
     BIN_OP_XOR_uxn_c_l157_c2_3542_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_return_output := BIN_OP_XOR_uxn_c_l157_c2_3542_return_output;

     -- BIN_OP_EQ[uxn_c_l158_c17_0a27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_0a27_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_left;
     BIN_OP_EQ_uxn_c_l158_c17_0a27_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output := BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_8fc9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_8fc9_return_output := current_queue_item.is_valid;

     -- BIN_OP_EQ[uxn_c_l234_c19_5984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l234_c19_5984_left <= VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_left;
     BIN_OP_EQ_uxn_c_l234_c19_5984_right <= VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_return_output := BIN_OP_EQ_uxn_c_l234_c19_5984_return_output;

     -- uint24_20_20[uxn_c_l166_c32_c38f] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_c38f_return_output := uint24_20_20(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l159_c18_ad48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_ad48_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_left;
     BIN_OP_EQ_uxn_c_l159_c18_ad48_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output := BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output;

     -- BIN_OP_PLUS[uxn_c_l234_c76_2650] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l234_c76_2650_left <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_left;
     BIN_OP_PLUS_uxn_c_l234_c76_2650_right <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output := BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output;

     -- UNARY_OP_NOT[uxn_c_l184_c66_beaf] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr <= VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output := UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output;

     -- uint24_17_16[uxn_c_l163_c30_60d0] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_60d0_return_output := uint24_17_16(
     queue_read_value);

     -- uint24_21_21[uxn_c_l167_c30_2f23] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_2f23_return_output := uint24_21_21(
     queue_read_value);

     -- uint24_15_0[uxn_c_l162_c37_5adf] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_5adf_return_output := uint24_15_0(
     queue_read_value);

     -- uint24_19_19[uxn_c_l165_c34_3ac7] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_3ac7_return_output := uint24_19_19(
     queue_read_value);

     -- uint24_18_18[uxn_c_l164_c33_4032] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_4032_return_output := uint24_18_18(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l178_c3_f4a4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_left;
     BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output := BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_dae4_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_0a27_return_output;
     VAR_MUX_uxn_c_l159_c18_b12c_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_ad48_return_output;
     VAR_MUX_uxn_c_l234_c19_c06d_cond := VAR_BIN_OP_EQ_uxn_c_l234_c19_5984_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_0fe1 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_a749_return_output, 10);
     VAR_queue_write_ptr_uxn_c_l178_c3_8a77 := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_f4a4_return_output, 10);
     VAR_MUX_uxn_c_l234_c50_5434_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l234_c76_2650_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l200_c52_5137_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_3542_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_8fc9_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_2779_right := VAR_UNARY_OP_NOT_uxn_c_l184_c66_beaf_return_output;
     VAR_queue_write_value_uxn_c_l174_c3_5c2d := resize(VAR_uint32_uint16_0_uxn_c_l174_c23_953e_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_0fe1;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_8a77;
     -- queue_write_ptr_MUX[uxn_c_l173_c2_9f5f] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output;

     -- UNARY_OP_NOT[uxn_c_l201_c108_2e7c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr <= VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output := UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output;

     -- MUX[uxn_c_l158_c17_dae4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_dae4_cond <= VAR_MUX_uxn_c_l158_c17_dae4_cond;
     MUX_uxn_c_l158_c17_dae4_iftrue <= VAR_MUX_uxn_c_l158_c17_dae4_iftrue;
     MUX_uxn_c_l158_c17_dae4_iffalse <= VAR_MUX_uxn_c_l158_c17_dae4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_dae4_return_output := MUX_uxn_c_l158_c17_dae4_return_output;

     -- uint32_uint5_16[uxn_c_l175_c23_1909] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l175_c23_1909_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l174_c3_5c2d, 32),
     resize(VAR_vram_value, 5));

     -- MUX[uxn_c_l234_c50_5434] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c50_5434_cond <= VAR_MUX_uxn_c_l234_c50_5434_cond;
     MUX_uxn_c_l234_c50_5434_iftrue <= VAR_MUX_uxn_c_l234_c50_5434_iftrue;
     MUX_uxn_c_l234_c50_5434_iffalse <= VAR_MUX_uxn_c_l234_c50_5434_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c50_5434_return_output := MUX_uxn_c_l234_c50_5434_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c7_a860] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_a860_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output := UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_a282] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_a282_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_5adf_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_60d0_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_4032_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_3ac7_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_c38f_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_2f23_return_output,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_c_l200_c52_5137] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l200_c52_5137_left <= VAR_BIN_OP_AND_uxn_c_l200_c52_5137_left;
     BIN_OP_AND_uxn_c_l200_c52_5137_right <= VAR_BIN_OP_AND_uxn_c_l200_c52_5137_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l200_c52_5137_return_output := BIN_OP_AND_uxn_c_l200_c52_5137_return_output;

     -- MUX[uxn_c_l159_c18_b12c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_b12c_cond <= VAR_MUX_uxn_c_l159_c18_b12c_cond;
     MUX_uxn_c_l159_c18_b12c_iftrue <= VAR_MUX_uxn_c_l159_c18_b12c_iftrue;
     MUX_uxn_c_l159_c18_b12c_iffalse <= VAR_MUX_uxn_c_l159_c18_b12c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_b12c_return_output := MUX_uxn_c_l159_c18_b12c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l200_c52_7cf9_cond := VAR_BIN_OP_AND_uxn_c_l200_c52_5137_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr := VAR_MUX_uxn_c_l158_c17_dae4_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_dae4_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_442e_right := VAR_MUX_uxn_c_l159_c18_b12c_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_b12c_return_output;
     VAR_MUX_uxn_c_l234_c19_c06d_iffalse := VAR_MUX_uxn_c_l234_c50_5434_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_358e_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_a860_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_left := VAR_UNARY_OP_NOT_uxn_c_l201_c108_2e7c_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_a282_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_9f5f_return_output;
     VAR_queue_write_value_uxn_c_l175_c3_1453 := resize(VAR_uint32_uint5_16_uxn_c_l175_c23_1909_return_output, 24);
     -- UNARY_OP_NOT[uxn_c_l161_c38_25e6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output := UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output;

     -- BIN_OP_AND[uxn_c_l201_c108_30e2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c108_30e2_left <= VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_left;
     BIN_OP_AND_uxn_c_l201_c108_30e2_right <= VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_return_output := BIN_OP_AND_uxn_c_l201_c108_30e2_return_output;

     -- MUX[uxn_c_l200_c52_7cf9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l200_c52_7cf9_cond <= VAR_MUX_uxn_c_l200_c52_7cf9_cond;
     MUX_uxn_c_l200_c52_7cf9_iftrue <= VAR_MUX_uxn_c_l200_c52_7cf9_iftrue;
     MUX_uxn_c_l200_c52_7cf9_iffalse <= VAR_MUX_uxn_c_l200_c52_7cf9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l200_c52_7cf9_return_output := MUX_uxn_c_l200_c52_7cf9_return_output;

     -- uint32_uint1_21[uxn_c_l176_c23_9249] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l176_c23_9249_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l175_c3_1453, 32),
     VAR_vram_write_layer);

     -- MUX[uxn_c_l234_c19_c06d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c19_c06d_cond <= VAR_MUX_uxn_c_l234_c19_c06d_cond;
     MUX_uxn_c_l234_c19_c06d_iftrue <= VAR_MUX_uxn_c_l234_c19_c06d_iftrue;
     MUX_uxn_c_l234_c19_c06d_iffalse <= VAR_MUX_uxn_c_l234_c19_c06d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c19_c06d_return_output := MUX_uxn_c_l234_c19_c06d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l201_c108_4488_cond := VAR_BIN_OP_AND_uxn_c_l201_c108_30e2_return_output;
     VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_right := VAR_MUX_uxn_c_l200_c52_7cf9_return_output;
     VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_left := VAR_MUX_uxn_c_l234_c19_c06d_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l234_c19_c06d_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_358e_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_25e6_return_output;
     VAR_queue_write_value_uxn_c_l176_c3_9144 := resize(VAR_uint32_uint1_21_uxn_c_l176_c23_9249_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue := VAR_queue_write_value_uxn_c_l176_c3_9144;
     -- BIN_OP_EQ[uxn_c_l235_c25_07fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l235_c25_07fc_left <= VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_left;
     BIN_OP_EQ_uxn_c_l235_c25_07fc_right <= VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output := BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output;

     -- BIN_OP_OR[uxn_c_l200_c35_51ce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l200_c35_51ce_left <= VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_left;
     BIN_OP_OR_uxn_c_l200_c35_51ce_right <= VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_return_output := BIN_OP_OR_uxn_c_l200_c35_51ce_return_output;

     -- MUX[uxn_c_l201_c108_4488] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c108_4488_cond <= VAR_MUX_uxn_c_l201_c108_4488_cond;
     MUX_uxn_c_l201_c108_4488_iftrue <= VAR_MUX_uxn_c_l201_c108_4488_iftrue;
     MUX_uxn_c_l201_c108_4488_iffalse <= VAR_MUX_uxn_c_l201_c108_4488_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c108_4488_return_output := MUX_uxn_c_l201_c108_4488_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_9f5f] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_cond;
     queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output := queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_358e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_358e_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_358e_left;
     BIN_OP_AND_uxn_c_l161_c7_358e_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_358e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_358e_return_output := BIN_OP_AND_uxn_c_l161_c7_358e_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_442e_left := VAR_BIN_OP_AND_uxn_c_l161_c7_358e_return_output;
     VAR_MUX_uxn_c_l235_c25_ba64_cond := VAR_BIN_OP_EQ_uxn_c_l235_c25_07fc_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_c760_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_51ce_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_654f_right := VAR_MUX_uxn_c_l201_c108_4488_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_9f5f_return_output;
     -- BIN_OP_AND[uxn_c_l161_c7_442e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_442e_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_442e_left;
     BIN_OP_AND_uxn_c_l161_c7_442e_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_442e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_442e_return_output := BIN_OP_AND_uxn_c_l161_c7_442e_return_output;

     -- MUX[uxn_c_l235_c25_ba64] LATENCY=0
     -- Inputs
     MUX_uxn_c_l235_c25_ba64_cond <= VAR_MUX_uxn_c_l235_c25_ba64_cond;
     MUX_uxn_c_l235_c25_ba64_iftrue <= VAR_MUX_uxn_c_l235_c25_ba64_iftrue;
     MUX_uxn_c_l235_c25_ba64_iffalse <= VAR_MUX_uxn_c_l235_c25_ba64_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l235_c25_ba64_return_output := MUX_uxn_c_l235_c25_ba64_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_442e_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_a282_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_442e_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_442e_return_output;
     -- current_queue_item_MUX[uxn_c_l161_c2_a282] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_a282_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_cond;
     current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output := current_queue_item_MUX_uxn_c_l161_c2_a282_return_output;

     -- queue_read_ptr_MUX[uxn_c_l161_c2_a282] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output;

     -- queue_phase_MUX[uxn_c_l161_c2_a282] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_a282_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_a282_cond;
     queue_phase_MUX_uxn_c_l161_c2_a282_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_a282_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_a282_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_a282_return_output := queue_phase_MUX_uxn_c_l161_c2_a282_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_a282_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_a282_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l184_c36_5920] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5920_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.is_fill;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.vram_address;

     -- queue_phase_MUX[uxn_c_l173_c2_9f5f] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_9f5f_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_cond;
     queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output := queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_e07e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_e07e_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.fill_top;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_93d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_93d8_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.fill_left;

     -- draw_queue_update[uxn_c_l225_c21_1cf3] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l225_c21_1cf3_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l225_c21_1cf3_read_address <= VAR_draw_queue_update_uxn_c_l225_c21_1cf3_read_address;
     draw_queue_update_uxn_c_l225_c21_1cf3_write_address <= VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_address;
     draw_queue_update_uxn_c_l225_c21_1cf3_write_value <= VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_value;
     draw_queue_update_uxn_c_l225_c21_1cf3_write_enable <= VAR_draw_queue_update_uxn_c_l225_c21_1cf3_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l225_c21_1cf3_return_output := draw_queue_update_uxn_c_l225_c21_1cf3_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.layer;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l222_l215_DUPLICATE_6217 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l222_l215_DUPLICATE_6217_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output.is_valid;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output;
     VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output;
     VAR_MUX_uxn_c_l201_c37_e57f_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l201_l188_l191_DUPLICATE_58d3_return_output, 17);
     VAR_MUX_uxn_c_l189_c13_6ea2_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_93d8_return_output;
     VAR_MUX_uxn_c_l191_c13_4916_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_93d8_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_93d8_return_output;
     VAR_MUX_uxn_c_l188_c13_a244_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_e07e_return_output;
     VAR_MUX_uxn_c_l190_c13_3522_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_e07e_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_e07e_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5920_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l222_l215_DUPLICATE_6217_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l222_l215_DUPLICATE_6217_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l215_l192_l222_DUPLICATE_c7fb_return_output;
     VAR_MUX_uxn_c_l214_c3_a497_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9_return_output;
     VAR_MUX_uxn_c_l221_c3_0e1d_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9_return_output;
     VAR_fill_color_MUX_uxn_c_l184_c2_a077_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l214_l221_DUPLICATE_f2f9_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l225_c21_1cf3_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_left := VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_left := VAR_queue_phase_MUX_uxn_c_l173_c2_9f5f_return_output;
     -- BIN_OP_PLUS[uxn_c_l182_c39_935b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_935b_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_left;
     BIN_OP_PLUS_uxn_c_l182_c39_935b_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output := BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output;

     -- BIN_OP_AND[uxn_c_l189_c28_5fb9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c28_5fb9_left <= VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_left;
     BIN_OP_AND_uxn_c_l189_c28_5fb9_right <= VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output := BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output;

     -- UNARY_OP_NOT[uxn_c_l215_c71_4c6f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr <= VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output := UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output;

     -- BIN_OP_AND[uxn_c_l191_c32_d9e8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c32_d9e8_left <= VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_left;
     BIN_OP_AND_uxn_c_l191_c32_d9e8_right <= VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output := BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c16_b8da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_b8da_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_left;
     BIN_OP_EQ_uxn_c_l182_c16_b8da_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output := BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output := CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_a40d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_a40d_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_left;
     BIN_OP_AND_uxn_c_l184_c6_a40d_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_return_output := BIN_OP_AND_uxn_c_l184_c6_a40d_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l184_c6_2779_left := VAR_BIN_OP_AND_uxn_c_l184_c6_a40d_return_output;
     VAR_MUX_uxn_c_l189_c13_6ea2_iftrue := VAR_BIN_OP_AND_uxn_c_l189_c28_5fb9_return_output;
     VAR_MUX_uxn_c_l191_c13_4916_iffalse := VAR_BIN_OP_AND_uxn_c_l191_c32_d9e8_return_output;
     VAR_MUX_uxn_c_l182_c16_0faf_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_b8da_return_output;
     VAR_MUX_uxn_c_l182_c16_0faf_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_935b_return_output, 2);
     VAR_MUX_uxn_c_l188_c13_a244_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output;
     VAR_MUX_uxn_c_l190_c13_3522_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_cdc0_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_right := VAR_UNARY_OP_NOT_uxn_c_l215_c71_4c6f_return_output;
     -- MUX[uxn_c_l188_c13_a244] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_a244_cond <= VAR_MUX_uxn_c_l188_c13_a244_cond;
     MUX_uxn_c_l188_c13_a244_iftrue <= VAR_MUX_uxn_c_l188_c13_a244_iftrue;
     MUX_uxn_c_l188_c13_a244_iffalse <= VAR_MUX_uxn_c_l188_c13_a244_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_a244_return_output := MUX_uxn_c_l188_c13_a244_return_output;

     -- MUX[uxn_c_l189_c13_6ea2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_6ea2_cond <= VAR_MUX_uxn_c_l189_c13_6ea2_cond;
     MUX_uxn_c_l189_c13_6ea2_iftrue <= VAR_MUX_uxn_c_l189_c13_6ea2_iftrue;
     MUX_uxn_c_l189_c13_6ea2_iffalse <= VAR_MUX_uxn_c_l189_c13_6ea2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_6ea2_return_output := MUX_uxn_c_l189_c13_6ea2_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_2779] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_2779_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_2779_left;
     BIN_OP_AND_uxn_c_l184_c6_2779_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_2779_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output := BIN_OP_AND_uxn_c_l184_c6_2779_return_output;

     -- MUX[uxn_c_l191_c13_4916] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_4916_cond <= VAR_MUX_uxn_c_l191_c13_4916_cond;
     MUX_uxn_c_l191_c13_4916_iftrue <= VAR_MUX_uxn_c_l191_c13_4916_iftrue;
     MUX_uxn_c_l191_c13_4916_iffalse <= VAR_MUX_uxn_c_l191_c13_4916_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_4916_return_output := MUX_uxn_c_l191_c13_4916_return_output;

     -- MUX[uxn_c_l190_c13_3522] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_3522_cond <= VAR_MUX_uxn_c_l190_c13_3522_cond;
     MUX_uxn_c_l190_c13_3522_iftrue <= VAR_MUX_uxn_c_l190_c13_3522_iftrue;
     MUX_uxn_c_l190_c13_3522_iffalse <= VAR_MUX_uxn_c_l190_c13_3522_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_3522_return_output := MUX_uxn_c_l190_c13_3522_return_output;

     -- MUX[uxn_c_l182_c16_0faf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_0faf_cond <= VAR_MUX_uxn_c_l182_c16_0faf_cond;
     MUX_uxn_c_l182_c16_0faf_iftrue <= VAR_MUX_uxn_c_l182_c16_0faf_iftrue;
     MUX_uxn_c_l182_c16_0faf_iffalse <= VAR_MUX_uxn_c_l182_c16_0faf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_0faf_return_output := MUX_uxn_c_l182_c16_0faf_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_x_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     VAR_y_MUX_uxn_c_l184_c2_a077_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_2779_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_0faf_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l188_c13_a244_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l189_c13_6ea2_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l190_c13_3522_return_output;
     VAR_y_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l190_c13_3522_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l191_c13_4916_return_output;
     VAR_x_MUX_uxn_c_l184_c2_a077_iftrue := VAR_MUX_uxn_c_l191_c13_4916_return_output;
     -- fill_y0_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_y0_MUX_uxn_c_l184_c2_a077_cond;
     fill_y0_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_y0_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_y0_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l184_c2_a077_return_output := fill_y0_MUX_uxn_c_l184_c2_a077_return_output;

     -- fill_color_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_color_MUX_uxn_c_l184_c2_a077_cond;
     fill_color_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_color_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_color_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_color_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l184_c2_a077_return_output := fill_color_MUX_uxn_c_l184_c2_a077_return_output;

     -- y_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l184_c2_a077_cond <= VAR_y_MUX_uxn_c_l184_c2_a077_cond;
     y_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_y_MUX_uxn_c_l184_c2_a077_iftrue;
     y_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_y_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l184_c2_a077_return_output := y_MUX_uxn_c_l184_c2_a077_return_output;

     -- fill_x0_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_x0_MUX_uxn_c_l184_c2_a077_cond;
     fill_x0_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_x0_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_x0_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l184_c2_a077_return_output := fill_x0_MUX_uxn_c_l184_c2_a077_return_output;

     -- fill_y1_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_y1_MUX_uxn_c_l184_c2_a077_cond;
     fill_y1_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_y1_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_y1_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l184_c2_a077_return_output := fill_y1_MUX_uxn_c_l184_c2_a077_return_output;

     -- is_fill_active_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l184_c2_a077_cond <= VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_cond;
     is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iftrue;
     is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output := is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;

     -- is_fill_left_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l184_c2_a077_cond <= VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_cond;
     is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iftrue;
     is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_return_output := is_fill_left_MUX_uxn_c_l184_c2_a077_return_output;

     -- fill_layer_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_layer_MUX_uxn_c_l184_c2_a077_cond;
     fill_layer_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_layer_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_layer_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l184_c2_a077_return_output := fill_layer_MUX_uxn_c_l184_c2_a077_return_output;

     -- is_fill_top_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l184_c2_a077_cond <= VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_cond;
     is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iftrue;
     is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_return_output := is_fill_top_MUX_uxn_c_l184_c2_a077_return_output;

     -- x_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l184_c2_a077_cond <= VAR_x_MUX_uxn_c_l184_c2_a077_cond;
     x_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_x_MUX_uxn_c_l184_c2_a077_iftrue;
     x_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_x_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l184_c2_a077_return_output := x_MUX_uxn_c_l184_c2_a077_return_output;

     -- fill_x1_MUX[uxn_c_l184_c2_a077] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l184_c2_a077_cond <= VAR_fill_x1_MUX_uxn_c_l184_c2_a077_cond;
     fill_x1_MUX_uxn_c_l184_c2_a077_iftrue <= VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iftrue;
     fill_x1_MUX_uxn_c_l184_c2_a077_iffalse <= VAR_fill_x1_MUX_uxn_c_l184_c2_a077_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l184_c2_a077_return_output := fill_x1_MUX_uxn_c_l184_c2_a077_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l214_c3_a497_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_MUX_uxn_c_l221_c3_0e1d_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_0043_right := VAR_fill_layer_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr := VAR_fill_layer_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_MUX_uxn_c_l206_c6_3070_iftrue := VAR_fill_x0_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_right := VAR_fill_x1_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_right := VAR_fill_y1_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_0043_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_MUX_uxn_c_l201_c37_e57f_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_MUX_uxn_c_l232_c19_6414_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr := VAR_is_fill_active_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l184_c2_a077_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_left := VAR_x_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_right := VAR_x_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_left := VAR_x_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_left := VAR_y_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_left := VAR_y_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_CONST_SL_8_uxn_c_l201_c56_93d1_x := VAR_y_MUX_uxn_c_l184_c2_a077_return_output;
     VAR_MUX_uxn_c_l205_c6_e742_iffalse := VAR_y_MUX_uxn_c_l184_c2_a077_return_output;
     -- BIN_OP_PLUS[uxn_c_l206_c34_9a54] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l206_c34_9a54_left <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_left;
     BIN_OP_PLUS_uxn_c_l206_c34_9a54_right <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output := BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output;

     -- UNARY_OP_NOT[uxn_c_l208_c46_c4a3] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr <= VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output := UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output;

     -- BIN_OP_EQ[uxn_c_l203_c21_019a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l203_c21_019a_left <= VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_left;
     BIN_OP_EQ_uxn_c_l203_c21_019a_right <= VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_return_output := BIN_OP_EQ_uxn_c_l203_c21_019a_return_output;

     -- CONST_SL_8[uxn_c_l201_c56_93d1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l201_c56_93d1_x <= VAR_CONST_SL_8_uxn_c_l201_c56_93d1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l201_c56_93d1_return_output := CONST_SL_8_uxn_c_l201_c56_93d1_return_output;

     -- BIN_OP_AND[uxn_c_l209_c27_0043] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c27_0043_left <= VAR_BIN_OP_AND_uxn_c_l209_c27_0043_left;
     BIN_OP_AND_uxn_c_l209_c27_0043_right <= VAR_BIN_OP_AND_uxn_c_l209_c27_0043_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c27_0043_return_output := BIN_OP_AND_uxn_c_l209_c27_0043_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output;

     -- BIN_OP_EQ[uxn_c_l204_c22_046b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l204_c22_046b_left <= VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_left;
     BIN_OP_EQ_uxn_c_l204_c22_046b_right <= VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_return_output := BIN_OP_EQ_uxn_c_l204_c22_046b_return_output;

     -- BIN_OP_PLUS[uxn_c_l205_c25_956c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l205_c25_956c_left <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_left;
     BIN_OP_PLUS_uxn_c_l205_c25_956c_right <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output := BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_left := VAR_BIN_OP_AND_uxn_c_l209_c27_0043_return_output;
     VAR_MUX_uxn_c_l221_c3_0e1d_cond := VAR_BIN_OP_AND_uxn_c_l209_c27_0043_return_output;
     VAR_MUX_uxn_c_l203_c21_532b_cond := VAR_BIN_OP_EQ_uxn_c_l203_c21_019a_return_output;
     VAR_MUX_uxn_c_l204_c22_41b6_cond := VAR_BIN_OP_EQ_uxn_c_l204_c22_046b_return_output;
     VAR_MUX_uxn_c_l205_c6_e742_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l205_c25_956c_return_output, 16);
     VAR_MUX_uxn_c_l206_c6_3070_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l206_c34_9a54_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_left := VAR_CONST_SL_8_uxn_c_l201_c56_93d1_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_right := VAR_UNARY_OP_NOT_uxn_c_l208_c46_c4a3_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_e8d3_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output;

     -- BIN_OP_PLUS[uxn_c_l201_c56_6b76] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l201_c56_6b76_left <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_left;
     BIN_OP_PLUS_uxn_c_l201_c56_6b76_right <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output := BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output;

     -- MUX[uxn_c_l221_c3_0e1d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c3_0e1d_cond <= VAR_MUX_uxn_c_l221_c3_0e1d_cond;
     MUX_uxn_c_l221_c3_0e1d_iftrue <= VAR_MUX_uxn_c_l221_c3_0e1d_iftrue;
     MUX_uxn_c_l221_c3_0e1d_iffalse <= VAR_MUX_uxn_c_l221_c3_0e1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c3_0e1d_return_output := MUX_uxn_c_l221_c3_0e1d_return_output;

     -- MUX[uxn_c_l203_c21_532b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l203_c21_532b_cond <= VAR_MUX_uxn_c_l203_c21_532b_cond;
     MUX_uxn_c_l203_c21_532b_iftrue <= VAR_MUX_uxn_c_l203_c21_532b_iftrue;
     MUX_uxn_c_l203_c21_532b_iffalse <= VAR_MUX_uxn_c_l203_c21_532b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l203_c21_532b_return_output := MUX_uxn_c_l203_c21_532b_return_output;

     -- MUX[uxn_c_l204_c22_41b6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l204_c22_41b6_cond <= VAR_MUX_uxn_c_l204_c22_41b6_cond;
     MUX_uxn_c_l204_c22_41b6_iftrue <= VAR_MUX_uxn_c_l204_c22_41b6_iftrue;
     MUX_uxn_c_l204_c22_41b6_iffalse <= VAR_MUX_uxn_c_l204_c22_41b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l204_c22_41b6_return_output := MUX_uxn_c_l204_c22_41b6_return_output;

     -- BIN_OP_AND[uxn_c_l208_c27_8a0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l208_c27_8a0b_left <= VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_left;
     BIN_OP_AND_uxn_c_l208_c27_8a0b_right <= VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output := BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_left := VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output;
     VAR_MUX_uxn_c_l214_c3_a497_cond := VAR_BIN_OP_AND_uxn_c_l208_c27_8a0b_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l222_l215_DUPLICATE_8793_return_output;
     VAR_MUX_uxn_c_l201_c37_e57f_iftrue := VAR_BIN_OP_PLUS_uxn_c_l201_c56_6b76_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_left := VAR_MUX_uxn_c_l203_c21_532b_return_output;
     VAR_MUX_uxn_c_l205_c6_e742_cond := VAR_MUX_uxn_c_l203_c21_532b_return_output;
     VAR_MUX_uxn_c_l206_c6_3070_cond := VAR_MUX_uxn_c_l203_c21_532b_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l203_c21_532b_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_right := VAR_MUX_uxn_c_l204_c22_41b6_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l204_c22_41b6_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_value := VAR_MUX_uxn_c_l221_c3_0e1d_return_output;
     -- BIN_OP_AND[uxn_c_l215_c22_38e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c22_38e9_left <= VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_left;
     BIN_OP_AND_uxn_c_l215_c22_38e9_right <= VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_return_output := BIN_OP_AND_uxn_c_l215_c22_38e9_return_output;

     -- MUX[uxn_c_l205_c6_e742] LATENCY=0
     -- Inputs
     MUX_uxn_c_l205_c6_e742_cond <= VAR_MUX_uxn_c_l205_c6_e742_cond;
     MUX_uxn_c_l205_c6_e742_iftrue <= VAR_MUX_uxn_c_l205_c6_e742_iftrue;
     MUX_uxn_c_l205_c6_e742_iffalse <= VAR_MUX_uxn_c_l205_c6_e742_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l205_c6_e742_return_output := MUX_uxn_c_l205_c6_e742_return_output;

     -- BIN_OP_AND[uxn_c_l232_c38_fb82] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c38_fb82_left <= VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_left;
     BIN_OP_AND_uxn_c_l232_c38_fb82_right <= VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_return_output := BIN_OP_AND_uxn_c_l232_c38_fb82_return_output;

     -- MUX[uxn_c_l214_c3_a497] LATENCY=0
     -- Inputs
     MUX_uxn_c_l214_c3_a497_cond <= VAR_MUX_uxn_c_l214_c3_a497_cond;
     MUX_uxn_c_l214_c3_a497_iftrue <= VAR_MUX_uxn_c_l214_c3_a497_iftrue;
     MUX_uxn_c_l214_c3_a497_iffalse <= VAR_MUX_uxn_c_l214_c3_a497_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l214_c3_a497_return_output := MUX_uxn_c_l214_c3_a497_return_output;

     -- MUX[uxn_c_l201_c37_e57f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c37_e57f_cond <= VAR_MUX_uxn_c_l201_c37_e57f_cond;
     MUX_uxn_c_l201_c37_e57f_iftrue <= VAR_MUX_uxn_c_l201_c37_e57f_iftrue;
     MUX_uxn_c_l201_c37_e57f_iffalse <= VAR_MUX_uxn_c_l201_c37_e57f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c37_e57f_return_output := MUX_uxn_c_l201_c37_e57f_return_output;

     -- MUX[uxn_c_l206_c6_3070] LATENCY=0
     -- Inputs
     MUX_uxn_c_l206_c6_3070_cond <= VAR_MUX_uxn_c_l206_c6_3070_cond;
     MUX_uxn_c_l206_c6_3070_iftrue <= VAR_MUX_uxn_c_l206_c6_3070_iftrue;
     MUX_uxn_c_l206_c6_3070_iffalse <= VAR_MUX_uxn_c_l206_c6_3070_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l206_c6_3070_return_output := MUX_uxn_c_l206_c6_3070_return_output;

     -- BIN_OP_AND[uxn_c_l222_c22_1d20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c22_1d20_left <= VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_left;
     BIN_OP_AND_uxn_c_l222_c22_1d20_right <= VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_return_output := BIN_OP_AND_uxn_c_l222_c22_1d20_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_right := VAR_BIN_OP_AND_uxn_c_l215_c22_38e9_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_right := VAR_BIN_OP_AND_uxn_c_l222_c22_1d20_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr := VAR_BIN_OP_AND_uxn_c_l232_c38_fb82_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_654f_left := VAR_MUX_uxn_c_l201_c37_e57f_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l205_c6_e742_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l206_c6_3070_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_c760_write_value := VAR_MUX_uxn_c_l214_c3_a497_return_output;
     -- BIN_OP_OR[uxn_c_l222_c3_2cc7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c3_2cc7_left <= VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_left;
     BIN_OP_OR_uxn_c_l222_c3_2cc7_right <= VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output := BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output;

     -- BIN_OP_OR[uxn_c_l201_c37_654f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l201_c37_654f_left <= VAR_BIN_OP_OR_uxn_c_l201_c37_654f_left;
     BIN_OP_OR_uxn_c_l201_c37_654f_right <= VAR_BIN_OP_OR_uxn_c_l201_c37_654f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l201_c37_654f_return_output := BIN_OP_OR_uxn_c_l201_c37_654f_return_output;

     -- UNARY_OP_NOT[uxn_c_l232_c38_dd0e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr <= VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output := UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output;

     -- BIN_OP_OR[uxn_c_l215_c3_ec0b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l215_c3_ec0b_left <= VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_left;
     BIN_OP_OR_uxn_c_l215_c3_ec0b_right <= VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output := BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l211_c27_c760_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_654f_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_654f_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_c760_write_enable := VAR_BIN_OP_OR_uxn_c_l215_c3_ec0b_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_enable := VAR_BIN_OP_OR_uxn_c_l222_c3_2cc7_return_output;
     VAR_MUX_uxn_c_l232_c19_6414_iftrue := VAR_UNARY_OP_NOT_uxn_c_l232_c38_dd0e_return_output;
     -- bg_vram_update[uxn_c_l211_c27_c760] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l211_c27_c760_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l211_c27_c760_read_address <= VAR_bg_vram_update_uxn_c_l211_c27_c760_read_address;
     bg_vram_update_uxn_c_l211_c27_c760_write_address <= VAR_bg_vram_update_uxn_c_l211_c27_c760_write_address;
     bg_vram_update_uxn_c_l211_c27_c760_write_value <= VAR_bg_vram_update_uxn_c_l211_c27_c760_write_value;
     bg_vram_update_uxn_c_l211_c27_c760_write_enable <= VAR_bg_vram_update_uxn_c_l211_c27_c760_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l211_c27_c760_return_output := bg_vram_update_uxn_c_l211_c27_c760_return_output;

     -- fg_vram_update[uxn_c_l218_c27_03a0] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l218_c27_03a0_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l218_c27_03a0_read_address <= VAR_fg_vram_update_uxn_c_l218_c27_03a0_read_address;
     fg_vram_update_uxn_c_l218_c27_03a0_write_address <= VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_address;
     fg_vram_update_uxn_c_l218_c27_03a0_write_value <= VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_value;
     fg_vram_update_uxn_c_l218_c27_03a0_write_enable <= VAR_fg_vram_update_uxn_c_l218_c27_03a0_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l218_c27_03a0_return_output := fg_vram_update_uxn_c_l218_c27_03a0_return_output;

     -- MUX[uxn_c_l232_c19_6414] LATENCY=0
     -- Inputs
     MUX_uxn_c_l232_c19_6414_cond <= VAR_MUX_uxn_c_l232_c19_6414_cond;
     MUX_uxn_c_l232_c19_6414_iftrue <= VAR_MUX_uxn_c_l232_c19_6414_iftrue;
     MUX_uxn_c_l232_c19_6414_iffalse <= VAR_MUX_uxn_c_l232_c19_6414_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l232_c19_6414_return_output := MUX_uxn_c_l232_c19_6414_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l232_c19_6414_return_output;
     VAR_MUX_uxn_c_l236_c17_d335_iftrue := VAR_bg_vram_update_uxn_c_l211_c27_c760_return_output;
     VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_left := VAR_fg_vram_update_uxn_c_l218_c27_03a0_return_output;
     VAR_MUX_uxn_c_l236_c17_d335_iffalse := VAR_fg_vram_update_uxn_c_l218_c27_03a0_return_output;
     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_b34b] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_b34b_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_a282_return_output,
     VAR_MUX_uxn_c_l232_c19_6414_return_output);

     -- BIN_OP_EQ[uxn_c_l236_c17_8278] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c17_8278_left <= VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_left;
     BIN_OP_EQ_uxn_c_l236_c17_8278_right <= VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_return_output := BIN_OP_EQ_uxn_c_l236_c17_8278_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l236_c17_d335_cond := VAR_BIN_OP_EQ_uxn_c_l236_c17_8278_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_b34b_return_output;
     -- MUX[uxn_c_l236_c17_d335] LATENCY=0
     -- Inputs
     MUX_uxn_c_l236_c17_d335_cond <= VAR_MUX_uxn_c_l236_c17_d335_cond;
     MUX_uxn_c_l236_c17_d335_iftrue <= VAR_MUX_uxn_c_l236_c17_d335_iftrue;
     MUX_uxn_c_l236_c17_d335_iffalse <= VAR_MUX_uxn_c_l236_c17_d335_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l236_c17_d335_return_output := MUX_uxn_c_l236_c17_d335_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_9af1 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_9af1_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l235_c25_ba64_return_output,
     VAR_MUX_uxn_c_l236_c17_d335_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_9af1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_9af1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_queue_read_ptr <= REG_VAR_queue_read_ptr;
REG_COMB_queue_write_ptr <= REG_VAR_queue_write_ptr;
REG_COMB_current_queue_item <= REG_VAR_current_queue_item;
REG_COMB_queue_write_value <= REG_VAR_queue_write_value;
REG_COMB_queue_read_value <= REG_VAR_queue_read_value;
REG_COMB_queue_write_enable <= REG_VAR_queue_write_enable;
REG_COMB_queue_phase <= REG_VAR_queue_phase;
REG_COMB_is_buffer_swapped <= REG_VAR_is_buffer_swapped;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_new_fill_row <= REG_VAR_is_new_fill_row;
REG_COMB_is_last_fill_col <= REG_VAR_is_last_fill_col;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_is_fill_top <= REG_VAR_is_fill_top;
REG_COMB_is_fill_left <= REG_VAR_is_fill_left;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_is_caught_up <= REG_VAR_is_caught_up;
REG_COMB_is_read_ready <= REG_VAR_is_read_ready;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     queue_read_ptr <= REG_COMB_queue_read_ptr;
     queue_write_ptr <= REG_COMB_queue_write_ptr;
     current_queue_item <= REG_COMB_current_queue_item;
     queue_write_value <= REG_COMB_queue_write_value;
     queue_read_value <= REG_COMB_queue_read_value;
     queue_write_enable <= REG_COMB_queue_write_enable;
     queue_phase <= REG_COMB_queue_phase;
     is_buffer_swapped <= REG_COMB_is_buffer_swapped;
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     fill_color <= REG_COMB_fill_color;
     is_new_fill_row <= REG_COMB_is_new_fill_row;
     is_last_fill_col <= REG_COMB_is_last_fill_col;
     is_fill_active <= REG_COMB_is_fill_active;
     fill_layer <= REG_COMB_fill_layer;
     is_fill_top <= REG_COMB_is_fill_top;
     is_fill_left <= REG_COMB_is_fill_left;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     is_caught_up <= REG_COMB_is_caught_up;
     is_read_ready <= REG_COMB_is_read_ready;
 end if;
 end if;
end process;

end arch;
