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
-- Submodules: 98
entity step_gpu_0CLK_22353258 is
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
end step_gpu_0CLK_22353258;
architecture arch of step_gpu_0CLK_22353258 is
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
signal queue_read_ptr : unsigned(13 downto 0) := to_unsigned(0, 14);
signal queue_write_ptr : unsigned(13 downto 0) := to_unsigned(0, 14);
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
signal bg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal fg_pixel_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_buffer_swapped : unsigned(0 downto 0) := to_unsigned(0, 1);
signal adjusted_read_address : unsigned(16 downto 0) := to_unsigned(0, 17);
signal adjusted_write_address : unsigned(16 downto 0) := to_unsigned(0, 17);
signal fill_x0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal fill_y0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal fill_x1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal fill_y1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal x : unsigned(7 downto 0) := to_unsigned(0, 8);
signal y : unsigned(7 downto 0) := to_unsigned(0, 8);
signal fill_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_new_fill_row : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_last_fill_col : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_active : unsigned(0 downto 0) := to_unsigned(0, 1);
signal fill_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_top : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_left : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(16 downto 0) := to_unsigned(0, 17);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_caught_up : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_read_ready : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_queue_read_ptr : unsigned(13 downto 0);
signal REG_COMB_queue_write_ptr : unsigned(13 downto 0);
signal REG_COMB_current_queue_item : draw_command_t;
signal REG_COMB_queue_write_value : unsigned(23 downto 0);
signal REG_COMB_queue_read_value : unsigned(23 downto 0);
signal REG_COMB_queue_write_enable : unsigned(0 downto 0);
signal REG_COMB_queue_phase : unsigned(1 downto 0);
signal REG_COMB_bg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_fg_pixel_color : unsigned(1 downto 0);
signal REG_COMB_is_buffer_swapped : unsigned(0 downto 0);
signal REG_COMB_adjusted_read_address : unsigned(16 downto 0);
signal REG_COMB_adjusted_write_address : unsigned(16 downto 0);
signal REG_COMB_fill_x0 : unsigned(7 downto 0);
signal REG_COMB_fill_y0 : unsigned(7 downto 0);
signal REG_COMB_fill_x1 : unsigned(7 downto 0);
signal REG_COMB_fill_y1 : unsigned(7 downto 0);
signal REG_COMB_x : unsigned(7 downto 0);
signal REG_COMB_y : unsigned(7 downto 0);
signal REG_COMB_fill_color : unsigned(1 downto 0);
signal REG_COMB_is_new_fill_row : unsigned(0 downto 0);
signal REG_COMB_is_last_fill_col : unsigned(0 downto 0);
signal REG_COMB_is_fill_active : unsigned(0 downto 0);
signal REG_COMB_fill_layer : unsigned(0 downto 0);
signal REG_COMB_is_fill_top : unsigned(0 downto 0);
signal REG_COMB_is_fill_left : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel0 : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel1 : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(16 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_is_caught_up : unsigned(0 downto 0);
signal REG_COMB_is_read_ready : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_XOR[uxn_c_l156_c2_04b3]
signal BIN_OP_XOR_uxn_c_l156_c2_04b3_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l156_c2_04b3_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l157_c17_374c]
signal BIN_OP_EQ_uxn_c_l157_c17_374c_left : unsigned(13 downto 0);
signal BIN_OP_EQ_uxn_c_l157_c17_374c_right : unsigned(13 downto 0);
signal BIN_OP_EQ_uxn_c_l157_c17_374c_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l157_c17_9977]
signal MUX_uxn_c_l157_c17_9977_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c17_9977_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c17_9977_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l157_c17_9977_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c18_1dca]
signal BIN_OP_EQ_uxn_c_l158_c18_1dca_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c18_1dca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c18_5523]
signal MUX_uxn_c_l158_c18_5523_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c18_5523_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c18_5523_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c18_5523_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l160_c7_1038]
signal UNARY_OP_NOT_uxn_c_l160_c7_1038_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l160_c38_2e68]
signal UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l160_c7_f9e0]
signal BIN_OP_AND_uxn_c_l160_c7_f9e0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c7_f9e0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l160_c7_7ed5]
signal BIN_OP_AND_uxn_c_l160_c7_7ed5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c7_7ed5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output : unsigned(0 downto 0);

-- queue_read_ptr_MUX[uxn_c_l160_c2_e794]
signal queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue : unsigned(13 downto 0);
signal queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse : unsigned(13 downto 0);
signal queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output : unsigned(13 downto 0);

-- current_queue_item_MUX[uxn_c_l160_c2_e794]
signal current_queue_item_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l160_c2_e794_return_output : draw_command_t;

-- queue_phase_MUX[uxn_c_l160_c2_e794]
signal queue_phase_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_e794_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_e794_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_e794_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l169_c3_577e]
signal BIN_OP_PLUS_uxn_c_l169_c3_577e_left : unsigned(13 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c3_577e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output : unsigned(14 downto 0);

-- queue_write_ptr_MUX[uxn_c_l172_c2_b84e]
signal queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(13 downto 0);
signal queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(13 downto 0);
signal queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(13 downto 0);

-- queue_phase_MUX[uxn_c_l172_c2_b84e]
signal queue_phase_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(1 downto 0);

-- queue_write_value_MUX[uxn_c_l172_c2_b84e]
signal queue_write_value_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l177_c3_910a]
signal BIN_OP_PLUS_uxn_c_l177_c3_910a_left : unsigned(13 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c3_910a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output : unsigned(14 downto 0);

-- BIN_OP_EQ[uxn_c_l181_c16_2fc9]
signal BIN_OP_EQ_uxn_c_l181_c16_2fc9_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l181_c16_2fc9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l181_c39_d5cb]
signal BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l181_c16_6a4e]
signal MUX_uxn_c_l181_c16_6a4e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l181_c16_6a4e_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l181_c16_6a4e_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l181_c16_6a4e_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_55d7]
signal BIN_OP_AND_uxn_c_l184_c6_55d7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_55d7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_55d7_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l184_c66_e3fa]
signal UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_0824]
signal BIN_OP_AND_uxn_c_l184_c6_0824_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_0824_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_0824_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l184_c2_fe8c]
signal y_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_c_l184_c2_fe8c]
signal x_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- fill_x1_MUX[uxn_c_l184_c2_fe8c]
signal fill_x1_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- fill_layer_MUX[uxn_c_l184_c2_fe8c]
signal fill_layer_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l184_c2_fe8c]
signal is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l184_c2_fe8c]
signal fill_x0_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- is_fill_left_MUX[uxn_c_l184_c2_fe8c]
signal is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l184_c2_fe8c]
signal fill_color_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(1 downto 0);

-- fill_y0_MUX[uxn_c_l184_c2_fe8c]
signal fill_y0_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- is_fill_active_MUX[uxn_c_l184_c2_fe8c]
signal is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l184_c2_fe8c]
signal fill_y1_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l187_c13_b8f7]
signal MUX_uxn_c_l187_c13_b8f7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l187_c13_b8f7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l187_c13_b8f7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l187_c13_b8f7_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l188_c13_55de]
signal MUX_uxn_c_l188_c13_55de_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_55de_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_55de_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_55de_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l189_c13_78a3]
signal MUX_uxn_c_l189_c13_78a3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_78a3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_78a3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_78a3_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l190_c13_d40c]
signal MUX_uxn_c_l190_c13_d40c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_d40c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_d40c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_d40c_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l198_c44_562e]
signal UNARY_OP_NOT_uxn_c_l198_c44_562e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l198_c13_8a58]
signal BIN_OP_AND_uxn_c_l198_c13_8a58_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l198_c13_8a58_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l198_c13_8a58_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l198_c9_8ee5]
signal y_MUX_uxn_c_l198_c9_8ee5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l198_c9_8ee5_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l198_c9_8ee5_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l198_c9_8ee5_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_c_l198_c9_8ee5]
signal x_MUX_uxn_c_l198_c9_8ee5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l198_c9_8ee5_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l198_c9_8ee5_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l198_c9_8ee5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l203_c57_070f]
signal BIN_OP_AND_uxn_c_l203_c57_070f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l203_c57_070f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l203_c57_070f_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l206_c68_f35b]
signal UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l206_c68_475b]
signal BIN_OP_AND_uxn_c_l206_c68_475b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l206_c68_475b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l206_c68_475b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l208_c21_dec3]
signal BIN_OP_EQ_uxn_c_l208_c21_dec3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l208_c21_dec3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l208_c21_b76d]
signal MUX_uxn_c_l208_c21_b76d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c21_b76d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c21_b76d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c21_b76d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l209_c22_1dda]
signal BIN_OP_EQ_uxn_c_l209_c22_1dda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c22_1dda_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l209_c22_860b]
signal MUX_uxn_c_l209_c22_860b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c22_860b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c22_860b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c22_860b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l210_c25_11e5]
signal BIN_OP_PLUS_uxn_c_l210_c25_11e5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l210_c25_11e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l210_c6_9ec2]
signal MUX_uxn_c_l210_c6_9ec2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c6_9ec2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l210_c6_9ec2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l210_c6_9ec2_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l211_c34_562d]
signal BIN_OP_PLUS_uxn_c_l211_c34_562d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c34_562d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l211_c6_67b2]
signal MUX_uxn_c_l211_c6_67b2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l211_c6_67b2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_67b2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_67b2_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l213_c38_78cb]
signal UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l213_c19_dedd]
signal BIN_OP_AND_uxn_c_l213_c19_dedd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l213_c19_dedd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l213_c19_dedd_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l214_c19_8ac5]
signal BIN_OP_AND_uxn_c_l214_c19_8ac5_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_8ac5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l219_c3_4bf7]
signal MUX_uxn_c_l219_c3_4bf7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c3_4bf7_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l219_c3_4bf7_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l219_c3_4bf7_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l220_c71_e3ad]
signal UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l220_c22_f2b2]
signal BIN_OP_AND_uxn_c_l220_c22_f2b2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l220_c22_f2b2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l220_c3_8412]
signal BIN_OP_OR_uxn_c_l220_c3_8412_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l220_c3_8412_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l220_c3_8412_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l216_c19_1525]
signal bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l216_c19_1525_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l216_c19_1525_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l216_c19_1525_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l216_c19_1525_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l216_c19_1525_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l226_c3_3696]
signal MUX_uxn_c_l226_c3_3696_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l226_c3_3696_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l226_c3_3696_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l226_c3_3696_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l227_c22_0cfc]
signal BIN_OP_AND_uxn_c_l227_c22_0cfc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l227_c22_0cfc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l227_c3_de78]
signal BIN_OP_OR_uxn_c_l227_c3_de78_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l227_c3_de78_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l227_c3_de78_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l223_c19_2cd6]
signal fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l223_c19_2cd6_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l223_c19_2cd6_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l223_c19_2cd6_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l223_c19_2cd6_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l223_c19_2cd6_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l230_c21_e7ca]
signal draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l230_c21_e7ca_read_address : unsigned(13 downto 0);
signal draw_queue_update_uxn_c_l230_c21_e7ca_write_address : unsigned(13 downto 0);
signal draw_queue_update_uxn_c_l230_c21_e7ca_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l230_c21_e7ca_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l230_c21_e7ca_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l237_c38_3a6e]
signal BIN_OP_AND_uxn_c_l237_c38_3a6e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l237_c38_3a6e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l237_c38_b6a0]
signal UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l237_c19_8557]
signal MUX_uxn_c_l237_c19_8557_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l237_c19_8557_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l237_c19_8557_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l237_c19_8557_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l239_c19_0f05]
signal BIN_OP_EQ_uxn_c_l239_c19_0f05_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l239_c19_0f05_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l239_c76_22f3]
signal BIN_OP_PLUS_uxn_c_l239_c76_22f3_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_c_l239_c76_22f3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l239_c50_673d]
signal MUX_uxn_c_l239_c50_673d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l239_c50_673d_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l239_c50_673d_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l239_c50_673d_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l239_c19_03d9]
signal MUX_uxn_c_l239_c19_03d9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l239_c19_03d9_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l239_c19_03d9_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l239_c19_03d9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c25_4f03]
signal BIN_OP_EQ_uxn_c_l240_c25_4f03_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c25_4f03_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l240_c25_d908]
signal MUX_uxn_c_l240_c25_d908_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c25_d908_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c25_d908_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c25_d908_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l241_c17_0cd6]
signal BIN_OP_EQ_uxn_c_l241_c17_0cd6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c17_0cd6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l241_c17_37f4]
signal MUX_uxn_c_l241_c17_37f4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c17_37f4_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l241_c17_37f4_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l241_c17_37f4_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727
signal UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output : unsigned(0 downto 0);

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

function uint24_uint16_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(15 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(15 downto 0) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint8_4_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(4 downto 0);
begin
return_output := unsigned(std_logic_vector(x(4 downto 0)));
return return_output;
end function;

function uint24_uint5_16( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(4 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(20 downto 16) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint24_uint1_21( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(23 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(23 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

    intermediate := (others => '0');
    intermediate(23 downto 0) := unsigned(inp);
    intermediate(21 downto 21) := x;
    
    return_output := intermediate(23 downto 0) ;
    
    return return_output;

end function;

function uint17_uint1_16( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(16 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(16 downto 0);
  variable return_output : unsigned(16 downto 0);

begin

    intermediate := (others => '0');
    intermediate(16 downto 0) := unsigned(inp);
    intermediate(16 downto 16) := x;
    
    return_output := intermediate(16 downto 0) ;
    
    return return_output;

end function;

function uint17_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(16 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(16 downto 0);
  variable return_output : unsigned(16 downto 0);

begin

    intermediate := (others => '0');
    intermediate(16 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(16 downto 0) ;
    
    return return_output;

end function;

function uint17_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(16 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(16 downto 0);
  variable return_output : unsigned(16 downto 0);

begin

    intermediate := (others => '0');
    intermediate(16 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(16 downto 0) ;
    
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

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function uint16_7_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
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
-- BIN_OP_XOR_uxn_c_l156_c2_04b3
BIN_OP_XOR_uxn_c_l156_c2_04b3 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l156_c2_04b3_left,
BIN_OP_XOR_uxn_c_l156_c2_04b3_right,
BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output);

-- BIN_OP_EQ_uxn_c_l157_c17_374c
BIN_OP_EQ_uxn_c_l157_c17_374c : entity work.BIN_OP_EQ_uint14_t_uint14_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l157_c17_374c_left,
BIN_OP_EQ_uxn_c_l157_c17_374c_right,
BIN_OP_EQ_uxn_c_l157_c17_374c_return_output);

-- MUX_uxn_c_l157_c17_9977
MUX_uxn_c_l157_c17_9977 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l157_c17_9977_cond,
MUX_uxn_c_l157_c17_9977_iftrue,
MUX_uxn_c_l157_c17_9977_iffalse,
MUX_uxn_c_l157_c17_9977_return_output);

-- BIN_OP_EQ_uxn_c_l158_c18_1dca
BIN_OP_EQ_uxn_c_l158_c18_1dca : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c18_1dca_left,
BIN_OP_EQ_uxn_c_l158_c18_1dca_right,
BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output);

-- MUX_uxn_c_l158_c18_5523
MUX_uxn_c_l158_c18_5523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c18_5523_cond,
MUX_uxn_c_l158_c18_5523_iftrue,
MUX_uxn_c_l158_c18_5523_iffalse,
MUX_uxn_c_l158_c18_5523_return_output);

-- UNARY_OP_NOT_uxn_c_l160_c7_1038
UNARY_OP_NOT_uxn_c_l160_c7_1038 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l160_c7_1038_expr,
UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output);

-- UNARY_OP_NOT_uxn_c_l160_c38_2e68
UNARY_OP_NOT_uxn_c_l160_c38_2e68 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr,
UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output);

-- BIN_OP_AND_uxn_c_l160_c7_f9e0
BIN_OP_AND_uxn_c_l160_c7_f9e0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c7_f9e0_left,
BIN_OP_AND_uxn_c_l160_c7_f9e0_right,
BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output);

-- BIN_OP_AND_uxn_c_l160_c7_7ed5
BIN_OP_AND_uxn_c_l160_c7_7ed5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c7_7ed5_left,
BIN_OP_AND_uxn_c_l160_c7_7ed5_right,
BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output);

-- queue_read_ptr_MUX_uxn_c_l160_c2_e794
queue_read_ptr_MUX_uxn_c_l160_c2_e794 : entity work.MUX_uint1_t_uint14_t_uint14_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond,
queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue,
queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse,
queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output);

-- current_queue_item_MUX_uxn_c_l160_c2_e794
current_queue_item_MUX_uxn_c_l160_c2_e794 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l160_c2_e794_cond,
current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue,
current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse,
current_queue_item_MUX_uxn_c_l160_c2_e794_return_output);

-- queue_phase_MUX_uxn_c_l160_c2_e794
queue_phase_MUX_uxn_c_l160_c2_e794 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l160_c2_e794_cond,
queue_phase_MUX_uxn_c_l160_c2_e794_iftrue,
queue_phase_MUX_uxn_c_l160_c2_e794_iffalse,
queue_phase_MUX_uxn_c_l160_c2_e794_return_output);

-- BIN_OP_PLUS_uxn_c_l169_c3_577e
BIN_OP_PLUS_uxn_c_l169_c3_577e : entity work.BIN_OP_PLUS_uint14_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l169_c3_577e_left,
BIN_OP_PLUS_uxn_c_l169_c3_577e_right,
BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output);

-- queue_write_ptr_MUX_uxn_c_l172_c2_b84e
queue_write_ptr_MUX_uxn_c_l172_c2_b84e : entity work.MUX_uint1_t_uint14_t_uint14_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond,
queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue,
queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse,
queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output);

-- queue_phase_MUX_uxn_c_l172_c2_b84e
queue_phase_MUX_uxn_c_l172_c2_b84e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l172_c2_b84e_cond,
queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue,
queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse,
queue_phase_MUX_uxn_c_l172_c2_b84e_return_output);

-- queue_write_value_MUX_uxn_c_l172_c2_b84e
queue_write_value_MUX_uxn_c_l172_c2_b84e : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l172_c2_b84e_cond,
queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue,
queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse,
queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output);

-- BIN_OP_PLUS_uxn_c_l177_c3_910a
BIN_OP_PLUS_uxn_c_l177_c3_910a : entity work.BIN_OP_PLUS_uint14_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l177_c3_910a_left,
BIN_OP_PLUS_uxn_c_l177_c3_910a_right,
BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output);

-- BIN_OP_EQ_uxn_c_l181_c16_2fc9
BIN_OP_EQ_uxn_c_l181_c16_2fc9 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l181_c16_2fc9_left,
BIN_OP_EQ_uxn_c_l181_c16_2fc9_right,
BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output);

-- BIN_OP_PLUS_uxn_c_l181_c39_d5cb
BIN_OP_PLUS_uxn_c_l181_c39_d5cb : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left,
BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right,
BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output);

-- MUX_uxn_c_l181_c16_6a4e
MUX_uxn_c_l181_c16_6a4e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l181_c16_6a4e_cond,
MUX_uxn_c_l181_c16_6a4e_iftrue,
MUX_uxn_c_l181_c16_6a4e_iffalse,
MUX_uxn_c_l181_c16_6a4e_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_55d7
BIN_OP_AND_uxn_c_l184_c6_55d7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_55d7_left,
BIN_OP_AND_uxn_c_l184_c6_55d7_right,
BIN_OP_AND_uxn_c_l184_c6_55d7_return_output);

-- UNARY_OP_NOT_uxn_c_l184_c66_e3fa
UNARY_OP_NOT_uxn_c_l184_c66_e3fa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr,
UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_0824
BIN_OP_AND_uxn_c_l184_c6_0824 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_0824_left,
BIN_OP_AND_uxn_c_l184_c6_0824_right,
BIN_OP_AND_uxn_c_l184_c6_0824_return_output);

-- y_MUX_uxn_c_l184_c2_fe8c
y_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l184_c2_fe8c_cond,
y_MUX_uxn_c_l184_c2_fe8c_iftrue,
y_MUX_uxn_c_l184_c2_fe8c_iffalse,
y_MUX_uxn_c_l184_c2_fe8c_return_output);

-- x_MUX_uxn_c_l184_c2_fe8c
x_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l184_c2_fe8c_cond,
x_MUX_uxn_c_l184_c2_fe8c_iftrue,
x_MUX_uxn_c_l184_c2_fe8c_iffalse,
x_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_x1_MUX_uxn_c_l184_c2_fe8c
fill_x1_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l184_c2_fe8c_cond,
fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_layer_MUX_uxn_c_l184_c2_fe8c
fill_layer_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l184_c2_fe8c_cond,
fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output);

-- is_fill_top_MUX_uxn_c_l184_c2_fe8c
is_fill_top_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond,
is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue,
is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse,
is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_x0_MUX_uxn_c_l184_c2_fe8c
fill_x0_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l184_c2_fe8c_cond,
fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output);

-- is_fill_left_MUX_uxn_c_l184_c2_fe8c
is_fill_left_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond,
is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue,
is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse,
is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_color_MUX_uxn_c_l184_c2_fe8c
fill_color_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l184_c2_fe8c_cond,
fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_color_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_y0_MUX_uxn_c_l184_c2_fe8c
fill_y0_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l184_c2_fe8c_cond,
fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output);

-- is_fill_active_MUX_uxn_c_l184_c2_fe8c
is_fill_active_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond,
is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue,
is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse,
is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output);

-- fill_y1_MUX_uxn_c_l184_c2_fe8c
fill_y1_MUX_uxn_c_l184_c2_fe8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l184_c2_fe8c_cond,
fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue,
fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse,
fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output);

-- MUX_uxn_c_l187_c13_b8f7
MUX_uxn_c_l187_c13_b8f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l187_c13_b8f7_cond,
MUX_uxn_c_l187_c13_b8f7_iftrue,
MUX_uxn_c_l187_c13_b8f7_iffalse,
MUX_uxn_c_l187_c13_b8f7_return_output);

-- MUX_uxn_c_l188_c13_55de
MUX_uxn_c_l188_c13_55de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_55de_cond,
MUX_uxn_c_l188_c13_55de_iftrue,
MUX_uxn_c_l188_c13_55de_iffalse,
MUX_uxn_c_l188_c13_55de_return_output);

-- MUX_uxn_c_l189_c13_78a3
MUX_uxn_c_l189_c13_78a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_78a3_cond,
MUX_uxn_c_l189_c13_78a3_iftrue,
MUX_uxn_c_l189_c13_78a3_iffalse,
MUX_uxn_c_l189_c13_78a3_return_output);

-- MUX_uxn_c_l190_c13_d40c
MUX_uxn_c_l190_c13_d40c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_d40c_cond,
MUX_uxn_c_l190_c13_d40c_iftrue,
MUX_uxn_c_l190_c13_d40c_iffalse,
MUX_uxn_c_l190_c13_d40c_return_output);

-- UNARY_OP_NOT_uxn_c_l198_c44_562e
UNARY_OP_NOT_uxn_c_l198_c44_562e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l198_c44_562e_expr,
UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output);

-- BIN_OP_AND_uxn_c_l198_c13_8a58
BIN_OP_AND_uxn_c_l198_c13_8a58 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l198_c13_8a58_left,
BIN_OP_AND_uxn_c_l198_c13_8a58_right,
BIN_OP_AND_uxn_c_l198_c13_8a58_return_output);

-- y_MUX_uxn_c_l198_c9_8ee5
y_MUX_uxn_c_l198_c9_8ee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l198_c9_8ee5_cond,
y_MUX_uxn_c_l198_c9_8ee5_iftrue,
y_MUX_uxn_c_l198_c9_8ee5_iffalse,
y_MUX_uxn_c_l198_c9_8ee5_return_output);

-- x_MUX_uxn_c_l198_c9_8ee5
x_MUX_uxn_c_l198_c9_8ee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l198_c9_8ee5_cond,
x_MUX_uxn_c_l198_c9_8ee5_iftrue,
x_MUX_uxn_c_l198_c9_8ee5_iffalse,
x_MUX_uxn_c_l198_c9_8ee5_return_output);

-- BIN_OP_AND_uxn_c_l203_c57_070f
BIN_OP_AND_uxn_c_l203_c57_070f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l203_c57_070f_left,
BIN_OP_AND_uxn_c_l203_c57_070f_right,
BIN_OP_AND_uxn_c_l203_c57_070f_return_output);

-- UNARY_OP_NOT_uxn_c_l206_c68_f35b
UNARY_OP_NOT_uxn_c_l206_c68_f35b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr,
UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output);

-- BIN_OP_AND_uxn_c_l206_c68_475b
BIN_OP_AND_uxn_c_l206_c68_475b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l206_c68_475b_left,
BIN_OP_AND_uxn_c_l206_c68_475b_right,
BIN_OP_AND_uxn_c_l206_c68_475b_return_output);

-- BIN_OP_EQ_uxn_c_l208_c21_dec3
BIN_OP_EQ_uxn_c_l208_c21_dec3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l208_c21_dec3_left,
BIN_OP_EQ_uxn_c_l208_c21_dec3_right,
BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output);

-- MUX_uxn_c_l208_c21_b76d
MUX_uxn_c_l208_c21_b76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l208_c21_b76d_cond,
MUX_uxn_c_l208_c21_b76d_iftrue,
MUX_uxn_c_l208_c21_b76d_iffalse,
MUX_uxn_c_l208_c21_b76d_return_output);

-- BIN_OP_EQ_uxn_c_l209_c22_1dda
BIN_OP_EQ_uxn_c_l209_c22_1dda : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l209_c22_1dda_left,
BIN_OP_EQ_uxn_c_l209_c22_1dda_right,
BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output);

-- MUX_uxn_c_l209_c22_860b
MUX_uxn_c_l209_c22_860b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l209_c22_860b_cond,
MUX_uxn_c_l209_c22_860b_iftrue,
MUX_uxn_c_l209_c22_860b_iffalse,
MUX_uxn_c_l209_c22_860b_return_output);

-- BIN_OP_PLUS_uxn_c_l210_c25_11e5
BIN_OP_PLUS_uxn_c_l210_c25_11e5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l210_c25_11e5_left,
BIN_OP_PLUS_uxn_c_l210_c25_11e5_right,
BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output);

-- MUX_uxn_c_l210_c6_9ec2
MUX_uxn_c_l210_c6_9ec2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l210_c6_9ec2_cond,
MUX_uxn_c_l210_c6_9ec2_iftrue,
MUX_uxn_c_l210_c6_9ec2_iffalse,
MUX_uxn_c_l210_c6_9ec2_return_output);

-- BIN_OP_PLUS_uxn_c_l211_c34_562d
BIN_OP_PLUS_uxn_c_l211_c34_562d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l211_c34_562d_left,
BIN_OP_PLUS_uxn_c_l211_c34_562d_right,
BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output);

-- MUX_uxn_c_l211_c6_67b2
MUX_uxn_c_l211_c6_67b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l211_c6_67b2_cond,
MUX_uxn_c_l211_c6_67b2_iftrue,
MUX_uxn_c_l211_c6_67b2_iffalse,
MUX_uxn_c_l211_c6_67b2_return_output);

-- UNARY_OP_NOT_uxn_c_l213_c38_78cb
UNARY_OP_NOT_uxn_c_l213_c38_78cb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr,
UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output);

-- BIN_OP_AND_uxn_c_l213_c19_dedd
BIN_OP_AND_uxn_c_l213_c19_dedd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l213_c19_dedd_left,
BIN_OP_AND_uxn_c_l213_c19_dedd_right,
BIN_OP_AND_uxn_c_l213_c19_dedd_return_output);

-- BIN_OP_AND_uxn_c_l214_c19_8ac5
BIN_OP_AND_uxn_c_l214_c19_8ac5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l214_c19_8ac5_left,
BIN_OP_AND_uxn_c_l214_c19_8ac5_right,
BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output);

-- MUX_uxn_c_l219_c3_4bf7
MUX_uxn_c_l219_c3_4bf7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l219_c3_4bf7_cond,
MUX_uxn_c_l219_c3_4bf7_iftrue,
MUX_uxn_c_l219_c3_4bf7_iffalse,
MUX_uxn_c_l219_c3_4bf7_return_output);

-- UNARY_OP_NOT_uxn_c_l220_c71_e3ad
UNARY_OP_NOT_uxn_c_l220_c71_e3ad : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr,
UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output);

-- BIN_OP_AND_uxn_c_l220_c22_f2b2
BIN_OP_AND_uxn_c_l220_c22_f2b2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l220_c22_f2b2_left,
BIN_OP_AND_uxn_c_l220_c22_f2b2_right,
BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output);

-- BIN_OP_OR_uxn_c_l220_c3_8412
BIN_OP_OR_uxn_c_l220_c3_8412 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l220_c3_8412_left,
BIN_OP_OR_uxn_c_l220_c3_8412_right,
BIN_OP_OR_uxn_c_l220_c3_8412_return_output);

-- bg_vram_update_uxn_c_l216_c19_1525
bg_vram_update_uxn_c_l216_c19_1525 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE,
bg_vram_update_uxn_c_l216_c19_1525_read_address,
bg_vram_update_uxn_c_l216_c19_1525_write_address,
bg_vram_update_uxn_c_l216_c19_1525_write_value,
bg_vram_update_uxn_c_l216_c19_1525_write_enable,
bg_vram_update_uxn_c_l216_c19_1525_return_output);

-- MUX_uxn_c_l226_c3_3696
MUX_uxn_c_l226_c3_3696 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l226_c3_3696_cond,
MUX_uxn_c_l226_c3_3696_iftrue,
MUX_uxn_c_l226_c3_3696_iffalse,
MUX_uxn_c_l226_c3_3696_return_output);

-- BIN_OP_AND_uxn_c_l227_c22_0cfc
BIN_OP_AND_uxn_c_l227_c22_0cfc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l227_c22_0cfc_left,
BIN_OP_AND_uxn_c_l227_c22_0cfc_right,
BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output);

-- BIN_OP_OR_uxn_c_l227_c3_de78
BIN_OP_OR_uxn_c_l227_c3_de78 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l227_c3_de78_left,
BIN_OP_OR_uxn_c_l227_c3_de78_right,
BIN_OP_OR_uxn_c_l227_c3_de78_return_output);

-- fg_vram_update_uxn_c_l223_c19_2cd6
fg_vram_update_uxn_c_l223_c19_2cd6 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE,
fg_vram_update_uxn_c_l223_c19_2cd6_read_address,
fg_vram_update_uxn_c_l223_c19_2cd6_write_address,
fg_vram_update_uxn_c_l223_c19_2cd6_write_value,
fg_vram_update_uxn_c_l223_c19_2cd6_write_enable,
fg_vram_update_uxn_c_l223_c19_2cd6_return_output);

-- draw_queue_update_uxn_c_l230_c21_e7ca
draw_queue_update_uxn_c_l230_c21_e7ca : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE,
draw_queue_update_uxn_c_l230_c21_e7ca_read_address,
draw_queue_update_uxn_c_l230_c21_e7ca_write_address,
draw_queue_update_uxn_c_l230_c21_e7ca_write_value,
draw_queue_update_uxn_c_l230_c21_e7ca_write_enable,
draw_queue_update_uxn_c_l230_c21_e7ca_return_output);

-- BIN_OP_AND_uxn_c_l237_c38_3a6e
BIN_OP_AND_uxn_c_l237_c38_3a6e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l237_c38_3a6e_left,
BIN_OP_AND_uxn_c_l237_c38_3a6e_right,
BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output);

-- UNARY_OP_NOT_uxn_c_l237_c38_b6a0
UNARY_OP_NOT_uxn_c_l237_c38_b6a0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr,
UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output);

-- MUX_uxn_c_l237_c19_8557
MUX_uxn_c_l237_c19_8557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l237_c19_8557_cond,
MUX_uxn_c_l237_c19_8557_iftrue,
MUX_uxn_c_l237_c19_8557_iffalse,
MUX_uxn_c_l237_c19_8557_return_output);

-- BIN_OP_EQ_uxn_c_l239_c19_0f05
BIN_OP_EQ_uxn_c_l239_c19_0f05 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l239_c19_0f05_left,
BIN_OP_EQ_uxn_c_l239_c19_0f05_right,
BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output);

-- BIN_OP_PLUS_uxn_c_l239_c76_22f3
BIN_OP_PLUS_uxn_c_l239_c76_22f3 : entity work.BIN_OP_PLUS_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l239_c76_22f3_left,
BIN_OP_PLUS_uxn_c_l239_c76_22f3_right,
BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output);

-- MUX_uxn_c_l239_c50_673d
MUX_uxn_c_l239_c50_673d : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l239_c50_673d_cond,
MUX_uxn_c_l239_c50_673d_iftrue,
MUX_uxn_c_l239_c50_673d_iffalse,
MUX_uxn_c_l239_c50_673d_return_output);

-- MUX_uxn_c_l239_c19_03d9
MUX_uxn_c_l239_c19_03d9 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l239_c19_03d9_cond,
MUX_uxn_c_l239_c19_03d9_iftrue,
MUX_uxn_c_l239_c19_03d9_iffalse,
MUX_uxn_c_l239_c19_03d9_return_output);

-- BIN_OP_EQ_uxn_c_l240_c25_4f03
BIN_OP_EQ_uxn_c_l240_c25_4f03 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c25_4f03_left,
BIN_OP_EQ_uxn_c_l240_c25_4f03_right,
BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output);

-- MUX_uxn_c_l240_c25_d908
MUX_uxn_c_l240_c25_d908 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l240_c25_d908_cond,
MUX_uxn_c_l240_c25_d908_iftrue,
MUX_uxn_c_l240_c25_d908_iffalse,
MUX_uxn_c_l240_c25_d908_return_output);

-- BIN_OP_EQ_uxn_c_l241_c17_0cd6
BIN_OP_EQ_uxn_c_l241_c17_0cd6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l241_c17_0cd6_left,
BIN_OP_EQ_uxn_c_l241_c17_0cd6_right,
BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output);

-- MUX_uxn_c_l241_c17_37f4
MUX_uxn_c_l241_c17_37f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l241_c17_37f4_cond,
MUX_uxn_c_l241_c17_37f4_iftrue,
MUX_uxn_c_l241_c17_37f4_iffalse,
MUX_uxn_c_l241_c17_37f4_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727
UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output);



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
 bg_pixel_color,
 fg_pixel_color,
 is_buffer_swapped,
 adjusted_read_address,
 adjusted_write_address,
 fill_x0,
 fill_y0,
 fill_x1,
 fill_y1,
 x,
 y,
 fill_color,
 is_new_fill_row,
 is_last_fill_col,
 is_fill_active,
 fill_layer,
 is_fill_top,
 is_fill_left,
 is_fill_pixel0,
 is_fill_pixel1,
 pixel_counter,
 tmp16,
 is_caught_up,
 is_read_ready,
 -- All submodule outputs
 BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output,
 BIN_OP_EQ_uxn_c_l157_c17_374c_return_output,
 MUX_uxn_c_l157_c17_9977_return_output,
 BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output,
 MUX_uxn_c_l158_c18_5523_return_output,
 UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output,
 UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output,
 BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output,
 BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output,
 queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output,
 current_queue_item_MUX_uxn_c_l160_c2_e794_return_output,
 queue_phase_MUX_uxn_c_l160_c2_e794_return_output,
 BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output,
 queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output,
 queue_phase_MUX_uxn_c_l172_c2_b84e_return_output,
 queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output,
 BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output,
 BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output,
 BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output,
 MUX_uxn_c_l181_c16_6a4e_return_output,
 BIN_OP_AND_uxn_c_l184_c6_55d7_return_output,
 UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output,
 BIN_OP_AND_uxn_c_l184_c6_0824_return_output,
 y_MUX_uxn_c_l184_c2_fe8c_return_output,
 x_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output,
 is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output,
 is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_color_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output,
 is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output,
 fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output,
 MUX_uxn_c_l187_c13_b8f7_return_output,
 MUX_uxn_c_l188_c13_55de_return_output,
 MUX_uxn_c_l189_c13_78a3_return_output,
 MUX_uxn_c_l190_c13_d40c_return_output,
 UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output,
 BIN_OP_AND_uxn_c_l198_c13_8a58_return_output,
 y_MUX_uxn_c_l198_c9_8ee5_return_output,
 x_MUX_uxn_c_l198_c9_8ee5_return_output,
 BIN_OP_AND_uxn_c_l203_c57_070f_return_output,
 UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output,
 BIN_OP_AND_uxn_c_l206_c68_475b_return_output,
 BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output,
 MUX_uxn_c_l208_c21_b76d_return_output,
 BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output,
 MUX_uxn_c_l209_c22_860b_return_output,
 BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output,
 MUX_uxn_c_l210_c6_9ec2_return_output,
 BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output,
 MUX_uxn_c_l211_c6_67b2_return_output,
 UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output,
 BIN_OP_AND_uxn_c_l213_c19_dedd_return_output,
 BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output,
 MUX_uxn_c_l219_c3_4bf7_return_output,
 UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output,
 BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output,
 BIN_OP_OR_uxn_c_l220_c3_8412_return_output,
 bg_vram_update_uxn_c_l216_c19_1525_return_output,
 MUX_uxn_c_l226_c3_3696_return_output,
 BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output,
 BIN_OP_OR_uxn_c_l227_c3_de78_return_output,
 fg_vram_update_uxn_c_l223_c19_2cd6_return_output,
 draw_queue_update_uxn_c_l230_c21_e7ca_return_output,
 BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output,
 UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output,
 MUX_uxn_c_l237_c19_8557_return_output,
 BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output,
 BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output,
 MUX_uxn_c_l239_c50_673d_return_output,
 MUX_uxn_c_l239_c19_03d9_return_output,
 BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output,
 MUX_uxn_c_l240_c25_d908_return_output,
 BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output,
 MUX_uxn_c_l241_c17_37f4_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c17_9977_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_left : unsigned(13 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_right : unsigned(13 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c17_9977_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c17_9977_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l157_c17_9977_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c18_5523_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c18_5523_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c18_5523_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c18_5523_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l160_c7_7853_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue : unsigned(13 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l169_c3_a681 : unsigned(13 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse : unsigned(13 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output : unsigned(13 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l160_c2_e794_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l168_c3_9f83 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_e794_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_e794_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l161_c37_94c6_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l162_c30_ec62_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l163_c33_9e81_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l164_c34_093d_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l165_c32_7480_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l166_c30_4bad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_left : unsigned(13 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output : unsigned(14 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(13 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l177_c3_c2d1 : unsigned(13 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(13 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(13 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l176_c3_4fc3 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_cond : unsigned(0 downto 0);
 variable VAR_uint24_uint16_0_uxn_c_l173_c23_15bb_return_output : unsigned(23 downto 0);
 variable VAR_uint8_4_0_uxn_c_l174_c58_a998_return_output : unsigned(4 downto 0);
 variable VAR_uint24_uint5_16_uxn_c_l174_c23_c1fe_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_21_uxn_c_l175_c23_498c_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_left : unsigned(13 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output : unsigned(14 downto 0);
 variable VAR_MUX_uxn_c_l181_c16_6a4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l181_c16_6a4e_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l181_c16_6a4e_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l181_c16_6a4e_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l182_c10_b615_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_0824_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_0824_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l198_c9_8ee5_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l198_c9_8ee5_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l185_c17_89e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l186_c18_751e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l187_c13_b8f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l187_c13_b8f7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l187_c13_b8f7_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l187_c13_b8f7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_55de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_55de_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_55de_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_55de_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_78a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_78a3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_78a3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_78a3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_d40c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_d40c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_d40c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_d40c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l198_c9_8ee5_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l198_c9_8ee5_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l198_c9_8ee5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l198_c9_8ee5_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l198_c9_8ee5_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l198_c9_8ee5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c57_070f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c57_070f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l203_c57_070f_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l203_c26_d940_return_output : unsigned(16 downto 0);
 variable VAR_uint17_uint8_8_uxn_c_l204_c27_06b2_return_output : unsigned(16 downto 0);
 variable VAR_uint17_uint8_0_uxn_c_l205_c27_b56e_return_output : unsigned(16 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l206_c68_475b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l206_c68_475b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l206_c68_475b_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l206_c27_fb9c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l208_c21_b76d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c21_b76d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c21_b76d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c21_b76d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c22_860b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c22_860b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c22_860b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c22_860b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c6_9ec2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c6_9ec2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l210_c6_9ec2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l210_c6_9ec2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_67b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_67b2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_67b2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_67b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c3_4bf7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c3_4bf7_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l219_c3_4bf7_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l219_c3_4bf7_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c3_8412_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c3_8412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l220_c3_8412_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l216_c19_1525_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l226_c3_3696_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l226_c3_3696_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l226_c3_3696_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l226_c3_3696_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c3_de78_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c3_de78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l227_c3_de78_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l223_c19_2cd6_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_read_address : unsigned(13 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_address : unsigned(13 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l230_c21_e7ca_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l237_c19_8557_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l237_c19_8557_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l237_c19_8557_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l237_c19_8557_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l239_c19_03d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l239_c19_03d9_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l239_c19_03d9_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l239_c50_673d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l239_c50_673d_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l239_c50_673d_iffalse : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l239_c50_673d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l239_c19_03d9_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c25_d908_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c25_d908_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c25_d908_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c25_d908_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c17_37f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c17_37f4_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l241_c17_37f4_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l241_c17_37f4_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_7705_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l198_l184_DUPLICATE_ba3f_return_output : unsigned(0 downto 0);
 variable VAR_uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l243_DUPLICATE_10bc_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_queue_read_ptr : unsigned(13 downto 0);
variable REG_VAR_queue_write_ptr : unsigned(13 downto 0);
variable REG_VAR_current_queue_item : draw_command_t;
variable REG_VAR_queue_write_value : unsigned(23 downto 0);
variable REG_VAR_queue_read_value : unsigned(23 downto 0);
variable REG_VAR_queue_write_enable : unsigned(0 downto 0);
variable REG_VAR_queue_phase : unsigned(1 downto 0);
variable REG_VAR_bg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_fg_pixel_color : unsigned(1 downto 0);
variable REG_VAR_is_buffer_swapped : unsigned(0 downto 0);
variable REG_VAR_adjusted_read_address : unsigned(16 downto 0);
variable REG_VAR_adjusted_write_address : unsigned(16 downto 0);
variable REG_VAR_fill_x0 : unsigned(7 downto 0);
variable REG_VAR_fill_y0 : unsigned(7 downto 0);
variable REG_VAR_fill_x1 : unsigned(7 downto 0);
variable REG_VAR_fill_y1 : unsigned(7 downto 0);
variable REG_VAR_x : unsigned(7 downto 0);
variable REG_VAR_y : unsigned(7 downto 0);
variable REG_VAR_fill_color : unsigned(1 downto 0);
variable REG_VAR_is_new_fill_row : unsigned(0 downto 0);
variable REG_VAR_is_last_fill_col : unsigned(0 downto 0);
variable REG_VAR_is_fill_active : unsigned(0 downto 0);
variable REG_VAR_fill_layer : unsigned(0 downto 0);
variable REG_VAR_is_fill_top : unsigned(0 downto 0);
variable REG_VAR_is_fill_left : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel0 : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel1 : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(16 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
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
  REG_VAR_bg_pixel_color := bg_pixel_color;
  REG_VAR_fg_pixel_color := fg_pixel_color;
  REG_VAR_is_buffer_swapped := is_buffer_swapped;
  REG_VAR_adjusted_read_address := adjusted_read_address;
  REG_VAR_adjusted_write_address := adjusted_write_address;
  REG_VAR_fill_x0 := fill_x0;
  REG_VAR_fill_y0 := fill_y0;
  REG_VAR_fill_x1 := fill_x1;
  REG_VAR_fill_y1 := fill_y1;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_fill_color := fill_color;
  REG_VAR_is_new_fill_row := is_new_fill_row;
  REG_VAR_is_last_fill_col := is_last_fill_col;
  REG_VAR_is_fill_active := is_fill_active;
  REG_VAR_fill_layer := fill_layer;
  REG_VAR_is_fill_top := is_fill_top;
  REG_VAR_is_fill_left := is_fill_left;
  REG_VAR_is_fill_pixel0 := is_fill_pixel0;
  REG_VAR_is_fill_pixel1 := is_fill_pixel1;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_is_caught_up := is_caught_up;
  REG_VAR_is_read_ready := is_read_ready;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l239_c19_03d9_iftrue := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l188_c13_55de_iffalse := to_unsigned(255, 8);
     VAR_queue_phase_uxn_c_l168_c3_9f83 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iftrue := VAR_queue_phase_uxn_c_l168_c3_9f83;
     VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l157_c17_9977_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l187_c13_b8f7_iffalse := to_unsigned(239, 8);
     VAR_queue_phase_uxn_c_l176_c3_4fc3 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue := VAR_queue_phase_uxn_c_l176_c3_4fc3;
     VAR_MUX_uxn_c_l157_c17_9977_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l209_c22_860b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l240_c25_d908_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l209_c22_860b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l189_c13_78a3_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l158_c18_5523_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l158_c18_5523_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l181_c16_6a4e_iftrue := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_right := to_unsigned(61439, 16);
     VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l237_c19_8557_iffalse := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l208_c21_b76d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l190_c13_d40c_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l240_c25_d908_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l208_c21_b76d_iftrue := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l203_c57_070f_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l206_c68_475b_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse := fill_y1;
     VAR_MUX_uxn_c_l239_c50_673d_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_left := pixel_counter;
     VAR_MUX_uxn_c_l239_c50_673d_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l198_c9_8ee5_iffalse := x;
     VAR_y_MUX_uxn_c_l198_c9_8ee5_iffalse := y;
     -- BIN_OP_EQ[uxn_c_l158_c18_1dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c18_1dca_left <= VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_left;
     BIN_OP_EQ_uxn_c_l158_c18_1dca_right <= VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output := BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output;

     -- uint24_19_19[uxn_c_l164_c34_093d] LATENCY=0
     VAR_uint24_19_19_uxn_c_l164_c34_093d_return_output := uint24_19_19(
     queue_read_value);

     -- uint24_15_0[uxn_c_l161_c37_94c6] LATENCY=0
     VAR_uint24_15_0_uxn_c_l161_c37_94c6_return_output := uint24_15_0(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l169_c3_577e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l169_c3_577e_left <= VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_left;
     BIN_OP_PLUS_uxn_c_l169_c3_577e_right <= VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output := BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output;

     -- UNARY_OP_NOT[uxn_c_l184_c66_e3fa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr <= VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output := UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output;

     -- BIN_OP_EQ[uxn_c_l157_c17_374c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l157_c17_374c_left <= VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_left;
     BIN_OP_EQ_uxn_c_l157_c17_374c_right <= VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_return_output := BIN_OP_EQ_uxn_c_l157_c17_374c_return_output;

     -- uint24_uint16_0[uxn_c_l173_c23_15bb] LATENCY=0
     VAR_uint24_uint16_0_uxn_c_l173_c23_15bb_return_output := uint24_uint16_0(
     resize(to_unsigned(0, 1), 24),
     VAR_vram_address);

     -- uint24_18_18[uxn_c_l163_c33_9e81] LATENCY=0
     VAR_uint24_18_18_uxn_c_l163_c33_9e81_return_output := uint24_18_18(
     queue_read_value);

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l160_c7_7853] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l160_c7_7853_return_output := current_queue_item.is_valid;

     -- BIN_OP_XOR[uxn_c_l156_c2_04b3] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l156_c2_04b3_left <= VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_left;
     BIN_OP_XOR_uxn_c_l156_c2_04b3_right <= VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output := BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output;

     -- uint24_17_16[uxn_c_l162_c30_ec62] LATENCY=0
     VAR_uint24_17_16_uxn_c_l162_c30_ec62_return_output := uint24_17_16(
     queue_read_value);

     -- uint24_21_21[uxn_c_l166_c30_4bad] LATENCY=0
     VAR_uint24_21_21_uxn_c_l166_c30_4bad_return_output := uint24_21_21(
     queue_read_value);

     -- uint24_20_20[uxn_c_l165_c32_7480] LATENCY=0
     VAR_uint24_20_20_uxn_c_l165_c32_7480_return_output := uint24_20_20(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l239_c76_22f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l239_c76_22f3_left <= VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_left;
     BIN_OP_PLUS_uxn_c_l239_c76_22f3_right <= VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output := BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output;

     -- uint8_4_0[uxn_c_l174_c58_a998] LATENCY=0
     VAR_uint8_4_0_uxn_c_l174_c58_a998_return_output := uint8_4_0(
     VAR_vram_value);

     -- BIN_OP_PLUS[uxn_c_l177_c3_910a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l177_c3_910a_left <= VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_left;
     BIN_OP_PLUS_uxn_c_l177_c3_910a_right <= VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output := BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output;

     -- BIN_OP_EQ[uxn_c_l239_c19_0f05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l239_c19_0f05_left <= VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_left;
     BIN_OP_EQ_uxn_c_l239_c19_0f05_right <= VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output := BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l157_c17_9977_cond := VAR_BIN_OP_EQ_uxn_c_l157_c17_374c_return_output;
     VAR_MUX_uxn_c_l158_c18_5523_cond := VAR_BIN_OP_EQ_uxn_c_l158_c18_1dca_return_output;
     VAR_MUX_uxn_c_l239_c19_03d9_cond := VAR_BIN_OP_EQ_uxn_c_l239_c19_0f05_return_output;
     VAR_queue_read_ptr_uxn_c_l169_c3_a681 := resize(VAR_BIN_OP_PLUS_uxn_c_l169_c3_577e_return_output, 14);
     VAR_queue_write_ptr_uxn_c_l177_c3_c2d1 := resize(VAR_BIN_OP_PLUS_uxn_c_l177_c3_910a_return_output, 14);
     VAR_MUX_uxn_c_l239_c50_673d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l239_c76_22f3_return_output, 17);
     VAR_BIN_OP_AND_uxn_c_l203_c57_070f_left := VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr := VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l156_c2_04b3_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l160_c7_7853_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_0824_right := VAR_UNARY_OP_NOT_uxn_c_l184_c66_e3fa_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue := VAR_queue_read_ptr_uxn_c_l169_c3_a681;
     VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue := VAR_queue_write_ptr_uxn_c_l177_c3_c2d1;
     -- MUX[uxn_c_l158_c18_5523] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c18_5523_cond <= VAR_MUX_uxn_c_l158_c18_5523_cond;
     MUX_uxn_c_l158_c18_5523_iftrue <= VAR_MUX_uxn_c_l158_c18_5523_iftrue;
     MUX_uxn_c_l158_c18_5523_iffalse <= VAR_MUX_uxn_c_l158_c18_5523_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c18_5523_return_output := MUX_uxn_c_l158_c18_5523_return_output;

     -- uint24_uint5_16[uxn_c_l174_c23_c1fe] LATENCY=0
     VAR_uint24_uint5_16_uxn_c_l174_c23_c1fe_return_output := uint24_uint5_16(
     VAR_uint24_uint16_0_uxn_c_l173_c23_15bb_return_output,
     VAR_uint8_4_0_uxn_c_l174_c58_a998_return_output);

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l160_c2_e794] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l160_c2_e794_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l161_c37_94c6_return_output,
     VAR_uint24_17_16_uxn_c_l162_c30_ec62_return_output,
     VAR_uint24_18_18_uxn_c_l163_c33_9e81_return_output,
     VAR_uint24_19_19_uxn_c_l164_c34_093d_return_output,
     VAR_uint24_20_20_uxn_c_l165_c32_7480_return_output,
     VAR_uint24_21_21_uxn_c_l166_c30_4bad_return_output,
     to_unsigned(1, 1));

     -- MUX[uxn_c_l157_c17_9977] LATENCY=0
     -- Inputs
     MUX_uxn_c_l157_c17_9977_cond <= VAR_MUX_uxn_c_l157_c17_9977_cond;
     MUX_uxn_c_l157_c17_9977_iftrue <= VAR_MUX_uxn_c_l157_c17_9977_iftrue;
     MUX_uxn_c_l157_c17_9977_iffalse <= VAR_MUX_uxn_c_l157_c17_9977_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l157_c17_9977_return_output := MUX_uxn_c_l157_c17_9977_return_output;

     -- BIN_OP_AND[uxn_c_l203_c57_070f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l203_c57_070f_left <= VAR_BIN_OP_AND_uxn_c_l203_c57_070f_left;
     BIN_OP_AND_uxn_c_l203_c57_070f_right <= VAR_BIN_OP_AND_uxn_c_l203_c57_070f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l203_c57_070f_return_output := BIN_OP_AND_uxn_c_l203_c57_070f_return_output;

     -- UNARY_OP_NOT[uxn_c_l206_c68_f35b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr <= VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output := UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output;

     -- UNARY_OP_NOT[uxn_c_l160_c7_1038] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l160_c7_1038_expr <= VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output := UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output;

     -- MUX[uxn_c_l239_c50_673d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l239_c50_673d_cond <= VAR_MUX_uxn_c_l239_c50_673d_cond;
     MUX_uxn_c_l239_c50_673d_iftrue <= VAR_MUX_uxn_c_l239_c50_673d_iftrue;
     MUX_uxn_c_l239_c50_673d_iffalse <= VAR_MUX_uxn_c_l239_c50_673d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l239_c50_673d_return_output := MUX_uxn_c_l239_c50_673d_return_output;

     -- queue_write_ptr_MUX[uxn_c_l172_c2_b84e] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond <= VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_cond;
     queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iftrue;
     queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output := queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr := VAR_MUX_uxn_c_l157_c17_9977_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l157_c17_9977_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_right := VAR_MUX_uxn_c_l158_c18_5523_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l158_c18_5523_return_output;
     VAR_MUX_uxn_c_l239_c19_03d9_iffalse := VAR_MUX_uxn_c_l239_c50_673d_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_left := VAR_UNARY_OP_NOT_uxn_c_l160_c7_1038_return_output;
     VAR_BIN_OP_AND_uxn_c_l206_c68_475b_left := VAR_UNARY_OP_NOT_uxn_c_l206_c68_f35b_return_output;
     VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l160_c2_e794_return_output;
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_address := VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l172_c2_b84e_return_output;
     -- BIN_OP_AND[uxn_c_l206_c68_475b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l206_c68_475b_left <= VAR_BIN_OP_AND_uxn_c_l206_c68_475b_left;
     BIN_OP_AND_uxn_c_l206_c68_475b_right <= VAR_BIN_OP_AND_uxn_c_l206_c68_475b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l206_c68_475b_return_output := BIN_OP_AND_uxn_c_l206_c68_475b_return_output;

     -- uint17_uint1_16[uxn_c_l203_c26_d940] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l203_c26_d940_return_output := uint17_uint1_16(
     pixel_counter,
     VAR_BIN_OP_AND_uxn_c_l203_c57_070f_return_output);

     -- MUX[uxn_c_l239_c19_03d9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l239_c19_03d9_cond <= VAR_MUX_uxn_c_l239_c19_03d9_cond;
     MUX_uxn_c_l239_c19_03d9_iftrue <= VAR_MUX_uxn_c_l239_c19_03d9_iftrue;
     MUX_uxn_c_l239_c19_03d9_iffalse <= VAR_MUX_uxn_c_l239_c19_03d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l239_c19_03d9_return_output := MUX_uxn_c_l239_c19_03d9_return_output;

     -- uint24_uint1_21[uxn_c_l175_c23_498c] LATENCY=0
     VAR_uint24_uint1_21_uxn_c_l175_c23_498c_return_output := uint24_uint1_21(
     VAR_uint24_uint5_16_uxn_c_l174_c23_c1fe_return_output,
     VAR_vram_write_layer);

     -- UNARY_OP_NOT[uxn_c_l160_c38_2e68] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr <= VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output := UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_left := VAR_MUX_uxn_c_l239_c19_03d9_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l239_c19_03d9_return_output;
     VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_right := VAR_UNARY_OP_NOT_uxn_c_l160_c38_2e68_return_output;
     REG_VAR_adjusted_read_address := VAR_uint17_uint1_16_uxn_c_l203_c26_d940_return_output;
     VAR_bg_vram_update_uxn_c_l216_c19_1525_read_address := VAR_uint17_uint1_16_uxn_c_l203_c26_d940_return_output;
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_read_address := VAR_uint17_uint1_16_uxn_c_l203_c26_d940_return_output;
     VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue := VAR_uint24_uint1_21_uxn_c_l175_c23_498c_return_output;
     -- BIN_OP_EQ[uxn_c_l240_c25_4f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c25_4f03_left <= VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_left;
     BIN_OP_EQ_uxn_c_l240_c25_4f03_right <= VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output := BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output;

     -- BIN_OP_AND[uxn_c_l160_c7_f9e0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c7_f9e0_left <= VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_left;
     BIN_OP_AND_uxn_c_l160_c7_f9e0_right <= VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output := BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output;

     -- queue_write_value_MUX[uxn_c_l172_c2_b84e] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l172_c2_b84e_cond <= VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_cond;
     queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue <= VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iftrue;
     queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse <= VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output := queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_left := VAR_BIN_OP_AND_uxn_c_l160_c7_f9e0_return_output;
     VAR_MUX_uxn_c_l240_c25_d908_cond := VAR_BIN_OP_EQ_uxn_c_l240_c25_4f03_return_output;
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_value := VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l172_c2_b84e_return_output;
     -- MUX[uxn_c_l240_c25_d908] LATENCY=0
     -- Inputs
     MUX_uxn_c_l240_c25_d908_cond <= VAR_MUX_uxn_c_l240_c25_d908_cond;
     MUX_uxn_c_l240_c25_d908_iftrue <= VAR_MUX_uxn_c_l240_c25_d908_iftrue;
     MUX_uxn_c_l240_c25_d908_iffalse <= VAR_MUX_uxn_c_l240_c25_d908_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l240_c25_d908_return_output := MUX_uxn_c_l240_c25_d908_return_output;

     -- BIN_OP_AND[uxn_c_l160_c7_7ed5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c7_7ed5_left <= VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_left;
     BIN_OP_AND_uxn_c_l160_c7_7ed5_right <= VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output := BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_cond := VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output;
     VAR_queue_phase_MUX_uxn_c_l160_c2_e794_cond := VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond := VAR_BIN_OP_AND_uxn_c_l160_c7_7ed5_return_output;
     -- queue_phase_MUX[uxn_c_l160_c2_e794] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l160_c2_e794_cond <= VAR_queue_phase_MUX_uxn_c_l160_c2_e794_cond;
     queue_phase_MUX_uxn_c_l160_c2_e794_iftrue <= VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iftrue;
     queue_phase_MUX_uxn_c_l160_c2_e794_iffalse <= VAR_queue_phase_MUX_uxn_c_l160_c2_e794_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l160_c2_e794_return_output := queue_phase_MUX_uxn_c_l160_c2_e794_return_output;

     -- queue_read_ptr_MUX[uxn_c_l160_c2_e794] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond <= VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_cond;
     queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iftrue;
     queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output := queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output;

     -- current_queue_item_MUX[uxn_c_l160_c2_e794] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l160_c2_e794_cond <= VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_cond;
     current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue <= VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iftrue;
     current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse <= VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output := current_queue_item_MUX_uxn_c_l160_c2_e794_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse := VAR_queue_phase_MUX_uxn_c_l160_c2_e794_return_output;
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_read_address := VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l160_c2_e794_return_output;
     -- queue_phase_MUX[uxn_c_l172_c2_b84e] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l172_c2_b84e_cond <= VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_cond;
     queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue <= VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iftrue;
     queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse <= VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_return_output := queue_phase_MUX_uxn_c_l172_c2_b84e_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l198_l184_DUPLICATE_ba3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l198_l184_DUPLICATE_ba3f_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.is_fill;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.is_valid;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.layer;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l186_c18_751e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l186_c18_751e_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.fill_left;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l185_c17_89e5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l185_c17_89e5_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.fill_top;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.color;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d[uxn_c_l182_c10_b615] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l182_c10_b615_return_output := VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output.vram_address;

     -- draw_queue_update[uxn_c_l230_c21_e7ca] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l230_c21_e7ca_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l230_c21_e7ca_read_address <= VAR_draw_queue_update_uxn_c_l230_c21_e7ca_read_address;
     draw_queue_update_uxn_c_l230_c21_e7ca_write_address <= VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_address;
     draw_queue_update_uxn_c_l230_c21_e7ca_write_value <= VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_value;
     draw_queue_update_uxn_c_l230_c21_e7ca_write_enable <= VAR_draw_queue_update_uxn_c_l230_c21_e7ca_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l230_c21_e7ca_return_output := draw_queue_update_uxn_c_l230_c21_e7ca_return_output;

     -- Submodule level 7
     REG_VAR_tmp16 := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l182_c10_b615_return_output;
     VAR_MUX_uxn_c_l188_c13_55de_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l186_c18_751e_return_output;
     VAR_MUX_uxn_c_l190_c13_d40c_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l186_c18_751e_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l186_c18_751e_return_output;
     VAR_MUX_uxn_c_l187_c13_b8f7_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l185_c17_89e5_return_output;
     VAR_MUX_uxn_c_l189_c13_78a3_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l185_c17_89e5_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l185_c17_89e5_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l198_l184_DUPLICATE_ba3f_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l198_l184_DUPLICATE_ba3f_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792_return_output;
     VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l198_l184_l227_l220_DUPLICATE_c792_return_output;
     VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l220_l227_l191_DUPLICATE_fcfa_return_output;
     VAR_MUX_uxn_c_l219_c3_4bf7_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8_return_output;
     VAR_MUX_uxn_c_l226_c3_3696_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8_return_output;
     VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l192_l219_l226_DUPLICATE_69c8_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l230_c21_e7ca_return_output;
     VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_left := VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left := VAR_queue_phase_MUX_uxn_c_l172_c2_b84e_return_output;
     -- BIN_OP_AND[uxn_c_l184_c6_55d7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_55d7_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_left;
     BIN_OP_AND_uxn_c_l184_c6_55d7_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_return_output := BIN_OP_AND_uxn_c_l184_c6_55d7_return_output;

     -- UNARY_OP_NOT[uxn_c_l220_c71_e3ad] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr <= VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output := UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output;

     -- BIN_OP_EQ[uxn_c_l181_c16_2fc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l181_c16_2fc9_left <= VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_left;
     BIN_OP_EQ_uxn_c_l181_c16_2fc9_right <= VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output := BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output;

     -- uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d LATENCY=0
     VAR_uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l182_c10_b615_return_output);

     -- uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1 LATENCY=0
     VAR_uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1_return_output := uint16_7_0(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l182_c10_b615_return_output);

     -- UNARY_OP_NOT[uxn_c_l198_c44_562e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l198_c44_562e_expr <= VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output := UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output;

     -- BIN_OP_PLUS[uxn_c_l181_c39_d5cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left <= VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_left;
     BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right <= VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output := BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l184_c6_0824_left := VAR_BIN_OP_AND_uxn_c_l184_c6_55d7_return_output;
     VAR_MUX_uxn_c_l181_c16_6a4e_cond := VAR_BIN_OP_EQ_uxn_c_l181_c16_2fc9_return_output;
     VAR_MUX_uxn_c_l181_c16_6a4e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l181_c39_d5cb_return_output, 2);
     VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_right := VAR_UNARY_OP_NOT_uxn_c_l198_c44_562e_return_output;
     VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_right := VAR_UNARY_OP_NOT_uxn_c_l220_c71_e3ad_return_output;
     VAR_MUX_uxn_c_l187_c13_b8f7_iftrue := VAR_uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d_return_output;
     VAR_MUX_uxn_c_l189_c13_78a3_iffalse := VAR_uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d_return_output;
     VAR_y_MUX_uxn_c_l198_c9_8ee5_iftrue := VAR_uint16_15_8_uxn_c_l189_l187_l199_DUPLICATE_d63d_return_output;
     VAR_MUX_uxn_c_l188_c13_55de_iftrue := VAR_uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1_return_output;
     VAR_MUX_uxn_c_l190_c13_d40c_iffalse := VAR_uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1_return_output;
     VAR_x_MUX_uxn_c_l198_c9_8ee5_iftrue := VAR_uint16_7_0_uxn_c_l188_l190_l200_DUPLICATE_aad1_return_output;
     -- BIN_OP_AND[uxn_c_l184_c6_0824] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_0824_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_0824_left;
     BIN_OP_AND_uxn_c_l184_c6_0824_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_0824_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output := BIN_OP_AND_uxn_c_l184_c6_0824_return_output;

     -- BIN_OP_AND[uxn_c_l198_c13_8a58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l198_c13_8a58_left <= VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_left;
     BIN_OP_AND_uxn_c_l198_c13_8a58_right <= VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_return_output := BIN_OP_AND_uxn_c_l198_c13_8a58_return_output;

     -- MUX[uxn_c_l187_c13_b8f7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l187_c13_b8f7_cond <= VAR_MUX_uxn_c_l187_c13_b8f7_cond;
     MUX_uxn_c_l187_c13_b8f7_iftrue <= VAR_MUX_uxn_c_l187_c13_b8f7_iftrue;
     MUX_uxn_c_l187_c13_b8f7_iffalse <= VAR_MUX_uxn_c_l187_c13_b8f7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l187_c13_b8f7_return_output := MUX_uxn_c_l187_c13_b8f7_return_output;

     -- MUX[uxn_c_l189_c13_78a3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_78a3_cond <= VAR_MUX_uxn_c_l189_c13_78a3_cond;
     MUX_uxn_c_l189_c13_78a3_iftrue <= VAR_MUX_uxn_c_l189_c13_78a3_iftrue;
     MUX_uxn_c_l189_c13_78a3_iffalse <= VAR_MUX_uxn_c_l189_c13_78a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_78a3_return_output := MUX_uxn_c_l189_c13_78a3_return_output;

     -- MUX[uxn_c_l188_c13_55de] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_55de_cond <= VAR_MUX_uxn_c_l188_c13_55de_cond;
     MUX_uxn_c_l188_c13_55de_iftrue <= VAR_MUX_uxn_c_l188_c13_55de_iftrue;
     MUX_uxn_c_l188_c13_55de_iffalse <= VAR_MUX_uxn_c_l188_c13_55de_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_55de_return_output := MUX_uxn_c_l188_c13_55de_return_output;

     -- MUX[uxn_c_l181_c16_6a4e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l181_c16_6a4e_cond <= VAR_MUX_uxn_c_l181_c16_6a4e_cond;
     MUX_uxn_c_l181_c16_6a4e_iftrue <= VAR_MUX_uxn_c_l181_c16_6a4e_iftrue;
     MUX_uxn_c_l181_c16_6a4e_iffalse <= VAR_MUX_uxn_c_l181_c16_6a4e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l181_c16_6a4e_return_output := MUX_uxn_c_l181_c16_6a4e_return_output;

     -- MUX[uxn_c_l190_c13_d40c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_d40c_cond <= VAR_MUX_uxn_c_l190_c13_d40c_cond;
     MUX_uxn_c_l190_c13_d40c_iftrue <= VAR_MUX_uxn_c_l190_c13_d40c_iftrue;
     MUX_uxn_c_l190_c13_d40c_iffalse <= VAR_MUX_uxn_c_l190_c13_d40c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_d40c_return_output := MUX_uxn_c_l190_c13_d40c_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_x_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_y_MUX_uxn_c_l184_c2_fe8c_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_0824_return_output;
     VAR_x_MUX_uxn_c_l198_c9_8ee5_cond := VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_return_output;
     VAR_y_MUX_uxn_c_l198_c9_8ee5_cond := VAR_BIN_OP_AND_uxn_c_l198_c13_8a58_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l181_c16_6a4e_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l187_c13_b8f7_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l188_c13_55de_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l189_c13_78a3_return_output;
     VAR_y_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l189_c13_78a3_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l190_c13_d40c_return_output;
     VAR_x_MUX_uxn_c_l184_c2_fe8c_iftrue := VAR_MUX_uxn_c_l190_c13_d40c_return_output;
     -- y_MUX[uxn_c_l198_c9_8ee5] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l198_c9_8ee5_cond <= VAR_y_MUX_uxn_c_l198_c9_8ee5_cond;
     y_MUX_uxn_c_l198_c9_8ee5_iftrue <= VAR_y_MUX_uxn_c_l198_c9_8ee5_iftrue;
     y_MUX_uxn_c_l198_c9_8ee5_iffalse <= VAR_y_MUX_uxn_c_l198_c9_8ee5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l198_c9_8ee5_return_output := y_MUX_uxn_c_l198_c9_8ee5_return_output;

     -- fill_y0_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output := fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- x_MUX[uxn_c_l198_c9_8ee5] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l198_c9_8ee5_cond <= VAR_x_MUX_uxn_c_l198_c9_8ee5_cond;
     x_MUX_uxn_c_l198_c9_8ee5_iftrue <= VAR_x_MUX_uxn_c_l198_c9_8ee5_iftrue;
     x_MUX_uxn_c_l198_c9_8ee5_iffalse <= VAR_x_MUX_uxn_c_l198_c9_8ee5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l198_c9_8ee5_return_output := x_MUX_uxn_c_l198_c9_8ee5_return_output;

     -- is_fill_active_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_cond;
     is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iftrue;
     is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output := is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- fill_color_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_return_output := fill_color_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- is_fill_left_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_cond;
     is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iftrue;
     is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output := is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- fill_layer_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output := fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- fill_x0_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output := fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- fill_y1_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output := fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- is_fill_top_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_cond;
     is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iftrue;
     is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output := is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- fill_x1_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_cond;
     fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iftrue;
     fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output := fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l219_c3_4bf7_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_MUX_uxn_c_l226_c3_3696_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_right := VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr := VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_MUX_uxn_c_l211_c6_67b2_iftrue := VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_right := VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_right := VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_MUX_uxn_c_l237_c19_8557_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr := VAR_is_fill_active_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l184_c2_fe8c_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_x_MUX_uxn_c_l184_c2_fe8c_iffalse := VAR_x_MUX_uxn_c_l198_c9_8ee5_return_output;
     VAR_y_MUX_uxn_c_l184_c2_fe8c_iffalse := VAR_y_MUX_uxn_c_l198_c9_8ee5_return_output;
     -- BIN_OP_AND[uxn_c_l214_c19_8ac5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l214_c19_8ac5_left <= VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_left;
     BIN_OP_AND_uxn_c_l214_c19_8ac5_right <= VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output := BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output;

     -- UNARY_OP_NOT[uxn_c_l213_c38_78cb] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr <= VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output := UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output;

     -- x_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_x_MUX_uxn_c_l184_c2_fe8c_cond;
     x_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_x_MUX_uxn_c_l184_c2_fe8c_iftrue;
     x_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_x_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l184_c2_fe8c_return_output := x_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- y_MUX[uxn_c_l184_c2_fe8c] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l184_c2_fe8c_cond <= VAR_y_MUX_uxn_c_l184_c2_fe8c_cond;
     y_MUX_uxn_c_l184_c2_fe8c_iftrue <= VAR_y_MUX_uxn_c_l184_c2_fe8c_iftrue;
     y_MUX_uxn_c_l184_c2_fe8c_iffalse <= VAR_y_MUX_uxn_c_l184_c2_fe8c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output := y_MUX_uxn_c_l184_c2_fe8c_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l227_c3_de78_left := VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output;
     VAR_MUX_uxn_c_l226_c3_3696_cond := VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l214_c19_8ac5_return_output;
     VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_right := VAR_UNARY_OP_NOT_uxn_c_l213_c38_78cb_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l220_l227_DUPLICATE_a727_return_output;
     VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_left := VAR_x_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_left := VAR_x_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_left := VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_left := VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output;
     VAR_MUX_uxn_c_l210_c6_9ec2_iffalse := VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output;
     -- BIN_OP_EQ[uxn_c_l208_c21_dec3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l208_c21_dec3_left <= VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_left;
     BIN_OP_EQ_uxn_c_l208_c21_dec3_right <= VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output := BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output;

     -- BIN_OP_EQ[uxn_c_l209_c22_1dda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l209_c22_1dda_left <= VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_left;
     BIN_OP_EQ_uxn_c_l209_c22_1dda_right <= VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output := BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output;

     -- BIN_OP_PLUS[uxn_c_l211_c34_562d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l211_c34_562d_left <= VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_left;
     BIN_OP_PLUS_uxn_c_l211_c34_562d_right <= VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output := BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output;

     -- MUX[uxn_c_l226_c3_3696] LATENCY=0
     -- Inputs
     MUX_uxn_c_l226_c3_3696_cond <= VAR_MUX_uxn_c_l226_c3_3696_cond;
     MUX_uxn_c_l226_c3_3696_iftrue <= VAR_MUX_uxn_c_l226_c3_3696_iftrue;
     MUX_uxn_c_l226_c3_3696_iffalse <= VAR_MUX_uxn_c_l226_c3_3696_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l226_c3_3696_return_output := MUX_uxn_c_l226_c3_3696_return_output;

     -- BIN_OP_PLUS[uxn_c_l210_c25_11e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l210_c25_11e5_left <= VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_left;
     BIN_OP_PLUS_uxn_c_l210_c25_11e5_right <= VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output := BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output;

     -- uint17_uint8_8[uxn_c_l204_c27_06b2] LATENCY=0
     VAR_uint17_uint8_8_uxn_c_l204_c27_06b2_return_output := uint17_uint8_8(
     resize(to_unsigned(0, 1), 17),
     VAR_y_MUX_uxn_c_l184_c2_fe8c_return_output);

     -- BIN_OP_AND[uxn_c_l213_c19_dedd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l213_c19_dedd_left <= VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_left;
     BIN_OP_AND_uxn_c_l213_c19_dedd_right <= VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_return_output := BIN_OP_AND_uxn_c_l213_c19_dedd_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l220_c3_8412_left := VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_return_output;
     VAR_MUX_uxn_c_l219_c3_4bf7_cond := VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l213_c19_dedd_return_output;
     VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output;
     VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l227_l220_DUPLICATE_0c81_return_output;
     VAR_MUX_uxn_c_l208_c21_b76d_cond := VAR_BIN_OP_EQ_uxn_c_l208_c21_dec3_return_output;
     VAR_MUX_uxn_c_l209_c22_860b_cond := VAR_BIN_OP_EQ_uxn_c_l209_c22_1dda_return_output;
     VAR_MUX_uxn_c_l210_c6_9ec2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l210_c25_11e5_return_output, 8);
     VAR_MUX_uxn_c_l211_c6_67b2_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l211_c34_562d_return_output, 8);
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_value := VAR_MUX_uxn_c_l226_c3_3696_return_output;
     -- uint17_uint8_0[uxn_c_l205_c27_b56e] LATENCY=0
     VAR_uint17_uint8_0_uxn_c_l205_c27_b56e_return_output := uint17_uint8_0(
     VAR_uint17_uint8_8_uxn_c_l204_c27_06b2_return_output,
     VAR_x_MUX_uxn_c_l184_c2_fe8c_return_output);

     -- BIN_OP_AND[uxn_c_l220_c22_f2b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l220_c22_f2b2_left <= VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_left;
     BIN_OP_AND_uxn_c_l220_c22_f2b2_right <= VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output := BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output;

     -- MUX[uxn_c_l208_c21_b76d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l208_c21_b76d_cond <= VAR_MUX_uxn_c_l208_c21_b76d_cond;
     MUX_uxn_c_l208_c21_b76d_iftrue <= VAR_MUX_uxn_c_l208_c21_b76d_iftrue;
     MUX_uxn_c_l208_c21_b76d_iffalse <= VAR_MUX_uxn_c_l208_c21_b76d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l208_c21_b76d_return_output := MUX_uxn_c_l208_c21_b76d_return_output;

     -- MUX[uxn_c_l219_c3_4bf7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l219_c3_4bf7_cond <= VAR_MUX_uxn_c_l219_c3_4bf7_cond;
     MUX_uxn_c_l219_c3_4bf7_iftrue <= VAR_MUX_uxn_c_l219_c3_4bf7_iftrue;
     MUX_uxn_c_l219_c3_4bf7_iffalse <= VAR_MUX_uxn_c_l219_c3_4bf7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l219_c3_4bf7_return_output := MUX_uxn_c_l219_c3_4bf7_return_output;

     -- BIN_OP_AND[uxn_c_l227_c22_0cfc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l227_c22_0cfc_left <= VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_left;
     BIN_OP_AND_uxn_c_l227_c22_0cfc_right <= VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output := BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output;

     -- MUX[uxn_c_l209_c22_860b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l209_c22_860b_cond <= VAR_MUX_uxn_c_l209_c22_860b_cond;
     MUX_uxn_c_l209_c22_860b_iftrue <= VAR_MUX_uxn_c_l209_c22_860b_iftrue;
     MUX_uxn_c_l209_c22_860b_iffalse <= VAR_MUX_uxn_c_l209_c22_860b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l209_c22_860b_return_output := MUX_uxn_c_l209_c22_860b_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l220_c3_8412_right := VAR_BIN_OP_AND_uxn_c_l220_c22_f2b2_return_output;
     VAR_BIN_OP_OR_uxn_c_l227_c3_de78_right := VAR_BIN_OP_AND_uxn_c_l227_c22_0cfc_return_output;
     VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_left := VAR_MUX_uxn_c_l208_c21_b76d_return_output;
     VAR_MUX_uxn_c_l210_c6_9ec2_cond := VAR_MUX_uxn_c_l208_c21_b76d_return_output;
     VAR_MUX_uxn_c_l211_c6_67b2_cond := VAR_MUX_uxn_c_l208_c21_b76d_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l208_c21_b76d_return_output;
     VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_right := VAR_MUX_uxn_c_l209_c22_860b_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l209_c22_860b_return_output;
     VAR_bg_vram_update_uxn_c_l216_c19_1525_write_value := VAR_MUX_uxn_c_l219_c3_4bf7_return_output;
     -- MUX[uxn_c_l211_c6_67b2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l211_c6_67b2_cond <= VAR_MUX_uxn_c_l211_c6_67b2_cond;
     MUX_uxn_c_l211_c6_67b2_iftrue <= VAR_MUX_uxn_c_l211_c6_67b2_iftrue;
     MUX_uxn_c_l211_c6_67b2_iffalse <= VAR_MUX_uxn_c_l211_c6_67b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l211_c6_67b2_return_output := MUX_uxn_c_l211_c6_67b2_return_output;

     -- BIN_OP_OR[uxn_c_l220_c3_8412] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l220_c3_8412_left <= VAR_BIN_OP_OR_uxn_c_l220_c3_8412_left;
     BIN_OP_OR_uxn_c_l220_c3_8412_right <= VAR_BIN_OP_OR_uxn_c_l220_c3_8412_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l220_c3_8412_return_output := BIN_OP_OR_uxn_c_l220_c3_8412_return_output;

     -- BIN_OP_AND[uxn_c_l237_c38_3a6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l237_c38_3a6e_left <= VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_left;
     BIN_OP_AND_uxn_c_l237_c38_3a6e_right <= VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output := BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output;

     -- uint17_uint1_16[uxn_c_l206_c27_fb9c] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l206_c27_fb9c_return_output := uint17_uint1_16(
     VAR_uint17_uint8_0_uxn_c_l205_c27_b56e_return_output,
     VAR_BIN_OP_AND_uxn_c_l206_c68_475b_return_output);

     -- MUX[uxn_c_l210_c6_9ec2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l210_c6_9ec2_cond <= VAR_MUX_uxn_c_l210_c6_9ec2_cond;
     MUX_uxn_c_l210_c6_9ec2_iftrue <= VAR_MUX_uxn_c_l210_c6_9ec2_iftrue;
     MUX_uxn_c_l210_c6_9ec2_iffalse <= VAR_MUX_uxn_c_l210_c6_9ec2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l210_c6_9ec2_return_output := MUX_uxn_c_l210_c6_9ec2_return_output;

     -- BIN_OP_OR[uxn_c_l227_c3_de78] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l227_c3_de78_left <= VAR_BIN_OP_OR_uxn_c_l227_c3_de78_left;
     BIN_OP_OR_uxn_c_l227_c3_de78_right <= VAR_BIN_OP_OR_uxn_c_l227_c3_de78_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l227_c3_de78_return_output := BIN_OP_OR_uxn_c_l227_c3_de78_return_output;

     -- Submodule level 14
     VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr := VAR_BIN_OP_AND_uxn_c_l237_c38_3a6e_return_output;
     VAR_bg_vram_update_uxn_c_l216_c19_1525_write_enable := VAR_BIN_OP_OR_uxn_c_l220_c3_8412_return_output;
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_enable := VAR_BIN_OP_OR_uxn_c_l227_c3_de78_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l210_c6_9ec2_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l211_c6_67b2_return_output;
     REG_VAR_adjusted_write_address := VAR_uint17_uint1_16_uxn_c_l206_c27_fb9c_return_output;
     VAR_bg_vram_update_uxn_c_l216_c19_1525_write_address := VAR_uint17_uint1_16_uxn_c_l206_c27_fb9c_return_output;
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_address := VAR_uint17_uint1_16_uxn_c_l206_c27_fb9c_return_output;
     -- UNARY_OP_NOT[uxn_c_l237_c38_b6a0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr <= VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output := UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output;

     -- fg_vram_update[uxn_c_l223_c19_2cd6] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l223_c19_2cd6_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l223_c19_2cd6_read_address <= VAR_fg_vram_update_uxn_c_l223_c19_2cd6_read_address;
     fg_vram_update_uxn_c_l223_c19_2cd6_write_address <= VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_address;
     fg_vram_update_uxn_c_l223_c19_2cd6_write_value <= VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_value;
     fg_vram_update_uxn_c_l223_c19_2cd6_write_enable <= VAR_fg_vram_update_uxn_c_l223_c19_2cd6_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l223_c19_2cd6_return_output := fg_vram_update_uxn_c_l223_c19_2cd6_return_output;

     -- bg_vram_update[uxn_c_l216_c19_1525] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l216_c19_1525_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l216_c19_1525_read_address <= VAR_bg_vram_update_uxn_c_l216_c19_1525_read_address;
     bg_vram_update_uxn_c_l216_c19_1525_write_address <= VAR_bg_vram_update_uxn_c_l216_c19_1525_write_address;
     bg_vram_update_uxn_c_l216_c19_1525_write_value <= VAR_bg_vram_update_uxn_c_l216_c19_1525_write_value;
     bg_vram_update_uxn_c_l216_c19_1525_write_enable <= VAR_bg_vram_update_uxn_c_l216_c19_1525_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l216_c19_1525_return_output := bg_vram_update_uxn_c_l216_c19_1525_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l237_c19_8557_iftrue := VAR_UNARY_OP_NOT_uxn_c_l237_c38_b6a0_return_output;
     VAR_MUX_uxn_c_l241_c17_37f4_iftrue := VAR_bg_vram_update_uxn_c_l216_c19_1525_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l216_c19_1525_return_output;
     VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_left := VAR_fg_vram_update_uxn_c_l223_c19_2cd6_return_output;
     VAR_MUX_uxn_c_l241_c17_37f4_iffalse := VAR_fg_vram_update_uxn_c_l223_c19_2cd6_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l223_c19_2cd6_return_output;
     -- BIN_OP_EQ[uxn_c_l241_c17_0cd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l241_c17_0cd6_left <= VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_left;
     BIN_OP_EQ_uxn_c_l241_c17_0cd6_right <= VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output := BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output;

     -- MUX[uxn_c_l237_c19_8557] LATENCY=0
     -- Inputs
     MUX_uxn_c_l237_c19_8557_cond <= VAR_MUX_uxn_c_l237_c19_8557_cond;
     MUX_uxn_c_l237_c19_8557_iftrue <= VAR_MUX_uxn_c_l237_c19_8557_iftrue;
     MUX_uxn_c_l237_c19_8557_iffalse <= VAR_MUX_uxn_c_l237_c19_8557_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l237_c19_8557_return_output := MUX_uxn_c_l237_c19_8557_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l241_c17_37f4_cond := VAR_BIN_OP_EQ_uxn_c_l241_c17_0cd6_return_output;
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l237_c19_8557_return_output;
     -- MUX[uxn_c_l241_c17_37f4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l241_c17_37f4_cond <= VAR_MUX_uxn_c_l241_c17_37f4_cond;
     MUX_uxn_c_l241_c17_37f4_iftrue <= VAR_MUX_uxn_c_l241_c17_37f4_iftrue;
     MUX_uxn_c_l241_c17_37f4_iffalse <= VAR_MUX_uxn_c_l241_c17_37f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l241_c17_37f4_return_output := MUX_uxn_c_l241_c17_37f4_return_output;

     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_7705] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_7705_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l160_c2_e794_return_output,
     VAR_MUX_uxn_c_l237_c19_8557_return_output);

     -- Submodule level 17
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_7705_return_output;
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l243_DUPLICATE_10bc LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l243_DUPLICATE_10bc_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l240_c25_d908_return_output,
     VAR_MUX_uxn_c_l241_c17_37f4_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l243_DUPLICATE_10bc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l243_DUPLICATE_10bc_return_output;
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
REG_COMB_bg_pixel_color <= REG_VAR_bg_pixel_color;
REG_COMB_fg_pixel_color <= REG_VAR_fg_pixel_color;
REG_COMB_is_buffer_swapped <= REG_VAR_is_buffer_swapped;
REG_COMB_adjusted_read_address <= REG_VAR_adjusted_read_address;
REG_COMB_adjusted_write_address <= REG_VAR_adjusted_write_address;
REG_COMB_fill_x0 <= REG_VAR_fill_x0;
REG_COMB_fill_y0 <= REG_VAR_fill_y0;
REG_COMB_fill_x1 <= REG_VAR_fill_x1;
REG_COMB_fill_y1 <= REG_VAR_fill_y1;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_fill_color <= REG_VAR_fill_color;
REG_COMB_is_new_fill_row <= REG_VAR_is_new_fill_row;
REG_COMB_is_last_fill_col <= REG_VAR_is_last_fill_col;
REG_COMB_is_fill_active <= REG_VAR_is_fill_active;
REG_COMB_fill_layer <= REG_VAR_fill_layer;
REG_COMB_is_fill_top <= REG_VAR_is_fill_top;
REG_COMB_is_fill_left <= REG_VAR_is_fill_left;
REG_COMB_is_fill_pixel0 <= REG_VAR_is_fill_pixel0;
REG_COMB_is_fill_pixel1 <= REG_VAR_is_fill_pixel1;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_tmp16 <= REG_VAR_tmp16;
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
     bg_pixel_color <= REG_COMB_bg_pixel_color;
     fg_pixel_color <= REG_COMB_fg_pixel_color;
     is_buffer_swapped <= REG_COMB_is_buffer_swapped;
     adjusted_read_address <= REG_COMB_adjusted_read_address;
     adjusted_write_address <= REG_COMB_adjusted_write_address;
     fill_x0 <= REG_COMB_fill_x0;
     fill_y0 <= REG_COMB_fill_y0;
     fill_x1 <= REG_COMB_fill_x1;
     fill_y1 <= REG_COMB_fill_y1;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     fill_color <= REG_COMB_fill_color;
     is_new_fill_row <= REG_COMB_is_new_fill_row;
     is_last_fill_col <= REG_COMB_is_last_fill_col;
     is_fill_active <= REG_COMB_is_fill_active;
     fill_layer <= REG_COMB_fill_layer;
     is_fill_top <= REG_COMB_is_fill_top;
     is_fill_left <= REG_COMB_is_fill_left;
     is_fill_pixel0 <= REG_COMB_is_fill_pixel0;
     is_fill_pixel1 <= REG_COMB_is_fill_pixel1;
     pixel_counter <= REG_COMB_pixel_counter;
     tmp16 <= REG_COMB_tmp16;
     is_caught_up <= REG_COMB_is_caught_up;
     is_read_ready <= REG_COMB_is_read_ready;
 end if;
 end if;
end process;

end arch;
