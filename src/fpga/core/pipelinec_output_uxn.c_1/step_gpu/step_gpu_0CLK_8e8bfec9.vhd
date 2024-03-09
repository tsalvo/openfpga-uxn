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
-- Submodules: 95
entity step_gpu_0CLK_8e8bfec9 is
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
end step_gpu_0CLK_8e8bfec9;
architecture arch of step_gpu_0CLK_8e8bfec9 is
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
signal queue_read_ptr : unsigned(11 downto 0) := to_unsigned(0, 12);
signal queue_write_ptr : unsigned(11 downto 0) := to_unsigned(0, 12);
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
signal is_fill_pixel0 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_fill_pixel1 : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pixel_counter : unsigned(16 downto 0) := to_unsigned(0, 17);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_caught_up : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_read_ready : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_result : gpu_step_result_t;
signal REG_COMB_queue_read_ptr : unsigned(11 downto 0);
signal REG_COMB_queue_write_ptr : unsigned(11 downto 0);
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
signal REG_COMB_is_fill_pixel0 : unsigned(0 downto 0);
signal REG_COMB_is_fill_pixel1 : unsigned(0 downto 0);
signal REG_COMB_pixel_counter : unsigned(16 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_is_caught_up : unsigned(0 downto 0);
signal REG_COMB_is_read_ready : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_XOR[uxn_c_l157_c2_6169]
signal BIN_OP_XOR_uxn_c_l157_c2_6169_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_6169_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_6169_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_ed39]
signal BIN_OP_EQ_uxn_c_l158_c17_ed39_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_ed39_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_11aa]
signal MUX_uxn_c_l158_c17_11aa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_11aa_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_11aa_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_11aa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_daa4]
signal BIN_OP_EQ_uxn_c_l159_c18_daa4_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_daa4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_fc28]
signal MUX_uxn_c_l159_c18_fc28_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc28_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc28_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc28_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_8271]
signal UNARY_OP_NOT_uxn_c_l161_c7_8271_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_6bf2]
signal UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_8fa8]
signal BIN_OP_AND_uxn_c_l161_c7_8fa8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_8fa8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_9d56]
signal BIN_OP_AND_uxn_c_l161_c7_9d56_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_9d56_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_9d56_return_output : unsigned(0 downto 0);

-- queue_phase_MUX[uxn_c_l161_c2_1ff3]
signal queue_phase_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output : unsigned(1 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_1ff3]
signal current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output : draw_command_t;

-- queue_read_ptr_MUX[uxn_c_l161_c2_1ff3]
signal queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue : unsigned(11 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse : unsigned(11 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_b60b]
signal BIN_OP_PLUS_uxn_c_l170_c3_b60b_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_b60b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output : unsigned(12 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_b36b]
signal queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(11 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(11 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(11 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_b36b]
signal queue_phase_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(1 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_b36b]
signal queue_write_value_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_ca0a]
signal BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_ac4f]
signal BIN_OP_EQ_uxn_c_l182_c16_ac4f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_ac4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_75cc]
signal BIN_OP_PLUS_uxn_c_l182_c39_75cc_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_75cc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_55df]
signal MUX_uxn_c_l182_c16_55df_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_55df_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_55df_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_55df_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_94b7]
signal BIN_OP_AND_uxn_c_l184_c6_94b7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_94b7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_94b7_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l184_c66_8e79]
signal UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_98a0]
signal BIN_OP_AND_uxn_c_l184_c6_98a0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_98a0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_98a0_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l184_c2_b1c8]
signal fill_layer_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l184_c2_b1c8]
signal fill_y1_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l184_c2_b1c8]
signal is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l184_c2_b1c8]
signal x_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l184_c2_b1c8]
signal fill_x0_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l184_c2_b1c8]
signal fill_y0_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l184_c2_b1c8]
signal is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l184_c2_b1c8]
signal fill_color_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(1 downto 0);

-- is_fill_active_MUX[uxn_c_l184_c2_b1c8]
signal is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l184_c2_b1c8]
signal y_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l184_c2_b1c8]
signal fill_x1_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l188_c13_0a1f]
signal MUX_uxn_c_l188_c13_0a1f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_0a1f_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_0a1f_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_0a1f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c28_1c59]
signal BIN_OP_AND_uxn_c_l189_c28_1c59_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_1c59_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_1c59_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l189_c13_eb76]
signal MUX_uxn_c_l189_c13_eb76_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_eb76_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_eb76_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_eb76_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l190_c13_8632]
signal MUX_uxn_c_l190_c13_8632_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_8632_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_8632_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_8632_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c32_cabd]
signal BIN_OP_AND_uxn_c_l191_c32_cabd_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_cabd_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_cabd_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l191_c13_8673]
signal MUX_uxn_c_l191_c13_8673_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_8673_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_8673_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_8673_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l200_c57_fcee]
signal BIN_OP_AND_uxn_c_l200_c57_fcee_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c57_fcee_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c57_fcee_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_c_l201_c47_a5d7]
signal CONST_SL_8_uxn_c_l201_c47_a5d7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l201_c47_a5d7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l201_c47_6925]
signal BIN_OP_PLUS_uxn_c_l201_c47_6925_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c47_6925_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l201_c28_475d]
signal MUX_uxn_c_l201_c28_475d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c28_475d_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c28_475d_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c28_475d_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l202_c68_a056]
signal UNARY_OP_NOT_uxn_c_l202_c68_a056_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l202_c68_02e7]
signal BIN_OP_AND_uxn_c_l202_c68_02e7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c68_02e7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c68_02e7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l204_c21_c7cf]
signal BIN_OP_EQ_uxn_c_l204_c21_c7cf_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c21_c7cf_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l204_c21_f309]
signal MUX_uxn_c_l204_c21_f309_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c21_f309_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c21_f309_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c21_f309_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l205_c22_c33e]
signal BIN_OP_EQ_uxn_c_l205_c22_c33e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l205_c22_c33e_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l205_c22_cbd0]
signal MUX_uxn_c_l205_c22_cbd0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c22_cbd0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c22_cbd0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c22_cbd0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l206_c25_76bc]
signal BIN_OP_PLUS_uxn_c_l206_c25_76bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c25_76bc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l206_c6_68e8]
signal MUX_uxn_c_l206_c6_68e8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l206_c6_68e8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_68e8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_68e8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l207_c34_dd1d]
signal BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l207_c6_0024]
signal MUX_uxn_c_l207_c6_0024_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l207_c6_0024_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l207_c6_0024_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l207_c6_0024_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l209_c38_f9fc]
signal UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l209_c19_9a2b]
signal BIN_OP_AND_uxn_c_l209_c19_9a2b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c19_9a2b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l210_c19_8a0f]
signal BIN_OP_AND_uxn_c_l210_c19_8a0f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l210_c19_8a0f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l215_c3_a449]
signal MUX_uxn_c_l215_c3_a449_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l215_c3_a449_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l215_c3_a449_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l215_c3_a449_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l216_c71_1b12]
signal UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l216_c22_8426]
signal BIN_OP_AND_uxn_c_l216_c22_8426_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l216_c22_8426_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l216_c22_8426_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l216_c3_95ec]
signal BIN_OP_OR_uxn_c_l216_c3_95ec_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l216_c3_95ec_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l216_c3_95ec_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l212_c19_0536]
signal bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l212_c19_0536_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l212_c19_0536_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l212_c19_0536_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l212_c19_0536_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l212_c19_0536_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l222_c3_138a]
signal MUX_uxn_c_l222_c3_138a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c3_138a_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l222_c3_138a_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l222_c3_138a_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l223_c22_0205]
signal BIN_OP_AND_uxn_c_l223_c22_0205_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l223_c22_0205_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l223_c22_0205_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l223_c3_1fed]
signal BIN_OP_OR_uxn_c_l223_c3_1fed_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l223_c3_1fed_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l223_c3_1fed_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l219_c19_a4a7]
signal fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l219_c19_a4a7_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l219_c19_a4a7_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l219_c19_a4a7_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l219_c19_a4a7_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l219_c19_a4a7_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l226_c21_35ce]
signal draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l226_c21_35ce_read_address : unsigned(11 downto 0);
signal draw_queue_update_uxn_c_l226_c21_35ce_write_address : unsigned(11 downto 0);
signal draw_queue_update_uxn_c_l226_c21_35ce_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l226_c21_35ce_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l226_c21_35ce_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l233_c38_5994]
signal BIN_OP_AND_uxn_c_l233_c38_5994_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l233_c38_5994_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l233_c38_5994_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l233_c38_1991]
signal UNARY_OP_NOT_uxn_c_l233_c38_1991_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l233_c19_f15d]
signal MUX_uxn_c_l233_c19_f15d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l233_c19_f15d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l233_c19_f15d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l233_c19_f15d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l235_c19_86b7]
signal BIN_OP_EQ_uxn_c_l235_c19_86b7_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c19_86b7_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l235_c76_2754]
signal BIN_OP_PLUS_uxn_c_l235_c76_2754_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_c_l235_c76_2754_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l235_c50_63ea]
signal MUX_uxn_c_l235_c50_63ea_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c50_63ea_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l235_c50_63ea_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l235_c50_63ea_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l235_c19_4d2e]
signal MUX_uxn_c_l235_c19_4d2e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c19_4d2e_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l235_c19_4d2e_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l235_c19_4d2e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c25_ea94]
signal BIN_OP_EQ_uxn_c_l236_c25_ea94_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c25_ea94_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l236_c25_2e3e]
signal MUX_uxn_c_l236_c25_2e3e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c25_2e3e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c25_2e3e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c25_2e3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c17_34c2]
signal BIN_OP_EQ_uxn_c_l237_c17_34c2_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c17_34c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l237_c17_e1a4]
signal MUX_uxn_c_l237_c17_e1a4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l237_c17_e1a4_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l237_c17_e1a4_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l237_c17_e1a4_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30
signal UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l157_c2_6169
BIN_OP_XOR_uxn_c_l157_c2_6169 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_6169_left,
BIN_OP_XOR_uxn_c_l157_c2_6169_right,
BIN_OP_XOR_uxn_c_l157_c2_6169_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_ed39
BIN_OP_EQ_uxn_c_l158_c17_ed39 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_ed39_left,
BIN_OP_EQ_uxn_c_l158_c17_ed39_right,
BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output);

-- MUX_uxn_c_l158_c17_11aa
MUX_uxn_c_l158_c17_11aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_11aa_cond,
MUX_uxn_c_l158_c17_11aa_iftrue,
MUX_uxn_c_l158_c17_11aa_iffalse,
MUX_uxn_c_l158_c17_11aa_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_daa4
BIN_OP_EQ_uxn_c_l159_c18_daa4 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_daa4_left,
BIN_OP_EQ_uxn_c_l159_c18_daa4_right,
BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output);

-- MUX_uxn_c_l159_c18_fc28
MUX_uxn_c_l159_c18_fc28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_fc28_cond,
MUX_uxn_c_l159_c18_fc28_iftrue,
MUX_uxn_c_l159_c18_fc28_iffalse,
MUX_uxn_c_l159_c18_fc28_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_8271
UNARY_OP_NOT_uxn_c_l161_c7_8271 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_8271_expr,
UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_6bf2
UNARY_OP_NOT_uxn_c_l161_c38_6bf2 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr,
UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_8fa8
BIN_OP_AND_uxn_c_l161_c7_8fa8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_8fa8_left,
BIN_OP_AND_uxn_c_l161_c7_8fa8_right,
BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_9d56
BIN_OP_AND_uxn_c_l161_c7_9d56 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_9d56_left,
BIN_OP_AND_uxn_c_l161_c7_9d56_right,
BIN_OP_AND_uxn_c_l161_c7_9d56_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_1ff3
queue_phase_MUX_uxn_c_l161_c2_1ff3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_1ff3_cond,
queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue,
queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse,
queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_1ff3
current_queue_item_MUX_uxn_c_l161_c2_1ff3 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond,
current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_1ff3
queue_read_ptr_MUX_uxn_c_l161_c2_1ff3 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_b60b
BIN_OP_PLUS_uxn_c_l170_c3_b60b : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_b60b_left,
BIN_OP_PLUS_uxn_c_l170_c3_b60b_right,
BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_b36b
queue_write_ptr_MUX_uxn_c_l173_c2_b36b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_b36b
queue_phase_MUX_uxn_c_l173_c2_b36b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_b36b_cond,
queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue,
queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse,
queue_phase_MUX_uxn_c_l173_c2_b36b_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_b36b
queue_write_value_MUX_uxn_c_l173_c2_b36b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_b36b_cond,
queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_ca0a
BIN_OP_PLUS_uxn_c_l178_c3_ca0a : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left,
BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right,
BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_ac4f
BIN_OP_EQ_uxn_c_l182_c16_ac4f : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_ac4f_left,
BIN_OP_EQ_uxn_c_l182_c16_ac4f_right,
BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_75cc
BIN_OP_PLUS_uxn_c_l182_c39_75cc : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_75cc_left,
BIN_OP_PLUS_uxn_c_l182_c39_75cc_right,
BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output);

-- MUX_uxn_c_l182_c16_55df
MUX_uxn_c_l182_c16_55df : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_55df_cond,
MUX_uxn_c_l182_c16_55df_iftrue,
MUX_uxn_c_l182_c16_55df_iffalse,
MUX_uxn_c_l182_c16_55df_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_94b7
BIN_OP_AND_uxn_c_l184_c6_94b7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_94b7_left,
BIN_OP_AND_uxn_c_l184_c6_94b7_right,
BIN_OP_AND_uxn_c_l184_c6_94b7_return_output);

-- UNARY_OP_NOT_uxn_c_l184_c66_8e79
UNARY_OP_NOT_uxn_c_l184_c66_8e79 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr,
UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_98a0
BIN_OP_AND_uxn_c_l184_c6_98a0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_98a0_left,
BIN_OP_AND_uxn_c_l184_c6_98a0_right,
BIN_OP_AND_uxn_c_l184_c6_98a0_return_output);

-- fill_layer_MUX_uxn_c_l184_c2_b1c8
fill_layer_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l184_c2_b1c8_cond,
fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output);

-- fill_y1_MUX_uxn_c_l184_c2_b1c8
fill_y1_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l184_c2_b1c8_cond,
fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output);

-- is_fill_left_MUX_uxn_c_l184_c2_b1c8
is_fill_left_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond,
is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue,
is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse,
is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output);

-- x_MUX_uxn_c_l184_c2_b1c8
x_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l184_c2_b1c8_cond,
x_MUX_uxn_c_l184_c2_b1c8_iftrue,
x_MUX_uxn_c_l184_c2_b1c8_iffalse,
x_MUX_uxn_c_l184_c2_b1c8_return_output);

-- fill_x0_MUX_uxn_c_l184_c2_b1c8
fill_x0_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l184_c2_b1c8_cond,
fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output);

-- fill_y0_MUX_uxn_c_l184_c2_b1c8
fill_y0_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l184_c2_b1c8_cond,
fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output);

-- is_fill_top_MUX_uxn_c_l184_c2_b1c8
is_fill_top_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond,
is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue,
is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse,
is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output);

-- fill_color_MUX_uxn_c_l184_c2_b1c8
fill_color_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l184_c2_b1c8_cond,
fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_color_MUX_uxn_c_l184_c2_b1c8_return_output);

-- is_fill_active_MUX_uxn_c_l184_c2_b1c8
is_fill_active_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond,
is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue,
is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse,
is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output);

-- y_MUX_uxn_c_l184_c2_b1c8
y_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l184_c2_b1c8_cond,
y_MUX_uxn_c_l184_c2_b1c8_iftrue,
y_MUX_uxn_c_l184_c2_b1c8_iffalse,
y_MUX_uxn_c_l184_c2_b1c8_return_output);

-- fill_x1_MUX_uxn_c_l184_c2_b1c8
fill_x1_MUX_uxn_c_l184_c2_b1c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l184_c2_b1c8_cond,
fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue,
fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse,
fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output);

-- MUX_uxn_c_l188_c13_0a1f
MUX_uxn_c_l188_c13_0a1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_0a1f_cond,
MUX_uxn_c_l188_c13_0a1f_iftrue,
MUX_uxn_c_l188_c13_0a1f_iffalse,
MUX_uxn_c_l188_c13_0a1f_return_output);

-- BIN_OP_AND_uxn_c_l189_c28_1c59
BIN_OP_AND_uxn_c_l189_c28_1c59 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c28_1c59_left,
BIN_OP_AND_uxn_c_l189_c28_1c59_right,
BIN_OP_AND_uxn_c_l189_c28_1c59_return_output);

-- MUX_uxn_c_l189_c13_eb76
MUX_uxn_c_l189_c13_eb76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_eb76_cond,
MUX_uxn_c_l189_c13_eb76_iftrue,
MUX_uxn_c_l189_c13_eb76_iffalse,
MUX_uxn_c_l189_c13_eb76_return_output);

-- MUX_uxn_c_l190_c13_8632
MUX_uxn_c_l190_c13_8632 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_8632_cond,
MUX_uxn_c_l190_c13_8632_iftrue,
MUX_uxn_c_l190_c13_8632_iffalse,
MUX_uxn_c_l190_c13_8632_return_output);

-- BIN_OP_AND_uxn_c_l191_c32_cabd
BIN_OP_AND_uxn_c_l191_c32_cabd : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c32_cabd_left,
BIN_OP_AND_uxn_c_l191_c32_cabd_right,
BIN_OP_AND_uxn_c_l191_c32_cabd_return_output);

-- MUX_uxn_c_l191_c13_8673
MUX_uxn_c_l191_c13_8673 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_8673_cond,
MUX_uxn_c_l191_c13_8673_iftrue,
MUX_uxn_c_l191_c13_8673_iffalse,
MUX_uxn_c_l191_c13_8673_return_output);

-- BIN_OP_AND_uxn_c_l200_c57_fcee
BIN_OP_AND_uxn_c_l200_c57_fcee : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l200_c57_fcee_left,
BIN_OP_AND_uxn_c_l200_c57_fcee_right,
BIN_OP_AND_uxn_c_l200_c57_fcee_return_output);

-- CONST_SL_8_uxn_c_l201_c47_a5d7
CONST_SL_8_uxn_c_l201_c47_a5d7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l201_c47_a5d7_x,
CONST_SL_8_uxn_c_l201_c47_a5d7_return_output);

-- BIN_OP_PLUS_uxn_c_l201_c47_6925
BIN_OP_PLUS_uxn_c_l201_c47_6925 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l201_c47_6925_left,
BIN_OP_PLUS_uxn_c_l201_c47_6925_right,
BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output);

-- MUX_uxn_c_l201_c28_475d
MUX_uxn_c_l201_c28_475d : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c28_475d_cond,
MUX_uxn_c_l201_c28_475d_iftrue,
MUX_uxn_c_l201_c28_475d_iffalse,
MUX_uxn_c_l201_c28_475d_return_output);

-- UNARY_OP_NOT_uxn_c_l202_c68_a056
UNARY_OP_NOT_uxn_c_l202_c68_a056 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l202_c68_a056_expr,
UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output);

-- BIN_OP_AND_uxn_c_l202_c68_02e7
BIN_OP_AND_uxn_c_l202_c68_02e7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c68_02e7_left,
BIN_OP_AND_uxn_c_l202_c68_02e7_right,
BIN_OP_AND_uxn_c_l202_c68_02e7_return_output);

-- BIN_OP_EQ_uxn_c_l204_c21_c7cf
BIN_OP_EQ_uxn_c_l204_c21_c7cf : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l204_c21_c7cf_left,
BIN_OP_EQ_uxn_c_l204_c21_c7cf_right,
BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output);

-- MUX_uxn_c_l204_c21_f309
MUX_uxn_c_l204_c21_f309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l204_c21_f309_cond,
MUX_uxn_c_l204_c21_f309_iftrue,
MUX_uxn_c_l204_c21_f309_iffalse,
MUX_uxn_c_l204_c21_f309_return_output);

-- BIN_OP_EQ_uxn_c_l205_c22_c33e
BIN_OP_EQ_uxn_c_l205_c22_c33e : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l205_c22_c33e_left,
BIN_OP_EQ_uxn_c_l205_c22_c33e_right,
BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output);

-- MUX_uxn_c_l205_c22_cbd0
MUX_uxn_c_l205_c22_cbd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l205_c22_cbd0_cond,
MUX_uxn_c_l205_c22_cbd0_iftrue,
MUX_uxn_c_l205_c22_cbd0_iffalse,
MUX_uxn_c_l205_c22_cbd0_return_output);

-- BIN_OP_PLUS_uxn_c_l206_c25_76bc
BIN_OP_PLUS_uxn_c_l206_c25_76bc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l206_c25_76bc_left,
BIN_OP_PLUS_uxn_c_l206_c25_76bc_right,
BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output);

-- MUX_uxn_c_l206_c6_68e8
MUX_uxn_c_l206_c6_68e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l206_c6_68e8_cond,
MUX_uxn_c_l206_c6_68e8_iftrue,
MUX_uxn_c_l206_c6_68e8_iffalse,
MUX_uxn_c_l206_c6_68e8_return_output);

-- BIN_OP_PLUS_uxn_c_l207_c34_dd1d
BIN_OP_PLUS_uxn_c_l207_c34_dd1d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left,
BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right,
BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output);

-- MUX_uxn_c_l207_c6_0024
MUX_uxn_c_l207_c6_0024 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l207_c6_0024_cond,
MUX_uxn_c_l207_c6_0024_iftrue,
MUX_uxn_c_l207_c6_0024_iffalse,
MUX_uxn_c_l207_c6_0024_return_output);

-- UNARY_OP_NOT_uxn_c_l209_c38_f9fc
UNARY_OP_NOT_uxn_c_l209_c38_f9fc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr,
UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output);

-- BIN_OP_AND_uxn_c_l209_c19_9a2b
BIN_OP_AND_uxn_c_l209_c19_9a2b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c19_9a2b_left,
BIN_OP_AND_uxn_c_l209_c19_9a2b_right,
BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output);

-- BIN_OP_AND_uxn_c_l210_c19_8a0f
BIN_OP_AND_uxn_c_l210_c19_8a0f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l210_c19_8a0f_left,
BIN_OP_AND_uxn_c_l210_c19_8a0f_right,
BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output);

-- MUX_uxn_c_l215_c3_a449
MUX_uxn_c_l215_c3_a449 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l215_c3_a449_cond,
MUX_uxn_c_l215_c3_a449_iftrue,
MUX_uxn_c_l215_c3_a449_iffalse,
MUX_uxn_c_l215_c3_a449_return_output);

-- UNARY_OP_NOT_uxn_c_l216_c71_1b12
UNARY_OP_NOT_uxn_c_l216_c71_1b12 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr,
UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output);

-- BIN_OP_AND_uxn_c_l216_c22_8426
BIN_OP_AND_uxn_c_l216_c22_8426 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l216_c22_8426_left,
BIN_OP_AND_uxn_c_l216_c22_8426_right,
BIN_OP_AND_uxn_c_l216_c22_8426_return_output);

-- BIN_OP_OR_uxn_c_l216_c3_95ec
BIN_OP_OR_uxn_c_l216_c3_95ec : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l216_c3_95ec_left,
BIN_OP_OR_uxn_c_l216_c3_95ec_right,
BIN_OP_OR_uxn_c_l216_c3_95ec_return_output);

-- bg_vram_update_uxn_c_l212_c19_0536
bg_vram_update_uxn_c_l212_c19_0536 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE,
bg_vram_update_uxn_c_l212_c19_0536_read_address,
bg_vram_update_uxn_c_l212_c19_0536_write_address,
bg_vram_update_uxn_c_l212_c19_0536_write_value,
bg_vram_update_uxn_c_l212_c19_0536_write_enable,
bg_vram_update_uxn_c_l212_c19_0536_return_output);

-- MUX_uxn_c_l222_c3_138a
MUX_uxn_c_l222_c3_138a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l222_c3_138a_cond,
MUX_uxn_c_l222_c3_138a_iftrue,
MUX_uxn_c_l222_c3_138a_iffalse,
MUX_uxn_c_l222_c3_138a_return_output);

-- BIN_OP_AND_uxn_c_l223_c22_0205
BIN_OP_AND_uxn_c_l223_c22_0205 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l223_c22_0205_left,
BIN_OP_AND_uxn_c_l223_c22_0205_right,
BIN_OP_AND_uxn_c_l223_c22_0205_return_output);

-- BIN_OP_OR_uxn_c_l223_c3_1fed
BIN_OP_OR_uxn_c_l223_c3_1fed : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l223_c3_1fed_left,
BIN_OP_OR_uxn_c_l223_c3_1fed_right,
BIN_OP_OR_uxn_c_l223_c3_1fed_return_output);

-- fg_vram_update_uxn_c_l219_c19_a4a7
fg_vram_update_uxn_c_l219_c19_a4a7 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE,
fg_vram_update_uxn_c_l219_c19_a4a7_read_address,
fg_vram_update_uxn_c_l219_c19_a4a7_write_address,
fg_vram_update_uxn_c_l219_c19_a4a7_write_value,
fg_vram_update_uxn_c_l219_c19_a4a7_write_enable,
fg_vram_update_uxn_c_l219_c19_a4a7_return_output);

-- draw_queue_update_uxn_c_l226_c21_35ce
draw_queue_update_uxn_c_l226_c21_35ce : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE,
draw_queue_update_uxn_c_l226_c21_35ce_read_address,
draw_queue_update_uxn_c_l226_c21_35ce_write_address,
draw_queue_update_uxn_c_l226_c21_35ce_write_value,
draw_queue_update_uxn_c_l226_c21_35ce_write_enable,
draw_queue_update_uxn_c_l226_c21_35ce_return_output);

-- BIN_OP_AND_uxn_c_l233_c38_5994
BIN_OP_AND_uxn_c_l233_c38_5994 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l233_c38_5994_left,
BIN_OP_AND_uxn_c_l233_c38_5994_right,
BIN_OP_AND_uxn_c_l233_c38_5994_return_output);

-- UNARY_OP_NOT_uxn_c_l233_c38_1991
UNARY_OP_NOT_uxn_c_l233_c38_1991 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l233_c38_1991_expr,
UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output);

-- MUX_uxn_c_l233_c19_f15d
MUX_uxn_c_l233_c19_f15d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l233_c19_f15d_cond,
MUX_uxn_c_l233_c19_f15d_iftrue,
MUX_uxn_c_l233_c19_f15d_iffalse,
MUX_uxn_c_l233_c19_f15d_return_output);

-- BIN_OP_EQ_uxn_c_l235_c19_86b7
BIN_OP_EQ_uxn_c_l235_c19_86b7 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l235_c19_86b7_left,
BIN_OP_EQ_uxn_c_l235_c19_86b7_right,
BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output);

-- BIN_OP_PLUS_uxn_c_l235_c76_2754
BIN_OP_PLUS_uxn_c_l235_c76_2754 : entity work.BIN_OP_PLUS_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l235_c76_2754_left,
BIN_OP_PLUS_uxn_c_l235_c76_2754_right,
BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output);

-- MUX_uxn_c_l235_c50_63ea
MUX_uxn_c_l235_c50_63ea : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l235_c50_63ea_cond,
MUX_uxn_c_l235_c50_63ea_iftrue,
MUX_uxn_c_l235_c50_63ea_iffalse,
MUX_uxn_c_l235_c50_63ea_return_output);

-- MUX_uxn_c_l235_c19_4d2e
MUX_uxn_c_l235_c19_4d2e : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l235_c19_4d2e_cond,
MUX_uxn_c_l235_c19_4d2e_iftrue,
MUX_uxn_c_l235_c19_4d2e_iffalse,
MUX_uxn_c_l235_c19_4d2e_return_output);

-- BIN_OP_EQ_uxn_c_l236_c25_ea94
BIN_OP_EQ_uxn_c_l236_c25_ea94 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c25_ea94_left,
BIN_OP_EQ_uxn_c_l236_c25_ea94_right,
BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output);

-- MUX_uxn_c_l236_c25_2e3e
MUX_uxn_c_l236_c25_2e3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l236_c25_2e3e_cond,
MUX_uxn_c_l236_c25_2e3e_iftrue,
MUX_uxn_c_l236_c25_2e3e_iffalse,
MUX_uxn_c_l236_c25_2e3e_return_output);

-- BIN_OP_EQ_uxn_c_l237_c17_34c2
BIN_OP_EQ_uxn_c_l237_c17_34c2 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c17_34c2_left,
BIN_OP_EQ_uxn_c_l237_c17_34c2_right,
BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output);

-- MUX_uxn_c_l237_c17_e1a4
MUX_uxn_c_l237_c17_e1a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l237_c17_e1a4_cond,
MUX_uxn_c_l237_c17_e1a4_iftrue,
MUX_uxn_c_l237_c17_e1a4_iffalse,
MUX_uxn_c_l237_c17_e1a4_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x,
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30
UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output);



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
 x,
 y,
 is_caught_up,
 is_read_ready,
 -- All submodule outputs
 BIN_OP_XOR_uxn_c_l157_c2_6169_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output,
 MUX_uxn_c_l158_c17_11aa_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output,
 MUX_uxn_c_l159_c18_fc28_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output,
 BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output,
 BIN_OP_AND_uxn_c_l161_c7_9d56_return_output,
 queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output,
 queue_phase_MUX_uxn_c_l173_c2_b36b_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output,
 MUX_uxn_c_l182_c16_55df_return_output,
 BIN_OP_AND_uxn_c_l184_c6_94b7_return_output,
 UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output,
 BIN_OP_AND_uxn_c_l184_c6_98a0_return_output,
 fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output,
 fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output,
 is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output,
 x_MUX_uxn_c_l184_c2_b1c8_return_output,
 fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output,
 fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output,
 is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output,
 fill_color_MUX_uxn_c_l184_c2_b1c8_return_output,
 is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output,
 y_MUX_uxn_c_l184_c2_b1c8_return_output,
 fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output,
 MUX_uxn_c_l188_c13_0a1f_return_output,
 BIN_OP_AND_uxn_c_l189_c28_1c59_return_output,
 MUX_uxn_c_l189_c13_eb76_return_output,
 MUX_uxn_c_l190_c13_8632_return_output,
 BIN_OP_AND_uxn_c_l191_c32_cabd_return_output,
 MUX_uxn_c_l191_c13_8673_return_output,
 BIN_OP_AND_uxn_c_l200_c57_fcee_return_output,
 CONST_SL_8_uxn_c_l201_c47_a5d7_return_output,
 BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output,
 MUX_uxn_c_l201_c28_475d_return_output,
 UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output,
 BIN_OP_AND_uxn_c_l202_c68_02e7_return_output,
 BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output,
 MUX_uxn_c_l204_c21_f309_return_output,
 BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output,
 MUX_uxn_c_l205_c22_cbd0_return_output,
 BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output,
 MUX_uxn_c_l206_c6_68e8_return_output,
 BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output,
 MUX_uxn_c_l207_c6_0024_return_output,
 UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output,
 BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output,
 BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output,
 MUX_uxn_c_l215_c3_a449_return_output,
 UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output,
 BIN_OP_AND_uxn_c_l216_c22_8426_return_output,
 BIN_OP_OR_uxn_c_l216_c3_95ec_return_output,
 bg_vram_update_uxn_c_l212_c19_0536_return_output,
 MUX_uxn_c_l222_c3_138a_return_output,
 BIN_OP_AND_uxn_c_l223_c22_0205_return_output,
 BIN_OP_OR_uxn_c_l223_c3_1fed_return_output,
 fg_vram_update_uxn_c_l219_c19_a4a7_return_output,
 draw_queue_update_uxn_c_l226_c21_35ce_return_output,
 BIN_OP_AND_uxn_c_l233_c38_5994_return_output,
 UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output,
 MUX_uxn_c_l233_c19_f15d_return_output,
 BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output,
 BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output,
 MUX_uxn_c_l235_c50_63ea_return_output,
 MUX_uxn_c_l235_c19_4d2e_return_output,
 BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output,
 MUX_uxn_c_l236_c25_2e3e_return_output,
 BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output,
 MUX_uxn_c_l237_c17_e1a4_return_output,
 CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_11aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_11aa_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_11aa_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_11aa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc28_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc28_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_3d4a_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_return_output : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_b2cd : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_1ff3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue : unsigned(11 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_e7c8 : unsigned(11 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse : unsigned(11 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output : unsigned(11 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_3e35_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_ee4a_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_b61b_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_d195_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_a616_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_4a80_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(11 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_2b78 : unsigned(11 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(11 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(11 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_22cd : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l176_c3_07a9 : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l174_c3_4b7a : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l174_c23_3c3a_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l175_c3_e5a8 : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l175_c23_39f9_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l176_c23_71d8_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_55df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_55df_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_55df_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_55df_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5b2a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_fbb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_dacd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_0a1f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_0a1f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_0a1f_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_0a1f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_eb76_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_eb76_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_eb76_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_eb76_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_8632_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_8632_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_8632_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_8632_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_8673_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_8673_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_8673_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_8673_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l200_c26_bd48_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c28_475d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c28_475d_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c28_475d_iffalse : unsigned(16 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c28_475d_return_output : unsigned(16 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l202_c27_fa06_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l204_c21_f309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c21_f309_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c21_f309_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c21_f309_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c22_cbd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c22_cbd0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c22_cbd0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c22_cbd0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_68e8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_68e8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_68e8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_68e8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l207_c6_0024_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l207_c6_0024_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l207_c6_0024_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l207_c6_0024_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l215_c3_a449_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l215_c3_a449_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l215_c3_a449_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l215_c3_a449_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l216_c22_8426_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l216_c22_8426_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l216_c22_8426_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l212_c19_0536_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c3_138a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c3_138a_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l222_c3_138a_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l222_c3_138a_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c22_0205_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c22_0205_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l223_c22_0205_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l219_c19_a4a7_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_read_address : unsigned(11 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_address : unsigned(11 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l226_c21_35ce_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l233_c19_f15d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l233_c19_f15d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l233_c19_f15d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c38_5994_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c38_5994_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l233_c38_5994_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l233_c19_f15d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c19_4d2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c19_4d2e_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l235_c19_4d2e_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l235_c50_63ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c50_63ea_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l235_c50_63ea_iffalse : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l235_c50_63ea_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l235_c19_4d2e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l236_c25_2e3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c25_2e3e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c25_2e3e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c25_2e3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l237_c17_e1a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l237_c17_e1a4_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l237_c17_e1a4_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l237_c17_e1a4_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_dcff_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l216_l184_l223_DUPLICATE_d908_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l239_l136_DUPLICATE_f373_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_queue_read_ptr : unsigned(11 downto 0);
variable REG_VAR_queue_write_ptr : unsigned(11 downto 0);
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
variable REG_VAR_is_fill_pixel0 : unsigned(0 downto 0);
variable REG_VAR_is_fill_pixel1 : unsigned(0 downto 0);
variable REG_VAR_pixel_counter : unsigned(16 downto 0);
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
  REG_VAR_bg_pixel_color := bg_pixel_color;
  REG_VAR_fg_pixel_color := fg_pixel_color;
  REG_VAR_is_buffer_swapped := is_buffer_swapped;
  REG_VAR_adjusted_read_address := adjusted_read_address;
  REG_VAR_adjusted_write_address := adjusted_write_address;
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
  REG_VAR_is_fill_pixel0 := is_fill_pixel0;
  REG_VAR_is_fill_pixel1 := is_fill_pixel1;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_is_caught_up := is_caught_up;
  REG_VAR_is_read_ready := is_read_ready;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_right := to_unsigned(255, 16);
     VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l159_c18_fc28_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l235_c19_4d2e_iftrue := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l158_c17_11aa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l188_c13_0a1f_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_MUX_uxn_c_l205_c22_cbd0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l204_c21_f309_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_right := to_unsigned(61439, 16);
     VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l190_c13_8632_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_right := to_unsigned(61439, 16);
     VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l159_c18_fc28_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l189_c13_eb76_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l236_c25_2e3e_iftrue := to_unsigned(1, 1);
     VAR_queue_phase_uxn_c_l169_c3_b2cd := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue := VAR_queue_phase_uxn_c_l169_c3_b2cd;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l204_c21_f309_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l205_c22_cbd0_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l191_c13_8673_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l233_c19_f15d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l158_c17_11aa_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l182_c16_55df_iftrue := to_unsigned(2, 2);
     VAR_queue_phase_uxn_c_l177_c3_22cd := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue := VAR_queue_phase_uxn_c_l177_c3_22cd;
     VAR_MUX_uxn_c_l236_c25_2e3e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse := fill_y1;
     VAR_MUX_uxn_c_l235_c50_63ea_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_left := pixel_counter;
     VAR_MUX_uxn_c_l235_c50_63ea_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l184_c2_b1c8_iffalse := x;
     VAR_y_MUX_uxn_c_l184_c2_b1c8_iffalse := y;
     -- BIN_OP_PLUS[uxn_c_l178_c3_ca0a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_left;
     BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output := BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output;

     -- uint24_20_20[uxn_c_l166_c32_a616] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_a616_return_output := uint24_20_20(
     queue_read_value);

     -- uint24_18_18[uxn_c_l164_c33_b61b] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_b61b_return_output := uint24_18_18(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l170_c3_b60b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_b60b_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_left;
     BIN_OP_PLUS_uxn_c_l170_c3_b60b_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output := BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output;

     -- uint32_uint16_0[uxn_c_l174_c23_3c3a] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l174_c23_3c3a_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- BIN_OP_EQ[uxn_c_l158_c17_ed39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_ed39_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_left;
     BIN_OP_EQ_uxn_c_l158_c17_ed39_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output := BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output;

     -- uint24_17_16[uxn_c_l163_c30_ee4a] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_ee4a_return_output := uint24_17_16(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l235_c19_86b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l235_c19_86b7_left <= VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_left;
     BIN_OP_EQ_uxn_c_l235_c19_86b7_right <= VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output := BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output;

     -- BIN_OP_PLUS[uxn_c_l235_c76_2754] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l235_c76_2754_left <= VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_left;
     BIN_OP_PLUS_uxn_c_l235_c76_2754_right <= VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output := BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output;

     -- uint24_21_21[uxn_c_l167_c30_4a80] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_4a80_return_output := uint24_21_21(
     queue_read_value);

     -- BIN_OP_XOR[uxn_c_l157_c2_6169] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_6169_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_left;
     BIN_OP_XOR_uxn_c_l157_c2_6169_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_return_output := BIN_OP_XOR_uxn_c_l157_c2_6169_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_3d4a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_3d4a_return_output := current_queue_item.is_valid;

     -- uint24_15_0[uxn_c_l162_c37_3e35] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_3e35_return_output := uint24_15_0(
     queue_read_value);

     -- UNARY_OP_NOT[uxn_c_l184_c66_8e79] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr <= VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output := UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output;

     -- BIN_OP_EQ[uxn_c_l159_c18_daa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_daa4_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_left;
     BIN_OP_EQ_uxn_c_l159_c18_daa4_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output := BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output;

     -- uint24_19_19[uxn_c_l165_c34_d195] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_d195_return_output := uint24_19_19(
     queue_read_value);

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_11aa_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_ed39_return_output;
     VAR_MUX_uxn_c_l159_c18_fc28_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_daa4_return_output;
     VAR_MUX_uxn_c_l235_c19_4d2e_cond := VAR_BIN_OP_EQ_uxn_c_l235_c19_86b7_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_e7c8 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_b60b_return_output, 12);
     VAR_queue_write_ptr_uxn_c_l178_c3_2b78 := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_ca0a_return_output, 12);
     VAR_MUX_uxn_c_l235_c50_63ea_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l235_c76_2754_return_output, 17);
     VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_6169_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_3d4a_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_right := VAR_UNARY_OP_NOT_uxn_c_l184_c66_8e79_return_output;
     VAR_queue_write_value_uxn_c_l174_c3_4b7a := resize(VAR_uint32_uint16_0_uxn_c_l174_c23_3c3a_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_e7c8;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_2b78;
     -- BIN_OP_AND[uxn_c_l200_c57_fcee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l200_c57_fcee_left <= VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_left;
     BIN_OP_AND_uxn_c_l200_c57_fcee_right <= VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_return_output := BIN_OP_AND_uxn_c_l200_c57_fcee_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c7_8271] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_8271_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output := UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output;

     -- queue_write_ptr_MUX[uxn_c_l173_c2_b36b] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output;

     -- uint32_uint5_16[uxn_c_l175_c23_39f9] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l175_c23_39f9_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l174_c3_4b7a, 32),
     resize(VAR_vram_value, 5));

     -- MUX[uxn_c_l159_c18_fc28] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_fc28_cond <= VAR_MUX_uxn_c_l159_c18_fc28_cond;
     MUX_uxn_c_l159_c18_fc28_iftrue <= VAR_MUX_uxn_c_l159_c18_fc28_iftrue;
     MUX_uxn_c_l159_c18_fc28_iffalse <= VAR_MUX_uxn_c_l159_c18_fc28_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_fc28_return_output := MUX_uxn_c_l159_c18_fc28_return_output;

     -- MUX[uxn_c_l235_c50_63ea] LATENCY=0
     -- Inputs
     MUX_uxn_c_l235_c50_63ea_cond <= VAR_MUX_uxn_c_l235_c50_63ea_cond;
     MUX_uxn_c_l235_c50_63ea_iftrue <= VAR_MUX_uxn_c_l235_c50_63ea_iftrue;
     MUX_uxn_c_l235_c50_63ea_iffalse <= VAR_MUX_uxn_c_l235_c50_63ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l235_c50_63ea_return_output := MUX_uxn_c_l235_c50_63ea_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_1ff3] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_1ff3_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_3e35_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_ee4a_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_b61b_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_d195_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_a616_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_4a80_return_output,
     to_unsigned(1, 1));

     -- UNARY_OP_NOT[uxn_c_l202_c68_a056] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l202_c68_a056_expr <= VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output := UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output;

     -- MUX[uxn_c_l158_c17_11aa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_11aa_cond <= VAR_MUX_uxn_c_l158_c17_11aa_cond;
     MUX_uxn_c_l158_c17_11aa_iftrue <= VAR_MUX_uxn_c_l158_c17_11aa_iftrue;
     MUX_uxn_c_l158_c17_11aa_iffalse <= VAR_MUX_uxn_c_l158_c17_11aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_11aa_return_output := MUX_uxn_c_l158_c17_11aa_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr := VAR_MUX_uxn_c_l158_c17_11aa_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_11aa_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_right := VAR_MUX_uxn_c_l159_c18_fc28_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_fc28_return_output;
     VAR_MUX_uxn_c_l235_c19_4d2e_iffalse := VAR_MUX_uxn_c_l235_c50_63ea_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_8271_return_output;
     VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_left := VAR_UNARY_OP_NOT_uxn_c_l202_c68_a056_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_1ff3_return_output;
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_b36b_return_output;
     VAR_queue_write_value_uxn_c_l175_c3_e5a8 := resize(VAR_uint32_uint5_16_uxn_c_l175_c23_39f9_return_output, 24);
     -- MUX[uxn_c_l235_c19_4d2e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l235_c19_4d2e_cond <= VAR_MUX_uxn_c_l235_c19_4d2e_cond;
     MUX_uxn_c_l235_c19_4d2e_iftrue <= VAR_MUX_uxn_c_l235_c19_4d2e_iftrue;
     MUX_uxn_c_l235_c19_4d2e_iffalse <= VAR_MUX_uxn_c_l235_c19_4d2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l235_c19_4d2e_return_output := MUX_uxn_c_l235_c19_4d2e_return_output;

     -- uint17_uint1_16[uxn_c_l200_c26_bd48] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l200_c26_bd48_return_output := uint17_uint1_16(
     pixel_counter,
     VAR_BIN_OP_AND_uxn_c_l200_c57_fcee_return_output);

     -- uint32_uint1_21[uxn_c_l176_c23_71d8] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l176_c23_71d8_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l175_c3_e5a8, 32),
     VAR_vram_write_layer);

     -- UNARY_OP_NOT[uxn_c_l161_c38_6bf2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output := UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output;

     -- BIN_OP_AND[uxn_c_l202_c68_02e7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c68_02e7_left <= VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_left;
     BIN_OP_AND_uxn_c_l202_c68_02e7_right <= VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_return_output := BIN_OP_AND_uxn_c_l202_c68_02e7_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_left := VAR_MUX_uxn_c_l235_c19_4d2e_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l235_c19_4d2e_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_6bf2_return_output;
     REG_VAR_adjusted_read_address := VAR_uint17_uint1_16_uxn_c_l200_c26_bd48_return_output;
     VAR_bg_vram_update_uxn_c_l212_c19_0536_read_address := VAR_uint17_uint1_16_uxn_c_l200_c26_bd48_return_output;
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_read_address := VAR_uint17_uint1_16_uxn_c_l200_c26_bd48_return_output;
     VAR_queue_write_value_uxn_c_l176_c3_07a9 := resize(VAR_uint32_uint1_21_uxn_c_l176_c23_71d8_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue := VAR_queue_write_value_uxn_c_l176_c3_07a9;
     -- BIN_OP_AND[uxn_c_l161_c7_8fa8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_8fa8_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_left;
     BIN_OP_AND_uxn_c_l161_c7_8fa8_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output := BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_b36b] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_b36b_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_cond;
     queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output := queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output;

     -- BIN_OP_EQ[uxn_c_l236_c25_ea94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c25_ea94_left <= VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_left;
     BIN_OP_EQ_uxn_c_l236_c25_ea94_right <= VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output := BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_left := VAR_BIN_OP_AND_uxn_c_l161_c7_8fa8_return_output;
     VAR_MUX_uxn_c_l236_c25_2e3e_cond := VAR_BIN_OP_EQ_uxn_c_l236_c25_ea94_return_output;
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_b36b_return_output;
     -- BIN_OP_AND[uxn_c_l161_c7_9d56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_9d56_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_left;
     BIN_OP_AND_uxn_c_l161_c7_9d56_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_return_output := BIN_OP_AND_uxn_c_l161_c7_9d56_return_output;

     -- MUX[uxn_c_l236_c25_2e3e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l236_c25_2e3e_cond <= VAR_MUX_uxn_c_l236_c25_2e3e_cond;
     MUX_uxn_c_l236_c25_2e3e_iftrue <= VAR_MUX_uxn_c_l236_c25_2e3e_iftrue;
     MUX_uxn_c_l236_c25_2e3e_iffalse <= VAR_MUX_uxn_c_l236_c25_2e3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l236_c25_2e3e_return_output := MUX_uxn_c_l236_c25_2e3e_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_9d56_return_output;
     -- current_queue_item_MUX[uxn_c_l161_c2_1ff3] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_cond;
     current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output := current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output;

     -- queue_phase_MUX[uxn_c_l161_c2_1ff3] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_1ff3_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_cond;
     queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output := queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output;

     -- queue_read_ptr_MUX[uxn_c_l161_c2_1ff3] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_1ff3_return_output;
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_1ff3_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_fbb8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_fbb8_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.fill_top;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l184_c36_5b2a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5b2a_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.is_fill;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.layer;

     -- draw_queue_update[uxn_c_l226_c21_35ce] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l226_c21_35ce_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l226_c21_35ce_read_address <= VAR_draw_queue_update_uxn_c_l226_c21_35ce_read_address;
     draw_queue_update_uxn_c_l226_c21_35ce_write_address <= VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_address;
     draw_queue_update_uxn_c_l226_c21_35ce_write_value <= VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_value;
     draw_queue_update_uxn_c_l226_c21_35ce_write_enable <= VAR_draw_queue_update_uxn_c_l226_c21_35ce_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l226_c21_35ce_return_output := draw_queue_update_uxn_c_l226_c21_35ce_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l216_l184_l223_DUPLICATE_d908 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l216_l184_l223_DUPLICATE_d908_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.is_valid;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_dacd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_dacd_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output.fill_left;

     -- queue_phase_MUX[uxn_c_l173_c2_b36b] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_b36b_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_cond;
     queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_return_output := queue_phase_MUX_uxn_c_l173_c2_b36b_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output;
     VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output;
     VAR_MUX_uxn_c_l201_c28_475d_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l190_l189_l188_l201_l191_DUPLICATE_211c_return_output, 17);
     VAR_MUX_uxn_c_l189_c13_eb76_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_dacd_return_output;
     VAR_MUX_uxn_c_l191_c13_8673_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_dacd_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_dacd_return_output;
     VAR_MUX_uxn_c_l188_c13_0a1f_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_fbb8_return_output;
     VAR_MUX_uxn_c_l190_c13_8632_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_fbb8_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_fbb8_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_5b2a_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l216_l184_l223_DUPLICATE_d908_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l216_l184_l223_DUPLICATE_d908_return_output;
     VAR_BIN_OP_AND_uxn_c_l223_c22_0205_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l192_l223_l216_DUPLICATE_19b1_return_output;
     VAR_MUX_uxn_c_l215_c3_a449_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620_return_output;
     VAR_MUX_uxn_c_l222_c3_138a_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620_return_output;
     VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l215_l193_l222_DUPLICATE_6620_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l226_c21_35ce_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_left := VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_left := VAR_queue_phase_MUX_uxn_c_l173_c2_b36b_return_output;
     -- UNARY_OP_NOT[uxn_c_l216_c71_1b12] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr <= VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output := UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output;

     -- BIN_OP_AND[uxn_c_l191_c32_cabd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c32_cabd_left <= VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_left;
     BIN_OP_AND_uxn_c_l191_c32_cabd_right <= VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_return_output := BIN_OP_AND_uxn_c_l191_c32_cabd_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c16_ac4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_ac4f_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_left;
     BIN_OP_EQ_uxn_c_l182_c16_ac4f_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output := BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c39_75cc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_75cc_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_left;
     BIN_OP_PLUS_uxn_c_l182_c39_75cc_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output := BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output := CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_94b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_94b7_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_left;
     BIN_OP_AND_uxn_c_l184_c6_94b7_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_return_output := BIN_OP_AND_uxn_c_l184_c6_94b7_return_output;

     -- BIN_OP_AND[uxn_c_l189_c28_1c59] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c28_1c59_left <= VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_left;
     BIN_OP_AND_uxn_c_l189_c28_1c59_right <= VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_return_output := BIN_OP_AND_uxn_c_l189_c28_1c59_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_left := VAR_BIN_OP_AND_uxn_c_l184_c6_94b7_return_output;
     VAR_MUX_uxn_c_l189_c13_eb76_iftrue := VAR_BIN_OP_AND_uxn_c_l189_c28_1c59_return_output;
     VAR_MUX_uxn_c_l191_c13_8673_iffalse := VAR_BIN_OP_AND_uxn_c_l191_c32_cabd_return_output;
     VAR_MUX_uxn_c_l182_c16_55df_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_ac4f_return_output;
     VAR_MUX_uxn_c_l182_c16_55df_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_75cc_return_output, 2);
     VAR_MUX_uxn_c_l188_c13_0a1f_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output;
     VAR_MUX_uxn_c_l190_c13_8632_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_7cab_return_output;
     VAR_BIN_OP_AND_uxn_c_l216_c22_8426_right := VAR_UNARY_OP_NOT_uxn_c_l216_c71_1b12_return_output;
     -- MUX[uxn_c_l190_c13_8632] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_8632_cond <= VAR_MUX_uxn_c_l190_c13_8632_cond;
     MUX_uxn_c_l190_c13_8632_iftrue <= VAR_MUX_uxn_c_l190_c13_8632_iftrue;
     MUX_uxn_c_l190_c13_8632_iffalse <= VAR_MUX_uxn_c_l190_c13_8632_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_8632_return_output := MUX_uxn_c_l190_c13_8632_return_output;

     -- MUX[uxn_c_l182_c16_55df] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_55df_cond <= VAR_MUX_uxn_c_l182_c16_55df_cond;
     MUX_uxn_c_l182_c16_55df_iftrue <= VAR_MUX_uxn_c_l182_c16_55df_iftrue;
     MUX_uxn_c_l182_c16_55df_iffalse <= VAR_MUX_uxn_c_l182_c16_55df_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_55df_return_output := MUX_uxn_c_l182_c16_55df_return_output;

     -- MUX[uxn_c_l189_c13_eb76] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_eb76_cond <= VAR_MUX_uxn_c_l189_c13_eb76_cond;
     MUX_uxn_c_l189_c13_eb76_iftrue <= VAR_MUX_uxn_c_l189_c13_eb76_iftrue;
     MUX_uxn_c_l189_c13_eb76_iffalse <= VAR_MUX_uxn_c_l189_c13_eb76_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_eb76_return_output := MUX_uxn_c_l189_c13_eb76_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_98a0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_98a0_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_left;
     BIN_OP_AND_uxn_c_l184_c6_98a0_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output := BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;

     -- MUX[uxn_c_l191_c13_8673] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_8673_cond <= VAR_MUX_uxn_c_l191_c13_8673_cond;
     MUX_uxn_c_l191_c13_8673_iftrue <= VAR_MUX_uxn_c_l191_c13_8673_iftrue;
     MUX_uxn_c_l191_c13_8673_iffalse <= VAR_MUX_uxn_c_l191_c13_8673_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_8673_return_output := MUX_uxn_c_l191_c13_8673_return_output;

     -- MUX[uxn_c_l188_c13_0a1f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_0a1f_cond <= VAR_MUX_uxn_c_l188_c13_0a1f_cond;
     MUX_uxn_c_l188_c13_0a1f_iftrue <= VAR_MUX_uxn_c_l188_c13_0a1f_iftrue;
     MUX_uxn_c_l188_c13_0a1f_iffalse <= VAR_MUX_uxn_c_l188_c13_0a1f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_0a1f_return_output := MUX_uxn_c_l188_c13_0a1f_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_x_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     VAR_y_MUX_uxn_c_l184_c2_b1c8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_98a0_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_55df_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l188_c13_0a1f_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l189_c13_eb76_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l190_c13_8632_return_output;
     VAR_y_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l190_c13_8632_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l191_c13_8673_return_output;
     VAR_x_MUX_uxn_c_l184_c2_b1c8_iftrue := VAR_MUX_uxn_c_l191_c13_8673_return_output;
     -- x_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_x_MUX_uxn_c_l184_c2_b1c8_cond;
     x_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_x_MUX_uxn_c_l184_c2_b1c8_iftrue;
     x_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_x_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l184_c2_b1c8_return_output := x_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- is_fill_left_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_cond;
     is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iftrue;
     is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output := is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_y0_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output := fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_x0_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output := fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_color_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_return_output := fill_color_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- is_fill_active_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_cond;
     is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iftrue;
     is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output := is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- is_fill_top_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_cond;
     is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iftrue;
     is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output := is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_x1_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output := fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_y1_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output := fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- fill_layer_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_cond;
     fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iftrue;
     fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output := fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- y_MUX[uxn_c_l184_c2_b1c8] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l184_c2_b1c8_cond <= VAR_y_MUX_uxn_c_l184_c2_b1c8_cond;
     y_MUX_uxn_c_l184_c2_b1c8_iftrue <= VAR_y_MUX_uxn_c_l184_c2_b1c8_iftrue;
     y_MUX_uxn_c_l184_c2_b1c8_iffalse <= VAR_y_MUX_uxn_c_l184_c2_b1c8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output := y_MUX_uxn_c_l184_c2_b1c8_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l215_c3_a449_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_MUX_uxn_c_l222_c3_138a_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_right := VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr := VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_MUX_uxn_c_l207_c6_0024_iftrue := VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_right := VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_right := VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_MUX_uxn_c_l201_c28_475d_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_MUX_uxn_c_l233_c19_f15d_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr := VAR_is_fill_active_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l184_c2_b1c8_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_left := VAR_x_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_right := VAR_x_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left := VAR_x_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_left := VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_left := VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_x := VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output;
     VAR_MUX_uxn_c_l206_c6_68e8_iffalse := VAR_y_MUX_uxn_c_l184_c2_b1c8_return_output;
     -- BIN_OP_PLUS[uxn_c_l207_c34_dd1d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left <= VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_left;
     BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right <= VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output := BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output;

     -- UNARY_OP_NOT[uxn_c_l209_c38_f9fc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr <= VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output := UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output;

     -- BIN_OP_AND[uxn_c_l210_c19_8a0f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l210_c19_8a0f_left <= VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_left;
     BIN_OP_AND_uxn_c_l210_c19_8a0f_right <= VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output := BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output;

     -- BIN_OP_EQ[uxn_c_l205_c22_c33e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l205_c22_c33e_left <= VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_left;
     BIN_OP_EQ_uxn_c_l205_c22_c33e_right <= VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output := BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output;

     -- CONST_SL_8[uxn_c_l201_c47_a5d7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l201_c47_a5d7_x <= VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_return_output := CONST_SL_8_uxn_c_l201_c47_a5d7_return_output;

     -- BIN_OP_EQ[uxn_c_l204_c21_c7cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l204_c21_c7cf_left <= VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_left;
     BIN_OP_EQ_uxn_c_l204_c21_c7cf_right <= VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output := BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output;

     -- BIN_OP_PLUS[uxn_c_l206_c25_76bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l206_c25_76bc_left <= VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_left;
     BIN_OP_PLUS_uxn_c_l206_c25_76bc_right <= VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output := BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_left := VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output;
     VAR_MUX_uxn_c_l222_c3_138a_cond := VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l210_c19_8a0f_return_output;
     VAR_MUX_uxn_c_l204_c21_f309_cond := VAR_BIN_OP_EQ_uxn_c_l204_c21_c7cf_return_output;
     VAR_MUX_uxn_c_l205_c22_cbd0_cond := VAR_BIN_OP_EQ_uxn_c_l205_c22_c33e_return_output;
     VAR_MUX_uxn_c_l206_c6_68e8_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l206_c25_76bc_return_output, 16);
     VAR_MUX_uxn_c_l207_c6_0024_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l207_c34_dd1d_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_left := VAR_CONST_SL_8_uxn_c_l201_c47_a5d7_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_right := VAR_UNARY_OP_NOT_uxn_c_l209_c38_f9fc_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l223_l216_DUPLICATE_7b30_return_output;
     -- MUX[uxn_c_l204_c21_f309] LATENCY=0
     -- Inputs
     MUX_uxn_c_l204_c21_f309_cond <= VAR_MUX_uxn_c_l204_c21_f309_cond;
     MUX_uxn_c_l204_c21_f309_iftrue <= VAR_MUX_uxn_c_l204_c21_f309_iftrue;
     MUX_uxn_c_l204_c21_f309_iffalse <= VAR_MUX_uxn_c_l204_c21_f309_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l204_c21_f309_return_output := MUX_uxn_c_l204_c21_f309_return_output;

     -- BIN_OP_PLUS[uxn_c_l201_c47_6925] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l201_c47_6925_left <= VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_left;
     BIN_OP_PLUS_uxn_c_l201_c47_6925_right <= VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output := BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output;

     -- MUX[uxn_c_l222_c3_138a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l222_c3_138a_cond <= VAR_MUX_uxn_c_l222_c3_138a_cond;
     MUX_uxn_c_l222_c3_138a_iftrue <= VAR_MUX_uxn_c_l222_c3_138a_iftrue;
     MUX_uxn_c_l222_c3_138a_iffalse <= VAR_MUX_uxn_c_l222_c3_138a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l222_c3_138a_return_output := MUX_uxn_c_l222_c3_138a_return_output;

     -- BIN_OP_AND[uxn_c_l209_c19_9a2b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c19_9a2b_left <= VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_left;
     BIN_OP_AND_uxn_c_l209_c19_9a2b_right <= VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output := BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output;

     -- MUX[uxn_c_l205_c22_cbd0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l205_c22_cbd0_cond <= VAR_MUX_uxn_c_l205_c22_cbd0_cond;
     MUX_uxn_c_l205_c22_cbd0_iftrue <= VAR_MUX_uxn_c_l205_c22_cbd0_iftrue;
     MUX_uxn_c_l205_c22_cbd0_iffalse <= VAR_MUX_uxn_c_l205_c22_cbd0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l205_c22_cbd0_return_output := MUX_uxn_c_l205_c22_cbd0_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_left := VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output;
     VAR_MUX_uxn_c_l215_c3_a449_cond := VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l209_c19_9a2b_return_output;
     VAR_BIN_OP_AND_uxn_c_l216_c22_8426_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output;
     VAR_BIN_OP_AND_uxn_c_l223_c22_0205_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l223_l216_DUPLICATE_7af9_return_output;
     VAR_MUX_uxn_c_l201_c28_475d_iftrue := VAR_BIN_OP_PLUS_uxn_c_l201_c47_6925_return_output;
     VAR_BIN_OP_AND_uxn_c_l233_c38_5994_left := VAR_MUX_uxn_c_l204_c21_f309_return_output;
     VAR_MUX_uxn_c_l206_c6_68e8_cond := VAR_MUX_uxn_c_l204_c21_f309_return_output;
     VAR_MUX_uxn_c_l207_c6_0024_cond := VAR_MUX_uxn_c_l204_c21_f309_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l204_c21_f309_return_output;
     VAR_BIN_OP_AND_uxn_c_l233_c38_5994_right := VAR_MUX_uxn_c_l205_c22_cbd0_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l205_c22_cbd0_return_output;
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_value := VAR_MUX_uxn_c_l222_c3_138a_return_output;
     -- MUX[uxn_c_l207_c6_0024] LATENCY=0
     -- Inputs
     MUX_uxn_c_l207_c6_0024_cond <= VAR_MUX_uxn_c_l207_c6_0024_cond;
     MUX_uxn_c_l207_c6_0024_iftrue <= VAR_MUX_uxn_c_l207_c6_0024_iftrue;
     MUX_uxn_c_l207_c6_0024_iffalse <= VAR_MUX_uxn_c_l207_c6_0024_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l207_c6_0024_return_output := MUX_uxn_c_l207_c6_0024_return_output;

     -- BIN_OP_AND[uxn_c_l233_c38_5994] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l233_c38_5994_left <= VAR_BIN_OP_AND_uxn_c_l233_c38_5994_left;
     BIN_OP_AND_uxn_c_l233_c38_5994_right <= VAR_BIN_OP_AND_uxn_c_l233_c38_5994_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l233_c38_5994_return_output := BIN_OP_AND_uxn_c_l233_c38_5994_return_output;

     -- BIN_OP_AND[uxn_c_l223_c22_0205] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l223_c22_0205_left <= VAR_BIN_OP_AND_uxn_c_l223_c22_0205_left;
     BIN_OP_AND_uxn_c_l223_c22_0205_right <= VAR_BIN_OP_AND_uxn_c_l223_c22_0205_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l223_c22_0205_return_output := BIN_OP_AND_uxn_c_l223_c22_0205_return_output;

     -- MUX[uxn_c_l206_c6_68e8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l206_c6_68e8_cond <= VAR_MUX_uxn_c_l206_c6_68e8_cond;
     MUX_uxn_c_l206_c6_68e8_iftrue <= VAR_MUX_uxn_c_l206_c6_68e8_iftrue;
     MUX_uxn_c_l206_c6_68e8_iffalse <= VAR_MUX_uxn_c_l206_c6_68e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l206_c6_68e8_return_output := MUX_uxn_c_l206_c6_68e8_return_output;

     -- MUX[uxn_c_l201_c28_475d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c28_475d_cond <= VAR_MUX_uxn_c_l201_c28_475d_cond;
     MUX_uxn_c_l201_c28_475d_iftrue <= VAR_MUX_uxn_c_l201_c28_475d_iftrue;
     MUX_uxn_c_l201_c28_475d_iffalse <= VAR_MUX_uxn_c_l201_c28_475d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c28_475d_return_output := MUX_uxn_c_l201_c28_475d_return_output;

     -- MUX[uxn_c_l215_c3_a449] LATENCY=0
     -- Inputs
     MUX_uxn_c_l215_c3_a449_cond <= VAR_MUX_uxn_c_l215_c3_a449_cond;
     MUX_uxn_c_l215_c3_a449_iftrue <= VAR_MUX_uxn_c_l215_c3_a449_iftrue;
     MUX_uxn_c_l215_c3_a449_iffalse <= VAR_MUX_uxn_c_l215_c3_a449_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l215_c3_a449_return_output := MUX_uxn_c_l215_c3_a449_return_output;

     -- BIN_OP_AND[uxn_c_l216_c22_8426] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l216_c22_8426_left <= VAR_BIN_OP_AND_uxn_c_l216_c22_8426_left;
     BIN_OP_AND_uxn_c_l216_c22_8426_right <= VAR_BIN_OP_AND_uxn_c_l216_c22_8426_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l216_c22_8426_return_output := BIN_OP_AND_uxn_c_l216_c22_8426_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_right := VAR_BIN_OP_AND_uxn_c_l216_c22_8426_return_output;
     VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_right := VAR_BIN_OP_AND_uxn_c_l223_c22_0205_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_expr := VAR_BIN_OP_AND_uxn_c_l233_c38_5994_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l206_c6_68e8_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l207_c6_0024_return_output;
     VAR_bg_vram_update_uxn_c_l212_c19_0536_write_value := VAR_MUX_uxn_c_l215_c3_a449_return_output;
     -- uint17_uint1_16[uxn_c_l202_c27_fa06] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l202_c27_fa06_return_output := uint17_uint1_16(
     VAR_MUX_uxn_c_l201_c28_475d_return_output,
     VAR_BIN_OP_AND_uxn_c_l202_c68_02e7_return_output);

     -- BIN_OP_OR[uxn_c_l216_c3_95ec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l216_c3_95ec_left <= VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_left;
     BIN_OP_OR_uxn_c_l216_c3_95ec_right <= VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_return_output := BIN_OP_OR_uxn_c_l216_c3_95ec_return_output;

     -- BIN_OP_OR[uxn_c_l223_c3_1fed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l223_c3_1fed_left <= VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_left;
     BIN_OP_OR_uxn_c_l223_c3_1fed_right <= VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_return_output := BIN_OP_OR_uxn_c_l223_c3_1fed_return_output;

     -- UNARY_OP_NOT[uxn_c_l233_c38_1991] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l233_c38_1991_expr <= VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output := UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l212_c19_0536_write_enable := VAR_BIN_OP_OR_uxn_c_l216_c3_95ec_return_output;
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_enable := VAR_BIN_OP_OR_uxn_c_l223_c3_1fed_return_output;
     VAR_MUX_uxn_c_l233_c19_f15d_iftrue := VAR_UNARY_OP_NOT_uxn_c_l233_c38_1991_return_output;
     REG_VAR_adjusted_write_address := VAR_uint17_uint1_16_uxn_c_l202_c27_fa06_return_output;
     VAR_bg_vram_update_uxn_c_l212_c19_0536_write_address := VAR_uint17_uint1_16_uxn_c_l202_c27_fa06_return_output;
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_address := VAR_uint17_uint1_16_uxn_c_l202_c27_fa06_return_output;
     -- fg_vram_update[uxn_c_l219_c19_a4a7] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l219_c19_a4a7_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l219_c19_a4a7_read_address <= VAR_fg_vram_update_uxn_c_l219_c19_a4a7_read_address;
     fg_vram_update_uxn_c_l219_c19_a4a7_write_address <= VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_address;
     fg_vram_update_uxn_c_l219_c19_a4a7_write_value <= VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_value;
     fg_vram_update_uxn_c_l219_c19_a4a7_write_enable <= VAR_fg_vram_update_uxn_c_l219_c19_a4a7_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l219_c19_a4a7_return_output := fg_vram_update_uxn_c_l219_c19_a4a7_return_output;

     -- MUX[uxn_c_l233_c19_f15d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l233_c19_f15d_cond <= VAR_MUX_uxn_c_l233_c19_f15d_cond;
     MUX_uxn_c_l233_c19_f15d_iftrue <= VAR_MUX_uxn_c_l233_c19_f15d_iftrue;
     MUX_uxn_c_l233_c19_f15d_iffalse <= VAR_MUX_uxn_c_l233_c19_f15d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l233_c19_f15d_return_output := MUX_uxn_c_l233_c19_f15d_return_output;

     -- bg_vram_update[uxn_c_l212_c19_0536] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l212_c19_0536_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l212_c19_0536_read_address <= VAR_bg_vram_update_uxn_c_l212_c19_0536_read_address;
     bg_vram_update_uxn_c_l212_c19_0536_write_address <= VAR_bg_vram_update_uxn_c_l212_c19_0536_write_address;
     bg_vram_update_uxn_c_l212_c19_0536_write_value <= VAR_bg_vram_update_uxn_c_l212_c19_0536_write_value;
     bg_vram_update_uxn_c_l212_c19_0536_write_enable <= VAR_bg_vram_update_uxn_c_l212_c19_0536_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l212_c19_0536_return_output := bg_vram_update_uxn_c_l212_c19_0536_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l233_c19_f15d_return_output;
     VAR_MUX_uxn_c_l237_c17_e1a4_iftrue := VAR_bg_vram_update_uxn_c_l212_c19_0536_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l212_c19_0536_return_output;
     VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_left := VAR_fg_vram_update_uxn_c_l219_c19_a4a7_return_output;
     VAR_MUX_uxn_c_l237_c17_e1a4_iffalse := VAR_fg_vram_update_uxn_c_l219_c19_a4a7_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l219_c19_a4a7_return_output;
     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_dcff] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_dcff_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_1ff3_return_output,
     VAR_MUX_uxn_c_l233_c19_f15d_return_output);

     -- BIN_OP_EQ[uxn_c_l237_c17_34c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c17_34c2_left <= VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_left;
     BIN_OP_EQ_uxn_c_l237_c17_34c2_right <= VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output := BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l237_c17_e1a4_cond := VAR_BIN_OP_EQ_uxn_c_l237_c17_34c2_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_dcff_return_output;
     -- MUX[uxn_c_l237_c17_e1a4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l237_c17_e1a4_cond <= VAR_MUX_uxn_c_l237_c17_e1a4_cond;
     MUX_uxn_c_l237_c17_e1a4_iftrue <= VAR_MUX_uxn_c_l237_c17_e1a4_iftrue;
     MUX_uxn_c_l237_c17_e1a4_iffalse <= VAR_MUX_uxn_c_l237_c17_e1a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l237_c17_e1a4_return_output := MUX_uxn_c_l237_c17_e1a4_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l239_l136_DUPLICATE_f373 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l239_l136_DUPLICATE_f373_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l236_c25_2e3e_return_output,
     VAR_MUX_uxn_c_l237_c17_e1a4_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l239_l136_DUPLICATE_f373_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l239_l136_DUPLICATE_f373_return_output;
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
     bg_pixel_color <= REG_COMB_bg_pixel_color;
     fg_pixel_color <= REG_COMB_fg_pixel_color;
     is_buffer_swapped <= REG_COMB_is_buffer_swapped;
     adjusted_read_address <= REG_COMB_adjusted_read_address;
     adjusted_write_address <= REG_COMB_adjusted_write_address;
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
     is_fill_pixel0 <= REG_COMB_is_fill_pixel0;
     is_fill_pixel1 <= REG_COMB_is_fill_pixel1;
     pixel_counter <= REG_COMB_pixel_counter;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     is_caught_up <= REG_COMB_is_caught_up;
     is_read_ready <= REG_COMB_is_read_ready;
 end if;
 end if;
end process;

end arch;
