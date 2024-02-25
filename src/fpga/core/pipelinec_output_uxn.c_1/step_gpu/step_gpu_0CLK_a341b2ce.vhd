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
-- BIN_OP_XOR[uxn_c_l157_c2_4a58]
signal BIN_OP_XOR_uxn_c_l157_c2_4a58_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_4a58_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_5fdc]
signal BIN_OP_EQ_uxn_c_l158_c17_5fdc_left : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_5fdc_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_882f]
signal MUX_uxn_c_l158_c17_882f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_882f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_882f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_882f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_d1a8]
signal BIN_OP_EQ_uxn_c_l159_c18_d1a8_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_d1a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_28ef]
signal MUX_uxn_c_l159_c18_28ef_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_28ef_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_28ef_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_28ef_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_853e]
signal UNARY_OP_NOT_uxn_c_l161_c7_853e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_7fc6]
signal UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_79fb]
signal BIN_OP_AND_uxn_c_l161_c7_79fb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_79fb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_79fb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_f67f]
signal BIN_OP_AND_uxn_c_l161_c7_f67f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_f67f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_f67f_return_output : unsigned(0 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_45f3]
signal current_queue_item_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output : draw_command_t;

-- queue_read_ptr_MUX[uxn_c_l161_c2_45f3]
signal queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l161_c2_45f3]
signal queue_phase_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_45f3_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_0515]
signal BIN_OP_PLUS_uxn_c_l170_c3_0515_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_0515_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output : unsigned(10 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_2b50]
signal queue_write_value_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(23 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_2b50]
signal queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_2b50]
signal queue_phase_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_8195]
signal BIN_OP_PLUS_uxn_c_l178_c3_8195_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_8195_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output : unsigned(10 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_cb98]
signal BIN_OP_EQ_uxn_c_l182_c16_cb98_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_cb98_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_5c5f]
signal BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_848b]
signal MUX_uxn_c_l182_c16_848b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_848b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_848b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_848b_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_dcb5]
signal BIN_OP_AND_uxn_c_l184_c6_dcb5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_dcb5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l184_c66_5b4a]
signal UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_5d83]
signal BIN_OP_AND_uxn_c_l184_c6_5d83_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_5d83_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_5d83_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l184_c2_9387]
signal fill_y0_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l184_c2_9387]
signal fill_layer_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l184_c2_9387]
signal is_fill_left_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l184_c2_9387]
signal x_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l184_c2_9387]
signal y_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- is_fill_active_MUX[uxn_c_l184_c2_9387]
signal is_fill_active_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l184_c2_9387]
signal fill_x0_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l184_c2_9387]
signal fill_color_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_9387_return_output : unsigned(1 downto 0);

-- fill_y1_MUX[uxn_c_l184_c2_9387]
signal fill_y1_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l184_c2_9387]
signal is_fill_top_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l184_c2_9387]
signal fill_x1_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l188_c13_c791]
signal MUX_uxn_c_l188_c13_c791_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_c791_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_c791_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_c791_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c28_4a2e]
signal BIN_OP_AND_uxn_c_l189_c28_4a2e_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_4a2e_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l189_c13_94f2]
signal MUX_uxn_c_l189_c13_94f2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_94f2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_94f2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_94f2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l190_c13_3b2f]
signal MUX_uxn_c_l190_c13_3b2f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_3b2f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_3b2f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_3b2f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c32_7d7e]
signal BIN_OP_AND_uxn_c_l191_c32_7d7e_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_7d7e_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l191_c13_9026]
signal MUX_uxn_c_l191_c13_9026_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_9026_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_9026_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_9026_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l200_c52_5576]
signal BIN_OP_AND_uxn_c_l200_c52_5576_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_5576_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_5576_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l200_c52_69bc]
signal MUX_uxn_c_l200_c52_69bc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l200_c52_69bc_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_69bc_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_69bc_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l200_c35_4a3d]
signal BIN_OP_OR_uxn_c_l200_c35_4a3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_4a3d_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output : unsigned(16 downto 0);

-- CONST_SL_8[uxn_c_l201_c56_7606]
signal CONST_SL_8_uxn_c_l201_c56_7606_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l201_c56_7606_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l201_c56_e0ae]
signal BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l201_c37_d40e]
signal MUX_uxn_c_l201_c37_d40e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c37_d40e_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_d40e_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_d40e_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l201_c108_90be]
signal UNARY_OP_NOT_uxn_c_l201_c108_90be_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c108_a328]
signal BIN_OP_AND_uxn_c_l201_c108_a328_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_a328_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_a328_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c108_61e0]
signal MUX_uxn_c_l201_c108_61e0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c108_61e0_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_61e0_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_61e0_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l201_c37_5809]
signal BIN_OP_OR_uxn_c_l201_c37_5809_left : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_5809_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_5809_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l203_c21_6b3b]
signal BIN_OP_EQ_uxn_c_l203_c21_6b3b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_6b3b_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l203_c21_797f]
signal MUX_uxn_c_l203_c21_797f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_797f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_797f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_797f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l204_c22_c41a]
signal BIN_OP_EQ_uxn_c_l204_c22_c41a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_c41a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l204_c22_84ce]
signal MUX_uxn_c_l204_c22_84ce_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_84ce_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_84ce_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_84ce_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l205_c25_071a]
signal BIN_OP_PLUS_uxn_c_l205_c25_071a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_071a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l205_c6_76c2]
signal MUX_uxn_c_l205_c6_76c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c6_76c2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_76c2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_76c2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l206_c34_8c63]
signal BIN_OP_PLUS_uxn_c_l206_c34_8c63_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_8c63_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l206_c6_4a74]
signal MUX_uxn_c_l206_c6_4a74_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l206_c6_4a74_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_4a74_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_4a74_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l208_c46_576c]
signal UNARY_OP_NOT_uxn_c_l208_c46_576c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l208_c27_8f9c]
signal BIN_OP_AND_uxn_c_l208_c27_8f9c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_8f9c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l209_c27_acfd]
signal BIN_OP_AND_uxn_c_l209_c27_acfd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_acfd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_acfd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l214_c3_f09d]
signal MUX_uxn_c_l214_c3_f09d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l214_c3_f09d_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_f09d_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_f09d_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l215_c71_8ec4]
signal UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l215_c22_acb8]
signal BIN_OP_AND_uxn_c_l215_c22_acb8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_acb8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_acb8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l215_c3_09e5]
signal BIN_OP_OR_uxn_c_l215_c3_09e5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_09e5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_09e5_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l211_c27_2f63]
signal bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_2f63_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_2f63_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_2f63_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l211_c27_2f63_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_2f63_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l221_c3_d947]
signal MUX_uxn_c_l221_c3_d947_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c3_d947_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_d947_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_d947_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l222_c22_5a31]
signal BIN_OP_AND_uxn_c_l222_c22_5a31_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_5a31_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_5a31_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l222_c3_30d6]
signal BIN_OP_OR_uxn_c_l222_c3_30d6_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_30d6_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_30d6_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l218_c27_62f4]
signal fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_62f4_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_62f4_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_62f4_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l218_c27_62f4_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_62f4_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l225_c21_f742]
signal draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_f742_read_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_f742_write_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_f742_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l225_c21_f742_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_f742_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l232_c38_33c1]
signal BIN_OP_AND_uxn_c_l232_c38_33c1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_33c1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_33c1_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l232_c38_34fd]
signal UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l232_c19_49c2]
signal MUX_uxn_c_l232_c19_49c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_49c2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_49c2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_49c2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l234_c19_a68b]
signal BIN_OP_EQ_uxn_c_l234_c19_a68b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_a68b_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l234_c76_8a51]
signal BIN_OP_PLUS_uxn_c_l234_c76_8a51_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_8a51_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l234_c50_4a29]
signal MUX_uxn_c_l234_c50_4a29_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c50_4a29_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_4a29_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_4a29_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l234_c19_e88d]
signal MUX_uxn_c_l234_c19_e88d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c19_e88d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_e88d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_e88d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l235_c25_7bce]
signal BIN_OP_EQ_uxn_c_l235_c25_7bce_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_7bce_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l235_c25_c6b8]
signal MUX_uxn_c_l235_c25_c6b8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_c6b8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_c6b8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_c6b8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c17_741a]
signal BIN_OP_EQ_uxn_c_l236_c17_741a_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_741a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_741a_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l236_c17_f6c3]
signal MUX_uxn_c_l236_c17_f6c3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c17_f6c3_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_f6c3_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_f6c3_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08
signal CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l157_c2_4a58
BIN_OP_XOR_uxn_c_l157_c2_4a58 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_4a58_left,
BIN_OP_XOR_uxn_c_l157_c2_4a58_right,
BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_5fdc
BIN_OP_EQ_uxn_c_l158_c17_5fdc : entity work.BIN_OP_EQ_uint10_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_5fdc_left,
BIN_OP_EQ_uxn_c_l158_c17_5fdc_right,
BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output);

-- MUX_uxn_c_l158_c17_882f
MUX_uxn_c_l158_c17_882f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_882f_cond,
MUX_uxn_c_l158_c17_882f_iftrue,
MUX_uxn_c_l158_c17_882f_iffalse,
MUX_uxn_c_l158_c17_882f_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_d1a8
BIN_OP_EQ_uxn_c_l159_c18_d1a8 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_d1a8_left,
BIN_OP_EQ_uxn_c_l159_c18_d1a8_right,
BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output);

-- MUX_uxn_c_l159_c18_28ef
MUX_uxn_c_l159_c18_28ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_28ef_cond,
MUX_uxn_c_l159_c18_28ef_iftrue,
MUX_uxn_c_l159_c18_28ef_iffalse,
MUX_uxn_c_l159_c18_28ef_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_853e
UNARY_OP_NOT_uxn_c_l161_c7_853e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_853e_expr,
UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_7fc6
UNARY_OP_NOT_uxn_c_l161_c38_7fc6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr,
UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_79fb
BIN_OP_AND_uxn_c_l161_c7_79fb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_79fb_left,
BIN_OP_AND_uxn_c_l161_c7_79fb_right,
BIN_OP_AND_uxn_c_l161_c7_79fb_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_f67f
BIN_OP_AND_uxn_c_l161_c7_f67f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_f67f_left,
BIN_OP_AND_uxn_c_l161_c7_f67f_right,
BIN_OP_AND_uxn_c_l161_c7_f67f_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_45f3
current_queue_item_MUX_uxn_c_l161_c2_45f3 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_45f3_cond,
current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_45f3
queue_read_ptr_MUX_uxn_c_l161_c2_45f3 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_45f3
queue_phase_MUX_uxn_c_l161_c2_45f3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_45f3_cond,
queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue,
queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse,
queue_phase_MUX_uxn_c_l161_c2_45f3_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_0515
BIN_OP_PLUS_uxn_c_l170_c3_0515 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_0515_left,
BIN_OP_PLUS_uxn_c_l170_c3_0515_right,
BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_2b50
queue_write_value_MUX_uxn_c_l173_c2_2b50 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_2b50_cond,
queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_2b50
queue_write_ptr_MUX_uxn_c_l173_c2_2b50 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_2b50
queue_phase_MUX_uxn_c_l173_c2_2b50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_2b50_cond,
queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue,
queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse,
queue_phase_MUX_uxn_c_l173_c2_2b50_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_8195
BIN_OP_PLUS_uxn_c_l178_c3_8195 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_8195_left,
BIN_OP_PLUS_uxn_c_l178_c3_8195_right,
BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_cb98
BIN_OP_EQ_uxn_c_l182_c16_cb98 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_cb98_left,
BIN_OP_EQ_uxn_c_l182_c16_cb98_right,
BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_5c5f
BIN_OP_PLUS_uxn_c_l182_c39_5c5f : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left,
BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right,
BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output);

-- MUX_uxn_c_l182_c16_848b
MUX_uxn_c_l182_c16_848b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_848b_cond,
MUX_uxn_c_l182_c16_848b_iftrue,
MUX_uxn_c_l182_c16_848b_iffalse,
MUX_uxn_c_l182_c16_848b_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_dcb5
BIN_OP_AND_uxn_c_l184_c6_dcb5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_dcb5_left,
BIN_OP_AND_uxn_c_l184_c6_dcb5_right,
BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output);

-- UNARY_OP_NOT_uxn_c_l184_c66_5b4a
UNARY_OP_NOT_uxn_c_l184_c66_5b4a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr,
UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_5d83
BIN_OP_AND_uxn_c_l184_c6_5d83 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_5d83_left,
BIN_OP_AND_uxn_c_l184_c6_5d83_right,
BIN_OP_AND_uxn_c_l184_c6_5d83_return_output);

-- fill_y0_MUX_uxn_c_l184_c2_9387
fill_y0_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l184_c2_9387_cond,
fill_y0_MUX_uxn_c_l184_c2_9387_iftrue,
fill_y0_MUX_uxn_c_l184_c2_9387_iffalse,
fill_y0_MUX_uxn_c_l184_c2_9387_return_output);

-- fill_layer_MUX_uxn_c_l184_c2_9387
fill_layer_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l184_c2_9387_cond,
fill_layer_MUX_uxn_c_l184_c2_9387_iftrue,
fill_layer_MUX_uxn_c_l184_c2_9387_iffalse,
fill_layer_MUX_uxn_c_l184_c2_9387_return_output);

-- is_fill_left_MUX_uxn_c_l184_c2_9387
is_fill_left_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l184_c2_9387_cond,
is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue,
is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse,
is_fill_left_MUX_uxn_c_l184_c2_9387_return_output);

-- x_MUX_uxn_c_l184_c2_9387
x_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l184_c2_9387_cond,
x_MUX_uxn_c_l184_c2_9387_iftrue,
x_MUX_uxn_c_l184_c2_9387_iffalse,
x_MUX_uxn_c_l184_c2_9387_return_output);

-- y_MUX_uxn_c_l184_c2_9387
y_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l184_c2_9387_cond,
y_MUX_uxn_c_l184_c2_9387_iftrue,
y_MUX_uxn_c_l184_c2_9387_iffalse,
y_MUX_uxn_c_l184_c2_9387_return_output);

-- is_fill_active_MUX_uxn_c_l184_c2_9387
is_fill_active_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l184_c2_9387_cond,
is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue,
is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse,
is_fill_active_MUX_uxn_c_l184_c2_9387_return_output);

-- fill_x0_MUX_uxn_c_l184_c2_9387
fill_x0_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l184_c2_9387_cond,
fill_x0_MUX_uxn_c_l184_c2_9387_iftrue,
fill_x0_MUX_uxn_c_l184_c2_9387_iffalse,
fill_x0_MUX_uxn_c_l184_c2_9387_return_output);

-- fill_color_MUX_uxn_c_l184_c2_9387
fill_color_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l184_c2_9387_cond,
fill_color_MUX_uxn_c_l184_c2_9387_iftrue,
fill_color_MUX_uxn_c_l184_c2_9387_iffalse,
fill_color_MUX_uxn_c_l184_c2_9387_return_output);

-- fill_y1_MUX_uxn_c_l184_c2_9387
fill_y1_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l184_c2_9387_cond,
fill_y1_MUX_uxn_c_l184_c2_9387_iftrue,
fill_y1_MUX_uxn_c_l184_c2_9387_iffalse,
fill_y1_MUX_uxn_c_l184_c2_9387_return_output);

-- is_fill_top_MUX_uxn_c_l184_c2_9387
is_fill_top_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l184_c2_9387_cond,
is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue,
is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse,
is_fill_top_MUX_uxn_c_l184_c2_9387_return_output);

-- fill_x1_MUX_uxn_c_l184_c2_9387
fill_x1_MUX_uxn_c_l184_c2_9387 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l184_c2_9387_cond,
fill_x1_MUX_uxn_c_l184_c2_9387_iftrue,
fill_x1_MUX_uxn_c_l184_c2_9387_iffalse,
fill_x1_MUX_uxn_c_l184_c2_9387_return_output);

-- MUX_uxn_c_l188_c13_c791
MUX_uxn_c_l188_c13_c791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_c791_cond,
MUX_uxn_c_l188_c13_c791_iftrue,
MUX_uxn_c_l188_c13_c791_iffalse,
MUX_uxn_c_l188_c13_c791_return_output);

-- BIN_OP_AND_uxn_c_l189_c28_4a2e
BIN_OP_AND_uxn_c_l189_c28_4a2e : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c28_4a2e_left,
BIN_OP_AND_uxn_c_l189_c28_4a2e_right,
BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output);

-- MUX_uxn_c_l189_c13_94f2
MUX_uxn_c_l189_c13_94f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_94f2_cond,
MUX_uxn_c_l189_c13_94f2_iftrue,
MUX_uxn_c_l189_c13_94f2_iffalse,
MUX_uxn_c_l189_c13_94f2_return_output);

-- MUX_uxn_c_l190_c13_3b2f
MUX_uxn_c_l190_c13_3b2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_3b2f_cond,
MUX_uxn_c_l190_c13_3b2f_iftrue,
MUX_uxn_c_l190_c13_3b2f_iffalse,
MUX_uxn_c_l190_c13_3b2f_return_output);

-- BIN_OP_AND_uxn_c_l191_c32_7d7e
BIN_OP_AND_uxn_c_l191_c32_7d7e : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c32_7d7e_left,
BIN_OP_AND_uxn_c_l191_c32_7d7e_right,
BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output);

-- MUX_uxn_c_l191_c13_9026
MUX_uxn_c_l191_c13_9026 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_9026_cond,
MUX_uxn_c_l191_c13_9026_iftrue,
MUX_uxn_c_l191_c13_9026_iffalse,
MUX_uxn_c_l191_c13_9026_return_output);

-- BIN_OP_AND_uxn_c_l200_c52_5576
BIN_OP_AND_uxn_c_l200_c52_5576 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l200_c52_5576_left,
BIN_OP_AND_uxn_c_l200_c52_5576_right,
BIN_OP_AND_uxn_c_l200_c52_5576_return_output);

-- MUX_uxn_c_l200_c52_69bc
MUX_uxn_c_l200_c52_69bc : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l200_c52_69bc_cond,
MUX_uxn_c_l200_c52_69bc_iftrue,
MUX_uxn_c_l200_c52_69bc_iffalse,
MUX_uxn_c_l200_c52_69bc_return_output);

-- BIN_OP_OR_uxn_c_l200_c35_4a3d
BIN_OP_OR_uxn_c_l200_c35_4a3d : entity work.BIN_OP_OR_uint16_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l200_c35_4a3d_left,
BIN_OP_OR_uxn_c_l200_c35_4a3d_right,
BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output);

-- CONST_SL_8_uxn_c_l201_c56_7606
CONST_SL_8_uxn_c_l201_c56_7606 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l201_c56_7606_x,
CONST_SL_8_uxn_c_l201_c56_7606_return_output);

-- BIN_OP_PLUS_uxn_c_l201_c56_e0ae
BIN_OP_PLUS_uxn_c_l201_c56_e0ae : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left,
BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right,
BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output);

-- MUX_uxn_c_l201_c37_d40e
MUX_uxn_c_l201_c37_d40e : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c37_d40e_cond,
MUX_uxn_c_l201_c37_d40e_iftrue,
MUX_uxn_c_l201_c37_d40e_iffalse,
MUX_uxn_c_l201_c37_d40e_return_output);

-- UNARY_OP_NOT_uxn_c_l201_c108_90be
UNARY_OP_NOT_uxn_c_l201_c108_90be : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l201_c108_90be_expr,
UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output);

-- BIN_OP_AND_uxn_c_l201_c108_a328
BIN_OP_AND_uxn_c_l201_c108_a328 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c108_a328_left,
BIN_OP_AND_uxn_c_l201_c108_a328_right,
BIN_OP_AND_uxn_c_l201_c108_a328_return_output);

-- MUX_uxn_c_l201_c108_61e0
MUX_uxn_c_l201_c108_61e0 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c108_61e0_cond,
MUX_uxn_c_l201_c108_61e0_iftrue,
MUX_uxn_c_l201_c108_61e0_iffalse,
MUX_uxn_c_l201_c108_61e0_return_output);

-- BIN_OP_OR_uxn_c_l201_c37_5809
BIN_OP_OR_uxn_c_l201_c37_5809 : entity work.BIN_OP_OR_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l201_c37_5809_left,
BIN_OP_OR_uxn_c_l201_c37_5809_right,
BIN_OP_OR_uxn_c_l201_c37_5809_return_output);

-- BIN_OP_EQ_uxn_c_l203_c21_6b3b
BIN_OP_EQ_uxn_c_l203_c21_6b3b : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l203_c21_6b3b_left,
BIN_OP_EQ_uxn_c_l203_c21_6b3b_right,
BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output);

-- MUX_uxn_c_l203_c21_797f
MUX_uxn_c_l203_c21_797f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l203_c21_797f_cond,
MUX_uxn_c_l203_c21_797f_iftrue,
MUX_uxn_c_l203_c21_797f_iffalse,
MUX_uxn_c_l203_c21_797f_return_output);

-- BIN_OP_EQ_uxn_c_l204_c22_c41a
BIN_OP_EQ_uxn_c_l204_c22_c41a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l204_c22_c41a_left,
BIN_OP_EQ_uxn_c_l204_c22_c41a_right,
BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output);

-- MUX_uxn_c_l204_c22_84ce
MUX_uxn_c_l204_c22_84ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l204_c22_84ce_cond,
MUX_uxn_c_l204_c22_84ce_iftrue,
MUX_uxn_c_l204_c22_84ce_iffalse,
MUX_uxn_c_l204_c22_84ce_return_output);

-- BIN_OP_PLUS_uxn_c_l205_c25_071a
BIN_OP_PLUS_uxn_c_l205_c25_071a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l205_c25_071a_left,
BIN_OP_PLUS_uxn_c_l205_c25_071a_right,
BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output);

-- MUX_uxn_c_l205_c6_76c2
MUX_uxn_c_l205_c6_76c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l205_c6_76c2_cond,
MUX_uxn_c_l205_c6_76c2_iftrue,
MUX_uxn_c_l205_c6_76c2_iffalse,
MUX_uxn_c_l205_c6_76c2_return_output);

-- BIN_OP_PLUS_uxn_c_l206_c34_8c63
BIN_OP_PLUS_uxn_c_l206_c34_8c63 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l206_c34_8c63_left,
BIN_OP_PLUS_uxn_c_l206_c34_8c63_right,
BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output);

-- MUX_uxn_c_l206_c6_4a74
MUX_uxn_c_l206_c6_4a74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l206_c6_4a74_cond,
MUX_uxn_c_l206_c6_4a74_iftrue,
MUX_uxn_c_l206_c6_4a74_iffalse,
MUX_uxn_c_l206_c6_4a74_return_output);

-- UNARY_OP_NOT_uxn_c_l208_c46_576c
UNARY_OP_NOT_uxn_c_l208_c46_576c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l208_c46_576c_expr,
UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output);

-- BIN_OP_AND_uxn_c_l208_c27_8f9c
BIN_OP_AND_uxn_c_l208_c27_8f9c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l208_c27_8f9c_left,
BIN_OP_AND_uxn_c_l208_c27_8f9c_right,
BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output);

-- BIN_OP_AND_uxn_c_l209_c27_acfd
BIN_OP_AND_uxn_c_l209_c27_acfd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c27_acfd_left,
BIN_OP_AND_uxn_c_l209_c27_acfd_right,
BIN_OP_AND_uxn_c_l209_c27_acfd_return_output);

-- MUX_uxn_c_l214_c3_f09d
MUX_uxn_c_l214_c3_f09d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l214_c3_f09d_cond,
MUX_uxn_c_l214_c3_f09d_iftrue,
MUX_uxn_c_l214_c3_f09d_iffalse,
MUX_uxn_c_l214_c3_f09d_return_output);

-- UNARY_OP_NOT_uxn_c_l215_c71_8ec4
UNARY_OP_NOT_uxn_c_l215_c71_8ec4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr,
UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output);

-- BIN_OP_AND_uxn_c_l215_c22_acb8
BIN_OP_AND_uxn_c_l215_c22_acb8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c22_acb8_left,
BIN_OP_AND_uxn_c_l215_c22_acb8_right,
BIN_OP_AND_uxn_c_l215_c22_acb8_return_output);

-- BIN_OP_OR_uxn_c_l215_c3_09e5
BIN_OP_OR_uxn_c_l215_c3_09e5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l215_c3_09e5_left,
BIN_OP_OR_uxn_c_l215_c3_09e5_right,
BIN_OP_OR_uxn_c_l215_c3_09e5_return_output);

-- bg_vram_update_uxn_c_l211_c27_2f63
bg_vram_update_uxn_c_l211_c27_2f63 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE,
bg_vram_update_uxn_c_l211_c27_2f63_read_address,
bg_vram_update_uxn_c_l211_c27_2f63_write_address,
bg_vram_update_uxn_c_l211_c27_2f63_write_value,
bg_vram_update_uxn_c_l211_c27_2f63_write_enable,
bg_vram_update_uxn_c_l211_c27_2f63_return_output);

-- MUX_uxn_c_l221_c3_d947
MUX_uxn_c_l221_c3_d947 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c3_d947_cond,
MUX_uxn_c_l221_c3_d947_iftrue,
MUX_uxn_c_l221_c3_d947_iffalse,
MUX_uxn_c_l221_c3_d947_return_output);

-- BIN_OP_AND_uxn_c_l222_c22_5a31
BIN_OP_AND_uxn_c_l222_c22_5a31 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c22_5a31_left,
BIN_OP_AND_uxn_c_l222_c22_5a31_right,
BIN_OP_AND_uxn_c_l222_c22_5a31_return_output);

-- BIN_OP_OR_uxn_c_l222_c3_30d6
BIN_OP_OR_uxn_c_l222_c3_30d6 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c3_30d6_left,
BIN_OP_OR_uxn_c_l222_c3_30d6_right,
BIN_OP_OR_uxn_c_l222_c3_30d6_return_output);

-- fg_vram_update_uxn_c_l218_c27_62f4
fg_vram_update_uxn_c_l218_c27_62f4 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE,
fg_vram_update_uxn_c_l218_c27_62f4_read_address,
fg_vram_update_uxn_c_l218_c27_62f4_write_address,
fg_vram_update_uxn_c_l218_c27_62f4_write_value,
fg_vram_update_uxn_c_l218_c27_62f4_write_enable,
fg_vram_update_uxn_c_l218_c27_62f4_return_output);

-- draw_queue_update_uxn_c_l225_c21_f742
draw_queue_update_uxn_c_l225_c21_f742 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE,
draw_queue_update_uxn_c_l225_c21_f742_read_address,
draw_queue_update_uxn_c_l225_c21_f742_write_address,
draw_queue_update_uxn_c_l225_c21_f742_write_value,
draw_queue_update_uxn_c_l225_c21_f742_write_enable,
draw_queue_update_uxn_c_l225_c21_f742_return_output);

-- BIN_OP_AND_uxn_c_l232_c38_33c1
BIN_OP_AND_uxn_c_l232_c38_33c1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c38_33c1_left,
BIN_OP_AND_uxn_c_l232_c38_33c1_right,
BIN_OP_AND_uxn_c_l232_c38_33c1_return_output);

-- UNARY_OP_NOT_uxn_c_l232_c38_34fd
UNARY_OP_NOT_uxn_c_l232_c38_34fd : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr,
UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output);

-- MUX_uxn_c_l232_c19_49c2
MUX_uxn_c_l232_c19_49c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l232_c19_49c2_cond,
MUX_uxn_c_l232_c19_49c2_iftrue,
MUX_uxn_c_l232_c19_49c2_iffalse,
MUX_uxn_c_l232_c19_49c2_return_output);

-- BIN_OP_EQ_uxn_c_l234_c19_a68b
BIN_OP_EQ_uxn_c_l234_c19_a68b : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l234_c19_a68b_left,
BIN_OP_EQ_uxn_c_l234_c19_a68b_right,
BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output);

-- BIN_OP_PLUS_uxn_c_l234_c76_8a51
BIN_OP_PLUS_uxn_c_l234_c76_8a51 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l234_c76_8a51_left,
BIN_OP_PLUS_uxn_c_l234_c76_8a51_right,
BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output);

-- MUX_uxn_c_l234_c50_4a29
MUX_uxn_c_l234_c50_4a29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c50_4a29_cond,
MUX_uxn_c_l234_c50_4a29_iftrue,
MUX_uxn_c_l234_c50_4a29_iffalse,
MUX_uxn_c_l234_c50_4a29_return_output);

-- MUX_uxn_c_l234_c19_e88d
MUX_uxn_c_l234_c19_e88d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c19_e88d_cond,
MUX_uxn_c_l234_c19_e88d_iftrue,
MUX_uxn_c_l234_c19_e88d_iffalse,
MUX_uxn_c_l234_c19_e88d_return_output);

-- BIN_OP_EQ_uxn_c_l235_c25_7bce
BIN_OP_EQ_uxn_c_l235_c25_7bce : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l235_c25_7bce_left,
BIN_OP_EQ_uxn_c_l235_c25_7bce_right,
BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output);

-- MUX_uxn_c_l235_c25_c6b8
MUX_uxn_c_l235_c25_c6b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l235_c25_c6b8_cond,
MUX_uxn_c_l235_c25_c6b8_iftrue,
MUX_uxn_c_l235_c25_c6b8_iffalse,
MUX_uxn_c_l235_c25_c6b8_return_output);

-- BIN_OP_EQ_uxn_c_l236_c17_741a
BIN_OP_EQ_uxn_c_l236_c17_741a : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c17_741a_left,
BIN_OP_EQ_uxn_c_l236_c17_741a_right,
BIN_OP_EQ_uxn_c_l236_c17_741a_return_output);

-- MUX_uxn_c_l236_c17_f6c3
MUX_uxn_c_l236_c17_f6c3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l236_c17_f6c3_cond,
MUX_uxn_c_l236_c17_f6c3_iftrue,
MUX_uxn_c_l236_c17_f6c3_iffalse,
MUX_uxn_c_l236_c17_f6c3_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08
CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x,
CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output);



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
 BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output,
 MUX_uxn_c_l158_c17_882f_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output,
 MUX_uxn_c_l159_c18_28ef_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output,
 BIN_OP_AND_uxn_c_l161_c7_79fb_return_output,
 BIN_OP_AND_uxn_c_l161_c7_f67f_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output,
 queue_phase_MUX_uxn_c_l161_c2_45f3_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output,
 queue_phase_MUX_uxn_c_l173_c2_2b50_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output,
 MUX_uxn_c_l182_c16_848b_return_output,
 BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output,
 UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output,
 BIN_OP_AND_uxn_c_l184_c6_5d83_return_output,
 fill_y0_MUX_uxn_c_l184_c2_9387_return_output,
 fill_layer_MUX_uxn_c_l184_c2_9387_return_output,
 is_fill_left_MUX_uxn_c_l184_c2_9387_return_output,
 x_MUX_uxn_c_l184_c2_9387_return_output,
 y_MUX_uxn_c_l184_c2_9387_return_output,
 is_fill_active_MUX_uxn_c_l184_c2_9387_return_output,
 fill_x0_MUX_uxn_c_l184_c2_9387_return_output,
 fill_color_MUX_uxn_c_l184_c2_9387_return_output,
 fill_y1_MUX_uxn_c_l184_c2_9387_return_output,
 is_fill_top_MUX_uxn_c_l184_c2_9387_return_output,
 fill_x1_MUX_uxn_c_l184_c2_9387_return_output,
 MUX_uxn_c_l188_c13_c791_return_output,
 BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output,
 MUX_uxn_c_l189_c13_94f2_return_output,
 MUX_uxn_c_l190_c13_3b2f_return_output,
 BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output,
 MUX_uxn_c_l191_c13_9026_return_output,
 BIN_OP_AND_uxn_c_l200_c52_5576_return_output,
 MUX_uxn_c_l200_c52_69bc_return_output,
 BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output,
 CONST_SL_8_uxn_c_l201_c56_7606_return_output,
 BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output,
 MUX_uxn_c_l201_c37_d40e_return_output,
 UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output,
 BIN_OP_AND_uxn_c_l201_c108_a328_return_output,
 MUX_uxn_c_l201_c108_61e0_return_output,
 BIN_OP_OR_uxn_c_l201_c37_5809_return_output,
 BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output,
 MUX_uxn_c_l203_c21_797f_return_output,
 BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output,
 MUX_uxn_c_l204_c22_84ce_return_output,
 BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output,
 MUX_uxn_c_l205_c6_76c2_return_output,
 BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output,
 MUX_uxn_c_l206_c6_4a74_return_output,
 UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output,
 BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output,
 BIN_OP_AND_uxn_c_l209_c27_acfd_return_output,
 MUX_uxn_c_l214_c3_f09d_return_output,
 UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output,
 BIN_OP_AND_uxn_c_l215_c22_acb8_return_output,
 BIN_OP_OR_uxn_c_l215_c3_09e5_return_output,
 bg_vram_update_uxn_c_l211_c27_2f63_return_output,
 MUX_uxn_c_l221_c3_d947_return_output,
 BIN_OP_AND_uxn_c_l222_c22_5a31_return_output,
 BIN_OP_OR_uxn_c_l222_c3_30d6_return_output,
 fg_vram_update_uxn_c_l218_c27_62f4_return_output,
 draw_queue_update_uxn_c_l225_c21_f742_return_output,
 BIN_OP_AND_uxn_c_l232_c38_33c1_return_output,
 UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output,
 MUX_uxn_c_l232_c19_49c2_return_output,
 BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output,
 BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output,
 MUX_uxn_c_l234_c50_4a29_return_output,
 MUX_uxn_c_l234_c19_e88d_return_output,
 BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output,
 MUX_uxn_c_l235_c25_c6b8_return_output,
 BIN_OP_EQ_uxn_c_l236_c17_741a_return_output,
 MUX_uxn_c_l236_c17_f6c3_return_output,
 CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_882f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_882f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_882f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_882f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_28ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_28ef_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_28ef_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_28ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_4ab5_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_return_output : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_45f3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_7981 : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_796c : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_d4bb_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_5f0b_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_c3b6_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_4156_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_c061_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_a118_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output : unsigned(10 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l176_c3_f237 : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_a05d : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_a6fb : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l174_c3_67b3 : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l174_c23_a371_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l175_c3_f3ea : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l175_c23_e380_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l176_c23_6ec4_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output : unsigned(10 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_848b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_848b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_848b_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_848b_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_ae59_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_9387_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_9387_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_9387_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_1e1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_79c4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_c791_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_c791_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_c791_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_c791_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_94f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_94f2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_94f2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_94f2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3b2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3b2f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3b2f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_3b2f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_9026_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_9026_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_9026_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_9026_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_read_address : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_69bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5576_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5576_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_5576_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_69bc_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_69bc_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_69bc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_d40e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_7606_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_7606_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_d40e_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_d40e_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_d40e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_5809_left : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_61e0_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_a328_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_a328_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_a328_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_61e0_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_61e0_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_61e0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_5809_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_5809_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_797f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_797f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_797f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_797f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_84ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_84ce_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_84ce_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_84ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_76c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_76c2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_76c2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_76c2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_4a74_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_4a74_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_4a74_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_4a74_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_f09d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_f09d_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_f09d_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_f09d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_2f63_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_d947_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_d947_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_d947_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_d947_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_62f4_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_read_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_write_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_f742_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_49c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_49c2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_49c2_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_49c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e88d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e88d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e88d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_4a29_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_4a29_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_4a29_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_4a29_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e88d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_c6b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_c6b8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_c6b8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_c6b8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_f6c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_f6c3_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_f6c3_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_f6c3_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_e4e2_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l215_l222_DUPLICATE_c4b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_4a0b_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l158_c17_882f_iffalse := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l191_c13_9026_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_queue_phase_uxn_c_l169_c3_796c := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue := VAR_queue_phase_uxn_c_l169_c3_796c;
     VAR_MUX_uxn_c_l159_c18_28ef_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l200_c52_69bc_iftrue := to_unsigned(65536, 17);
     VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_right := to_unsigned(255, 16);
     VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l158_c17_882f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l189_c13_94f2_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l204_c22_84ce_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l200_c52_69bc_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l234_c19_e88d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l235_c25_c6b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l201_c108_61e0_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l232_c19_49c2_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l190_c13_3b2f_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l204_c22_84ce_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l203_c21_797f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l159_c18_28ef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l201_c108_61e0_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l203_c21_797f_iffalse := to_unsigned(0, 1);
     VAR_queue_phase_uxn_c_l177_c3_a6fb := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue := VAR_queue_phase_uxn_c_l177_c3_a6fb;
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l188_c13_c791_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l235_c25_c6b8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l182_c16_848b_iftrue := to_unsigned(3, 2);

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
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l200_c52_5576_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l201_c108_a328_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l184_c2_9387_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iffalse := fill_y1;
     VAR_MUX_uxn_c_l234_c50_4a29_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l225_c21_f742_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_left := pixel_counter;
     VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_left := pixel_counter;
     VAR_MUX_uxn_c_l234_c50_4a29_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l184_c2_9387_iffalse := x;
     VAR_y_MUX_uxn_c_l184_c2_9387_iffalse := y;
     -- BIN_OP_EQ[uxn_c_l158_c17_5fdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_5fdc_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_left;
     BIN_OP_EQ_uxn_c_l158_c17_5fdc_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output := BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output;

     -- uint24_19_19[uxn_c_l165_c34_4156] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_4156_return_output := uint24_19_19(
     queue_read_value);

     -- uint24_15_0[uxn_c_l162_c37_d4bb] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_d4bb_return_output := uint24_15_0(
     queue_read_value);

     -- uint24_20_20[uxn_c_l166_c32_c061] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_c061_return_output := uint24_20_20(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l234_c19_a68b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l234_c19_a68b_left <= VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_left;
     BIN_OP_EQ_uxn_c_l234_c19_a68b_right <= VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output := BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output;

     -- UNARY_OP_NOT[uxn_c_l184_c66_5b4a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr <= VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output := UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output;

     -- BIN_OP_EQ[uxn_c_l159_c18_d1a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_d1a8_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_left;
     BIN_OP_EQ_uxn_c_l159_c18_d1a8_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output := BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output;

     -- uint32_uint16_0[uxn_c_l174_c23_a371] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l174_c23_a371_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- BIN_OP_XOR[uxn_c_l157_c2_4a58] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_4a58_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_left;
     BIN_OP_XOR_uxn_c_l157_c2_4a58_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output := BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_4ab5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_4ab5_return_output := current_queue_item.is_valid;

     -- uint24_18_18[uxn_c_l164_c33_c3b6] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_c3b6_return_output := uint24_18_18(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l170_c3_0515] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_0515_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_left;
     BIN_OP_PLUS_uxn_c_l170_c3_0515_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output := BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output;

     -- BIN_OP_PLUS[uxn_c_l234_c76_8a51] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l234_c76_8a51_left <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_left;
     BIN_OP_PLUS_uxn_c_l234_c76_8a51_right <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output := BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output;

     -- uint24_21_21[uxn_c_l167_c30_a118] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_a118_return_output := uint24_21_21(
     queue_read_value);

     -- uint24_17_16[uxn_c_l163_c30_5f0b] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_5f0b_return_output := uint24_17_16(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l178_c3_8195] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_8195_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_left;
     BIN_OP_PLUS_uxn_c_l178_c3_8195_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output := BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_882f_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_5fdc_return_output;
     VAR_MUX_uxn_c_l159_c18_28ef_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_d1a8_return_output;
     VAR_MUX_uxn_c_l234_c19_e88d_cond := VAR_BIN_OP_EQ_uxn_c_l234_c19_a68b_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_7981 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_0515_return_output, 10);
     VAR_queue_write_ptr_uxn_c_l178_c3_a05d := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_8195_return_output, 10);
     VAR_MUX_uxn_c_l234_c50_4a29_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l234_c76_8a51_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l200_c52_5576_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_4a58_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_4ab5_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_right := VAR_UNARY_OP_NOT_uxn_c_l184_c66_5b4a_return_output;
     VAR_queue_write_value_uxn_c_l174_c3_67b3 := resize(VAR_uint32_uint16_0_uxn_c_l174_c23_a371_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_7981;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_a05d;
     -- MUX[uxn_c_l234_c50_4a29] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c50_4a29_cond <= VAR_MUX_uxn_c_l234_c50_4a29_cond;
     MUX_uxn_c_l234_c50_4a29_iftrue <= VAR_MUX_uxn_c_l234_c50_4a29_iftrue;
     MUX_uxn_c_l234_c50_4a29_iffalse <= VAR_MUX_uxn_c_l234_c50_4a29_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c50_4a29_return_output := MUX_uxn_c_l234_c50_4a29_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c7_853e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_853e_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output := UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_45f3] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_45f3_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_d4bb_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_5f0b_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_c3b6_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_4156_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_c061_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_a118_return_output,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_c_l200_c52_5576] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l200_c52_5576_left <= VAR_BIN_OP_AND_uxn_c_l200_c52_5576_left;
     BIN_OP_AND_uxn_c_l200_c52_5576_right <= VAR_BIN_OP_AND_uxn_c_l200_c52_5576_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l200_c52_5576_return_output := BIN_OP_AND_uxn_c_l200_c52_5576_return_output;

     -- MUX[uxn_c_l159_c18_28ef] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_28ef_cond <= VAR_MUX_uxn_c_l159_c18_28ef_cond;
     MUX_uxn_c_l159_c18_28ef_iftrue <= VAR_MUX_uxn_c_l159_c18_28ef_iftrue;
     MUX_uxn_c_l159_c18_28ef_iffalse <= VAR_MUX_uxn_c_l159_c18_28ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_28ef_return_output := MUX_uxn_c_l159_c18_28ef_return_output;

     -- queue_write_ptr_MUX[uxn_c_l173_c2_2b50] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output;

     -- UNARY_OP_NOT[uxn_c_l201_c108_90be] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l201_c108_90be_expr <= VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output := UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output;

     -- MUX[uxn_c_l158_c17_882f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_882f_cond <= VAR_MUX_uxn_c_l158_c17_882f_cond;
     MUX_uxn_c_l158_c17_882f_iftrue <= VAR_MUX_uxn_c_l158_c17_882f_iftrue;
     MUX_uxn_c_l158_c17_882f_iffalse <= VAR_MUX_uxn_c_l158_c17_882f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_882f_return_output := MUX_uxn_c_l158_c17_882f_return_output;

     -- uint32_uint5_16[uxn_c_l175_c23_e380] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l175_c23_e380_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l174_c3_67b3, 32),
     resize(VAR_vram_value, 5));

     -- Submodule level 2
     VAR_MUX_uxn_c_l200_c52_69bc_cond := VAR_BIN_OP_AND_uxn_c_l200_c52_5576_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr := VAR_MUX_uxn_c_l158_c17_882f_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_882f_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_right := VAR_MUX_uxn_c_l159_c18_28ef_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_28ef_return_output;
     VAR_MUX_uxn_c_l234_c19_e88d_iffalse := VAR_MUX_uxn_c_l234_c50_4a29_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_853e_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c108_a328_left := VAR_UNARY_OP_NOT_uxn_c_l201_c108_90be_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_45f3_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_f742_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_2b50_return_output;
     VAR_queue_write_value_uxn_c_l175_c3_f3ea := resize(VAR_uint32_uint5_16_uxn_c_l175_c23_e380_return_output, 24);
     -- uint32_uint1_21[uxn_c_l176_c23_6ec4] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l176_c23_6ec4_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l175_c3_f3ea, 32),
     VAR_vram_write_layer);

     -- MUX[uxn_c_l200_c52_69bc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l200_c52_69bc_cond <= VAR_MUX_uxn_c_l200_c52_69bc_cond;
     MUX_uxn_c_l200_c52_69bc_iftrue <= VAR_MUX_uxn_c_l200_c52_69bc_iftrue;
     MUX_uxn_c_l200_c52_69bc_iffalse <= VAR_MUX_uxn_c_l200_c52_69bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l200_c52_69bc_return_output := MUX_uxn_c_l200_c52_69bc_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c38_7fc6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output := UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output;

     -- MUX[uxn_c_l234_c19_e88d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c19_e88d_cond <= VAR_MUX_uxn_c_l234_c19_e88d_cond;
     MUX_uxn_c_l234_c19_e88d_iftrue <= VAR_MUX_uxn_c_l234_c19_e88d_iftrue;
     MUX_uxn_c_l234_c19_e88d_iffalse <= VAR_MUX_uxn_c_l234_c19_e88d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c19_e88d_return_output := MUX_uxn_c_l234_c19_e88d_return_output;

     -- BIN_OP_AND[uxn_c_l201_c108_a328] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c108_a328_left <= VAR_BIN_OP_AND_uxn_c_l201_c108_a328_left;
     BIN_OP_AND_uxn_c_l201_c108_a328_right <= VAR_BIN_OP_AND_uxn_c_l201_c108_a328_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c108_a328_return_output := BIN_OP_AND_uxn_c_l201_c108_a328_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l201_c108_61e0_cond := VAR_BIN_OP_AND_uxn_c_l201_c108_a328_return_output;
     VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_right := VAR_MUX_uxn_c_l200_c52_69bc_return_output;
     VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_left := VAR_MUX_uxn_c_l234_c19_e88d_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l234_c19_e88d_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_7fc6_return_output;
     VAR_queue_write_value_uxn_c_l176_c3_f237 := resize(VAR_uint32_uint1_21_uxn_c_l176_c23_6ec4_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue := VAR_queue_write_value_uxn_c_l176_c3_f237;
     -- BIN_OP_EQ[uxn_c_l235_c25_7bce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l235_c25_7bce_left <= VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_left;
     BIN_OP_EQ_uxn_c_l235_c25_7bce_right <= VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output := BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_79fb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_79fb_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_left;
     BIN_OP_AND_uxn_c_l161_c7_79fb_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_return_output := BIN_OP_AND_uxn_c_l161_c7_79fb_return_output;

     -- BIN_OP_OR[uxn_c_l200_c35_4a3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l200_c35_4a3d_left <= VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_left;
     BIN_OP_OR_uxn_c_l200_c35_4a3d_right <= VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output := BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output;

     -- MUX[uxn_c_l201_c108_61e0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c108_61e0_cond <= VAR_MUX_uxn_c_l201_c108_61e0_cond;
     MUX_uxn_c_l201_c108_61e0_iftrue <= VAR_MUX_uxn_c_l201_c108_61e0_iftrue;
     MUX_uxn_c_l201_c108_61e0_iffalse <= VAR_MUX_uxn_c_l201_c108_61e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c108_61e0_return_output := MUX_uxn_c_l201_c108_61e0_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_2b50] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_2b50_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_cond;
     queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output := queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_left := VAR_BIN_OP_AND_uxn_c_l161_c7_79fb_return_output;
     VAR_MUX_uxn_c_l235_c25_c6b8_cond := VAR_BIN_OP_EQ_uxn_c_l235_c25_7bce_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_4a3d_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_5809_right := VAR_MUX_uxn_c_l201_c108_61e0_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_f742_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_2b50_return_output;
     -- BIN_OP_AND[uxn_c_l161_c7_f67f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_f67f_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_left;
     BIN_OP_AND_uxn_c_l161_c7_f67f_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_return_output := BIN_OP_AND_uxn_c_l161_c7_f67f_return_output;

     -- MUX[uxn_c_l235_c25_c6b8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l235_c25_c6b8_cond <= VAR_MUX_uxn_c_l235_c25_c6b8_cond;
     MUX_uxn_c_l235_c25_c6b8_iftrue <= VAR_MUX_uxn_c_l235_c25_c6b8_iftrue;
     MUX_uxn_c_l235_c25_c6b8_iffalse <= VAR_MUX_uxn_c_l235_c25_c6b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l235_c25_c6b8_return_output := MUX_uxn_c_l235_c25_c6b8_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f67f_return_output;
     -- current_queue_item_MUX[uxn_c_l161_c2_45f3] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_45f3_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_cond;
     current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output := current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output;

     -- queue_phase_MUX[uxn_c_l161_c2_45f3] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_45f3_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_cond;
     queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_return_output := queue_phase_MUX_uxn_c_l161_c2_45f3_return_output;

     -- queue_read_ptr_MUX[uxn_c_l161_c2_45f3] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_45f3_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_f742_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_45f3_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l215_l222_DUPLICATE_c4b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l215_l222_DUPLICATE_c4b0_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.is_valid;

     -- draw_queue_update[uxn_c_l225_c21_f742] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l225_c21_f742_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l225_c21_f742_read_address <= VAR_draw_queue_update_uxn_c_l225_c21_f742_read_address;
     draw_queue_update_uxn_c_l225_c21_f742_write_address <= VAR_draw_queue_update_uxn_c_l225_c21_f742_write_address;
     draw_queue_update_uxn_c_l225_c21_f742_write_value <= VAR_draw_queue_update_uxn_c_l225_c21_f742_write_value;
     draw_queue_update_uxn_c_l225_c21_f742_write_enable <= VAR_draw_queue_update_uxn_c_l225_c21_f742_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l225_c21_f742_return_output := draw_queue_update_uxn_c_l225_c21_f742_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_79c4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_79c4_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.fill_left;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.layer;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l184_c36_ae59] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_ae59_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.is_fill;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_1e1a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_1e1a_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output.fill_top;

     -- queue_phase_MUX[uxn_c_l173_c2_2b50] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_2b50_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_cond;
     queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_return_output := queue_phase_MUX_uxn_c_l173_c2_2b50_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output;
     VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output;
     VAR_MUX_uxn_c_l201_c37_d40e_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l188_l191_l190_l189_l201_DUPLICATE_27e4_return_output, 17);
     VAR_MUX_uxn_c_l189_c13_94f2_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_79c4_return_output;
     VAR_MUX_uxn_c_l191_c13_9026_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_79c4_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_79c4_return_output;
     VAR_MUX_uxn_c_l188_c13_c791_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_1e1a_return_output;
     VAR_MUX_uxn_c_l190_c13_3b2f_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_1e1a_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_1e1a_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_ae59_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l215_l222_DUPLICATE_c4b0_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l184_l215_l222_DUPLICATE_c4b0_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_5c4c_return_output;
     VAR_MUX_uxn_c_l214_c3_f09d_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff_return_output;
     VAR_MUX_uxn_c_l221_c3_d947_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff_return_output;
     VAR_fill_color_MUX_uxn_c_l184_c2_9387_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l221_l193_l214_DUPLICATE_eaff_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l225_c21_f742_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_left := VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left := VAR_queue_phase_MUX_uxn_c_l173_c2_2b50_return_output;
     -- UNARY_OP_NOT[uxn_c_l215_c71_8ec4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr <= VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output := UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_dcb5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_dcb5_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_left;
     BIN_OP_AND_uxn_c_l184_c6_dcb5_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output := BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output;

     -- BIN_OP_AND[uxn_c_l189_c28_4a2e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c28_4a2e_left <= VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_left;
     BIN_OP_AND_uxn_c_l189_c28_4a2e_right <= VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output := BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c16_cb98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_cb98_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_left;
     BIN_OP_EQ_uxn_c_l182_c16_cb98_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output := BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output;

     -- BIN_OP_AND[uxn_c_l191_c32_7d7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c32_7d7e_left <= VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_left;
     BIN_OP_AND_uxn_c_l191_c32_7d7e_right <= VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output := BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c39_5c5f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_left;
     BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output := BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output := CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_left := VAR_BIN_OP_AND_uxn_c_l184_c6_dcb5_return_output;
     VAR_MUX_uxn_c_l189_c13_94f2_iftrue := VAR_BIN_OP_AND_uxn_c_l189_c28_4a2e_return_output;
     VAR_MUX_uxn_c_l191_c13_9026_iffalse := VAR_BIN_OP_AND_uxn_c_l191_c32_7d7e_return_output;
     VAR_MUX_uxn_c_l182_c16_848b_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_cb98_return_output;
     VAR_MUX_uxn_c_l182_c16_848b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_5c5f_return_output, 2);
     VAR_MUX_uxn_c_l188_c13_c791_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output;
     VAR_MUX_uxn_c_l190_c13_3b2f_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l190_l188_DUPLICATE_ee08_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_right := VAR_UNARY_OP_NOT_uxn_c_l215_c71_8ec4_return_output;
     -- BIN_OP_AND[uxn_c_l184_c6_5d83] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_5d83_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_left;
     BIN_OP_AND_uxn_c_l184_c6_5d83_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output := BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;

     -- MUX[uxn_c_l191_c13_9026] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_9026_cond <= VAR_MUX_uxn_c_l191_c13_9026_cond;
     MUX_uxn_c_l191_c13_9026_iftrue <= VAR_MUX_uxn_c_l191_c13_9026_iftrue;
     MUX_uxn_c_l191_c13_9026_iffalse <= VAR_MUX_uxn_c_l191_c13_9026_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_9026_return_output := MUX_uxn_c_l191_c13_9026_return_output;

     -- MUX[uxn_c_l190_c13_3b2f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_3b2f_cond <= VAR_MUX_uxn_c_l190_c13_3b2f_cond;
     MUX_uxn_c_l190_c13_3b2f_iftrue <= VAR_MUX_uxn_c_l190_c13_3b2f_iftrue;
     MUX_uxn_c_l190_c13_3b2f_iffalse <= VAR_MUX_uxn_c_l190_c13_3b2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_3b2f_return_output := MUX_uxn_c_l190_c13_3b2f_return_output;

     -- MUX[uxn_c_l188_c13_c791] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_c791_cond <= VAR_MUX_uxn_c_l188_c13_c791_cond;
     MUX_uxn_c_l188_c13_c791_iftrue <= VAR_MUX_uxn_c_l188_c13_c791_iftrue;
     MUX_uxn_c_l188_c13_c791_iffalse <= VAR_MUX_uxn_c_l188_c13_c791_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_c791_return_output := MUX_uxn_c_l188_c13_c791_return_output;

     -- MUX[uxn_c_l189_c13_94f2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_94f2_cond <= VAR_MUX_uxn_c_l189_c13_94f2_cond;
     MUX_uxn_c_l189_c13_94f2_iftrue <= VAR_MUX_uxn_c_l189_c13_94f2_iftrue;
     MUX_uxn_c_l189_c13_94f2_iffalse <= VAR_MUX_uxn_c_l189_c13_94f2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_94f2_return_output := MUX_uxn_c_l189_c13_94f2_return_output;

     -- MUX[uxn_c_l182_c16_848b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_848b_cond <= VAR_MUX_uxn_c_l182_c16_848b_cond;
     MUX_uxn_c_l182_c16_848b_iftrue <= VAR_MUX_uxn_c_l182_c16_848b_iftrue;
     MUX_uxn_c_l182_c16_848b_iffalse <= VAR_MUX_uxn_c_l182_c16_848b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_848b_return_output := MUX_uxn_c_l182_c16_848b_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_x_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     VAR_y_MUX_uxn_c_l184_c2_9387_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_5d83_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_848b_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l188_c13_c791_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l189_c13_94f2_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l190_c13_3b2f_return_output;
     VAR_y_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l190_c13_3b2f_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l191_c13_9026_return_output;
     VAR_x_MUX_uxn_c_l184_c2_9387_iftrue := VAR_MUX_uxn_c_l191_c13_9026_return_output;
     -- is_fill_active_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l184_c2_9387_cond <= VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_cond;
     is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iftrue;
     is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output := is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_x0_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_x0_MUX_uxn_c_l184_c2_9387_cond;
     fill_x0_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_x0_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_x0_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l184_c2_9387_return_output := fill_x0_MUX_uxn_c_l184_c2_9387_return_output;

     -- is_fill_left_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l184_c2_9387_cond <= VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_cond;
     is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iftrue;
     is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_return_output := is_fill_left_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_y1_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_y1_MUX_uxn_c_l184_c2_9387_cond;
     fill_y1_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_y1_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_y1_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l184_c2_9387_return_output := fill_y1_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_layer_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_layer_MUX_uxn_c_l184_c2_9387_cond;
     fill_layer_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_layer_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_layer_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l184_c2_9387_return_output := fill_layer_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_x1_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_x1_MUX_uxn_c_l184_c2_9387_cond;
     fill_x1_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_x1_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_x1_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l184_c2_9387_return_output := fill_x1_MUX_uxn_c_l184_c2_9387_return_output;

     -- is_fill_top_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l184_c2_9387_cond <= VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_cond;
     is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iftrue;
     is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_return_output := is_fill_top_MUX_uxn_c_l184_c2_9387_return_output;

     -- x_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l184_c2_9387_cond <= VAR_x_MUX_uxn_c_l184_c2_9387_cond;
     x_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_x_MUX_uxn_c_l184_c2_9387_iftrue;
     x_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_x_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l184_c2_9387_return_output := x_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_color_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_color_MUX_uxn_c_l184_c2_9387_cond;
     fill_color_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_color_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_color_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_color_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l184_c2_9387_return_output := fill_color_MUX_uxn_c_l184_c2_9387_return_output;

     -- fill_y0_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l184_c2_9387_cond <= VAR_fill_y0_MUX_uxn_c_l184_c2_9387_cond;
     fill_y0_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iftrue;
     fill_y0_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_fill_y0_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l184_c2_9387_return_output := fill_y0_MUX_uxn_c_l184_c2_9387_return_output;

     -- y_MUX[uxn_c_l184_c2_9387] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l184_c2_9387_cond <= VAR_y_MUX_uxn_c_l184_c2_9387_cond;
     y_MUX_uxn_c_l184_c2_9387_iftrue <= VAR_y_MUX_uxn_c_l184_c2_9387_iftrue;
     y_MUX_uxn_c_l184_c2_9387_iffalse <= VAR_y_MUX_uxn_c_l184_c2_9387_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l184_c2_9387_return_output := y_MUX_uxn_c_l184_c2_9387_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l214_c3_f09d_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_MUX_uxn_c_l221_c3_d947_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_right := VAR_fill_layer_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_expr := VAR_fill_layer_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_MUX_uxn_c_l206_c6_4a74_iftrue := VAR_fill_x0_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_right := VAR_fill_x1_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_right := VAR_fill_y1_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_MUX_uxn_c_l201_c37_d40e_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_MUX_uxn_c_l232_c19_49c2_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr := VAR_is_fill_active_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l184_c2_9387_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_left := VAR_x_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right := VAR_x_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_left := VAR_x_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_left := VAR_y_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_left := VAR_y_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_CONST_SL_8_uxn_c_l201_c56_7606_x := VAR_y_MUX_uxn_c_l184_c2_9387_return_output;
     VAR_MUX_uxn_c_l205_c6_76c2_iffalse := VAR_y_MUX_uxn_c_l184_c2_9387_return_output;
     -- BIN_OP_AND[uxn_c_l209_c27_acfd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c27_acfd_left <= VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_left;
     BIN_OP_AND_uxn_c_l209_c27_acfd_right <= VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_return_output := BIN_OP_AND_uxn_c_l209_c27_acfd_return_output;

     -- CONST_SL_8[uxn_c_l201_c56_7606] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l201_c56_7606_x <= VAR_CONST_SL_8_uxn_c_l201_c56_7606_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l201_c56_7606_return_output := CONST_SL_8_uxn_c_l201_c56_7606_return_output;

     -- BIN_OP_PLUS[uxn_c_l205_c25_071a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l205_c25_071a_left <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_left;
     BIN_OP_PLUS_uxn_c_l205_c25_071a_right <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output := BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output;

     -- UNARY_OP_NOT[uxn_c_l208_c46_576c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l208_c46_576c_expr <= VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output := UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output;

     -- BIN_OP_EQ[uxn_c_l203_c21_6b3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l203_c21_6b3b_left <= VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_left;
     BIN_OP_EQ_uxn_c_l203_c21_6b3b_right <= VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output := BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output;

     -- BIN_OP_PLUS[uxn_c_l206_c34_8c63] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l206_c34_8c63_left <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_left;
     BIN_OP_PLUS_uxn_c_l206_c34_8c63_right <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output := BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output;

     -- BIN_OP_EQ[uxn_c_l204_c22_c41a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l204_c22_c41a_left <= VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_left;
     BIN_OP_EQ_uxn_c_l204_c22_c41a_right <= VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output := BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_left := VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_return_output;
     VAR_MUX_uxn_c_l221_c3_d947_cond := VAR_BIN_OP_AND_uxn_c_l209_c27_acfd_return_output;
     VAR_MUX_uxn_c_l203_c21_797f_cond := VAR_BIN_OP_EQ_uxn_c_l203_c21_6b3b_return_output;
     VAR_MUX_uxn_c_l204_c22_84ce_cond := VAR_BIN_OP_EQ_uxn_c_l204_c22_c41a_return_output;
     VAR_MUX_uxn_c_l205_c6_76c2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l205_c25_071a_return_output, 16);
     VAR_MUX_uxn_c_l206_c6_4a74_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l206_c34_8c63_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left := VAR_CONST_SL_8_uxn_c_l201_c56_7606_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_right := VAR_UNARY_OP_NOT_uxn_c_l208_c46_576c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_2c69_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output;

     -- MUX[uxn_c_l204_c22_84ce] LATENCY=0
     -- Inputs
     MUX_uxn_c_l204_c22_84ce_cond <= VAR_MUX_uxn_c_l204_c22_84ce_cond;
     MUX_uxn_c_l204_c22_84ce_iftrue <= VAR_MUX_uxn_c_l204_c22_84ce_iftrue;
     MUX_uxn_c_l204_c22_84ce_iffalse <= VAR_MUX_uxn_c_l204_c22_84ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l204_c22_84ce_return_output := MUX_uxn_c_l204_c22_84ce_return_output;

     -- BIN_OP_AND[uxn_c_l208_c27_8f9c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l208_c27_8f9c_left <= VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_left;
     BIN_OP_AND_uxn_c_l208_c27_8f9c_right <= VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output := BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output;

     -- MUX[uxn_c_l221_c3_d947] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c3_d947_cond <= VAR_MUX_uxn_c_l221_c3_d947_cond;
     MUX_uxn_c_l221_c3_d947_iftrue <= VAR_MUX_uxn_c_l221_c3_d947_iftrue;
     MUX_uxn_c_l221_c3_d947_iffalse <= VAR_MUX_uxn_c_l221_c3_d947_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c3_d947_return_output := MUX_uxn_c_l221_c3_d947_return_output;

     -- MUX[uxn_c_l203_c21_797f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l203_c21_797f_cond <= VAR_MUX_uxn_c_l203_c21_797f_cond;
     MUX_uxn_c_l203_c21_797f_iftrue <= VAR_MUX_uxn_c_l203_c21_797f_iftrue;
     MUX_uxn_c_l203_c21_797f_iffalse <= VAR_MUX_uxn_c_l203_c21_797f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l203_c21_797f_return_output := MUX_uxn_c_l203_c21_797f_return_output;

     -- BIN_OP_PLUS[uxn_c_l201_c56_e0ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_left;
     BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output := BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_left := VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output;
     VAR_MUX_uxn_c_l214_c3_f09d_cond := VAR_BIN_OP_AND_uxn_c_l208_c27_8f9c_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_86b0_return_output;
     VAR_MUX_uxn_c_l201_c37_d40e_iftrue := VAR_BIN_OP_PLUS_uxn_c_l201_c56_e0ae_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_left := VAR_MUX_uxn_c_l203_c21_797f_return_output;
     VAR_MUX_uxn_c_l205_c6_76c2_cond := VAR_MUX_uxn_c_l203_c21_797f_return_output;
     VAR_MUX_uxn_c_l206_c6_4a74_cond := VAR_MUX_uxn_c_l203_c21_797f_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l203_c21_797f_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_right := VAR_MUX_uxn_c_l204_c22_84ce_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l204_c22_84ce_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_value := VAR_MUX_uxn_c_l221_c3_d947_return_output;
     -- MUX[uxn_c_l205_c6_76c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l205_c6_76c2_cond <= VAR_MUX_uxn_c_l205_c6_76c2_cond;
     MUX_uxn_c_l205_c6_76c2_iftrue <= VAR_MUX_uxn_c_l205_c6_76c2_iftrue;
     MUX_uxn_c_l205_c6_76c2_iffalse <= VAR_MUX_uxn_c_l205_c6_76c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l205_c6_76c2_return_output := MUX_uxn_c_l205_c6_76c2_return_output;

     -- MUX[uxn_c_l214_c3_f09d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l214_c3_f09d_cond <= VAR_MUX_uxn_c_l214_c3_f09d_cond;
     MUX_uxn_c_l214_c3_f09d_iftrue <= VAR_MUX_uxn_c_l214_c3_f09d_iftrue;
     MUX_uxn_c_l214_c3_f09d_iffalse <= VAR_MUX_uxn_c_l214_c3_f09d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l214_c3_f09d_return_output := MUX_uxn_c_l214_c3_f09d_return_output;

     -- MUX[uxn_c_l206_c6_4a74] LATENCY=0
     -- Inputs
     MUX_uxn_c_l206_c6_4a74_cond <= VAR_MUX_uxn_c_l206_c6_4a74_cond;
     MUX_uxn_c_l206_c6_4a74_iftrue <= VAR_MUX_uxn_c_l206_c6_4a74_iftrue;
     MUX_uxn_c_l206_c6_4a74_iffalse <= VAR_MUX_uxn_c_l206_c6_4a74_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l206_c6_4a74_return_output := MUX_uxn_c_l206_c6_4a74_return_output;

     -- BIN_OP_AND[uxn_c_l215_c22_acb8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c22_acb8_left <= VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_left;
     BIN_OP_AND_uxn_c_l215_c22_acb8_right <= VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_return_output := BIN_OP_AND_uxn_c_l215_c22_acb8_return_output;

     -- MUX[uxn_c_l201_c37_d40e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c37_d40e_cond <= VAR_MUX_uxn_c_l201_c37_d40e_cond;
     MUX_uxn_c_l201_c37_d40e_iftrue <= VAR_MUX_uxn_c_l201_c37_d40e_iftrue;
     MUX_uxn_c_l201_c37_d40e_iffalse <= VAR_MUX_uxn_c_l201_c37_d40e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c37_d40e_return_output := MUX_uxn_c_l201_c37_d40e_return_output;

     -- BIN_OP_AND[uxn_c_l222_c22_5a31] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c22_5a31_left <= VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_left;
     BIN_OP_AND_uxn_c_l222_c22_5a31_right <= VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_return_output := BIN_OP_AND_uxn_c_l222_c22_5a31_return_output;

     -- BIN_OP_AND[uxn_c_l232_c38_33c1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c38_33c1_left <= VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_left;
     BIN_OP_AND_uxn_c_l232_c38_33c1_right <= VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_return_output := BIN_OP_AND_uxn_c_l232_c38_33c1_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_right := VAR_BIN_OP_AND_uxn_c_l215_c22_acb8_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_right := VAR_BIN_OP_AND_uxn_c_l222_c22_5a31_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr := VAR_BIN_OP_AND_uxn_c_l232_c38_33c1_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_5809_left := VAR_MUX_uxn_c_l201_c37_d40e_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l205_c6_76c2_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l206_c6_4a74_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_value := VAR_MUX_uxn_c_l214_c3_f09d_return_output;
     -- BIN_OP_OR[uxn_c_l222_c3_30d6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c3_30d6_left <= VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_left;
     BIN_OP_OR_uxn_c_l222_c3_30d6_right <= VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_return_output := BIN_OP_OR_uxn_c_l222_c3_30d6_return_output;

     -- BIN_OP_OR[uxn_c_l215_c3_09e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l215_c3_09e5_left <= VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_left;
     BIN_OP_OR_uxn_c_l215_c3_09e5_right <= VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_return_output := BIN_OP_OR_uxn_c_l215_c3_09e5_return_output;

     -- BIN_OP_OR[uxn_c_l201_c37_5809] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l201_c37_5809_left <= VAR_BIN_OP_OR_uxn_c_l201_c37_5809_left;
     BIN_OP_OR_uxn_c_l201_c37_5809_right <= VAR_BIN_OP_OR_uxn_c_l201_c37_5809_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l201_c37_5809_return_output := BIN_OP_OR_uxn_c_l201_c37_5809_return_output;

     -- UNARY_OP_NOT[uxn_c_l232_c38_34fd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr <= VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output := UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_5809_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_5809_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_enable := VAR_BIN_OP_OR_uxn_c_l215_c3_09e5_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_enable := VAR_BIN_OP_OR_uxn_c_l222_c3_30d6_return_output;
     VAR_MUX_uxn_c_l232_c19_49c2_iftrue := VAR_UNARY_OP_NOT_uxn_c_l232_c38_34fd_return_output;
     -- bg_vram_update[uxn_c_l211_c27_2f63] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l211_c27_2f63_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l211_c27_2f63_read_address <= VAR_bg_vram_update_uxn_c_l211_c27_2f63_read_address;
     bg_vram_update_uxn_c_l211_c27_2f63_write_address <= VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_address;
     bg_vram_update_uxn_c_l211_c27_2f63_write_value <= VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_value;
     bg_vram_update_uxn_c_l211_c27_2f63_write_enable <= VAR_bg_vram_update_uxn_c_l211_c27_2f63_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l211_c27_2f63_return_output := bg_vram_update_uxn_c_l211_c27_2f63_return_output;

     -- MUX[uxn_c_l232_c19_49c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l232_c19_49c2_cond <= VAR_MUX_uxn_c_l232_c19_49c2_cond;
     MUX_uxn_c_l232_c19_49c2_iftrue <= VAR_MUX_uxn_c_l232_c19_49c2_iftrue;
     MUX_uxn_c_l232_c19_49c2_iffalse <= VAR_MUX_uxn_c_l232_c19_49c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l232_c19_49c2_return_output := MUX_uxn_c_l232_c19_49c2_return_output;

     -- fg_vram_update[uxn_c_l218_c27_62f4] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l218_c27_62f4_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l218_c27_62f4_read_address <= VAR_fg_vram_update_uxn_c_l218_c27_62f4_read_address;
     fg_vram_update_uxn_c_l218_c27_62f4_write_address <= VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_address;
     fg_vram_update_uxn_c_l218_c27_62f4_write_value <= VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_value;
     fg_vram_update_uxn_c_l218_c27_62f4_write_enable <= VAR_fg_vram_update_uxn_c_l218_c27_62f4_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l218_c27_62f4_return_output := fg_vram_update_uxn_c_l218_c27_62f4_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l232_c19_49c2_return_output;
     VAR_MUX_uxn_c_l236_c17_f6c3_iftrue := VAR_bg_vram_update_uxn_c_l211_c27_2f63_return_output;
     VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_left := VAR_fg_vram_update_uxn_c_l218_c27_62f4_return_output;
     VAR_MUX_uxn_c_l236_c17_f6c3_iffalse := VAR_fg_vram_update_uxn_c_l218_c27_62f4_return_output;
     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_e4e2] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_e4e2_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_45f3_return_output,
     VAR_MUX_uxn_c_l232_c19_49c2_return_output);

     -- BIN_OP_EQ[uxn_c_l236_c17_741a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c17_741a_left <= VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_left;
     BIN_OP_EQ_uxn_c_l236_c17_741a_right <= VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_return_output := BIN_OP_EQ_uxn_c_l236_c17_741a_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l236_c17_f6c3_cond := VAR_BIN_OP_EQ_uxn_c_l236_c17_741a_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_e4e2_return_output;
     -- MUX[uxn_c_l236_c17_f6c3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l236_c17_f6c3_cond <= VAR_MUX_uxn_c_l236_c17_f6c3_cond;
     MUX_uxn_c_l236_c17_f6c3_iftrue <= VAR_MUX_uxn_c_l236_c17_f6c3_iftrue;
     MUX_uxn_c_l236_c17_f6c3_iffalse <= VAR_MUX_uxn_c_l236_c17_f6c3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l236_c17_f6c3_return_output := MUX_uxn_c_l236_c17_f6c3_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_4a0b LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_4a0b_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l235_c25_c6b8_return_output,
     VAR_MUX_uxn_c_l236_c17_f6c3_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_4a0b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_4a0b_return_output;
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
