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
-- BIN_OP_XOR[uxn_c_l144_c2_2bb4]
signal BIN_OP_XOR_uxn_c_l144_c2_2bb4_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l144_c2_2bb4_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l145_c17_0f33]
signal BIN_OP_EQ_uxn_c_l145_c17_0f33_left : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l145_c17_0f33_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l145_c17_3ae7]
signal MUX_uxn_c_l145_c17_3ae7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_3ae7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_3ae7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_3ae7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l146_c18_8fe9]
signal BIN_OP_EQ_uxn_c_l146_c18_8fe9_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l146_c18_8fe9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l146_c18_a20d]
signal MUX_uxn_c_l146_c18_a20d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_a20d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_a20d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_a20d_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l148_c7_f508]
signal UNARY_OP_NOT_uxn_c_l148_c7_f508_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l148_c38_257f]
signal UNARY_OP_NOT_uxn_c_l148_c38_257f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c7_0012]
signal BIN_OP_AND_uxn_c_l148_c7_0012_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_0012_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_0012_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c7_17bd]
signal BIN_OP_AND_uxn_c_l148_c7_17bd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_17bd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_17bd_return_output : unsigned(0 downto 0);

-- queue_phase_MUX[uxn_c_l148_c2_ecf3]
signal queue_phase_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output : unsigned(1 downto 0);

-- queue_read_ptr_MUX[uxn_c_l148_c2_ecf3]
signal queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output : unsigned(9 downto 0);

-- current_queue_item_MUX[uxn_c_l148_c2_ecf3]
signal current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output : draw_command_t;

-- BIN_OP_PLUS[uxn_c_l157_c3_ccc3]
signal BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output : unsigned(10 downto 0);

-- queue_phase_MUX[uxn_c_l160_c2_69bf]
signal queue_phase_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(1 downto 0);

-- queue_write_value_MUX[uxn_c_l160_c2_69bf]
signal queue_write_value_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(23 downto 0);

-- queue_write_ptr_MUX[uxn_c_l160_c2_69bf]
signal queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(9 downto 0);

-- BIN_OP_PLUS[uxn_c_l165_c3_1165]
signal BIN_OP_PLUS_uxn_c_l165_c3_1165_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l165_c3_1165_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output : unsigned(10 downto 0);

-- BIN_OP_EQ[uxn_c_l169_c16_9d3f]
signal BIN_OP_EQ_uxn_c_l169_c16_9d3f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l169_c16_9d3f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l169_c39_75b7]
signal BIN_OP_PLUS_uxn_c_l169_c39_75b7_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c39_75b7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l169_c16_dc44]
signal MUX_uxn_c_l169_c16_dc44_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l169_c16_dc44_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c16_dc44_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c16_dc44_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l171_c6_bb4f]
signal BIN_OP_AND_uxn_c_l171_c6_bb4f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_bb4f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l171_c66_ef69]
signal UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l171_c6_4a77]
signal BIN_OP_AND_uxn_c_l171_c6_4a77_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_4a77_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_4a77_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l171_c2_cca3]
signal is_fill_active_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l171_c2_cca3]
signal x_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l171_c2_cca3]
signal fill_y1_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l171_c2_cca3]
signal fill_x1_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l171_c2_cca3]
signal fill_x0_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l171_c2_cca3]
signal y_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- fill_y0_MUX[uxn_c_l171_c2_cca3]
signal fill_y0_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l171_c2_cca3]
signal fill_layer_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l171_c2_cca3]
signal is_fill_top_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l171_c2_cca3]
signal is_fill_left_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);

-- fill_color_MUX[uxn_c_l171_c2_cca3]
signal fill_color_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l175_c13_9c2e]
signal MUX_uxn_c_l175_c13_9c2e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c13_9c2e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c13_9c2e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c13_9c2e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l176_c28_50a3]
signal BIN_OP_AND_uxn_c_l176_c28_50a3_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l176_c28_50a3_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l176_c28_50a3_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l176_c13_f51a]
signal MUX_uxn_c_l176_c13_f51a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c13_f51a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l176_c13_f51a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l176_c13_f51a_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l177_c13_6a8b]
signal MUX_uxn_c_l177_c13_6a8b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c13_6a8b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c13_6a8b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c13_6a8b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l178_c32_c496]
signal BIN_OP_AND_uxn_c_l178_c32_c496_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l178_c32_c496_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l178_c32_c496_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l178_c13_0766]
signal MUX_uxn_c_l178_c13_0766_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c13_0766_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l178_c13_0766_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l178_c13_0766_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l187_c52_c141]
signal BIN_OP_AND_uxn_c_l187_c52_c141_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l187_c52_c141_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l187_c52_c141_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l187_c52_a010]
signal MUX_uxn_c_l187_c52_a010_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l187_c52_a010_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l187_c52_a010_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l187_c52_a010_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l187_c35_8ad8]
signal BIN_OP_OR_uxn_c_l187_c35_8ad8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l187_c35_8ad8_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output : unsigned(16 downto 0);

-- CONST_SL_8[uxn_c_l188_c56_48eb]
signal CONST_SL_8_uxn_c_l188_c56_48eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l188_c56_48eb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l188_c56_3272]
signal BIN_OP_PLUS_uxn_c_l188_c56_3272_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c56_3272_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l188_c37_1d1d]
signal MUX_uxn_c_l188_c37_1d1d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c37_1d1d_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c37_1d1d_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c37_1d1d_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l188_c108_ea67]
signal UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l188_c108_ea80]
signal BIN_OP_AND_uxn_c_l188_c108_ea80_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l188_c108_ea80_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l188_c108_ea80_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l188_c108_6ebb]
signal MUX_uxn_c_l188_c108_6ebb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c108_6ebb_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c108_6ebb_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c108_6ebb_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l188_c37_a66c]
signal BIN_OP_OR_uxn_c_l188_c37_a66c_left : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l188_c37_a66c_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l188_c37_a66c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l190_c21_b924]
signal BIN_OP_EQ_uxn_c_l190_c21_b924_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c21_b924_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c21_b924_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l190_c21_c625]
signal MUX_uxn_c_l190_c21_c625_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_c625_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_c625_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_c625_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l191_c22_f0b8]
signal BIN_OP_EQ_uxn_c_l191_c22_f0b8_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c22_f0b8_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l191_c22_ca3b]
signal MUX_uxn_c_l191_c22_ca3b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_ca3b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_ca3b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_ca3b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l192_c25_2e5b]
signal BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l192_c6_b287]
signal MUX_uxn_c_l192_c6_b287_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l192_c6_b287_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l192_c6_b287_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l192_c6_b287_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l193_c34_eaa0]
signal BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l193_c6_0783]
signal MUX_uxn_c_l193_c6_0783_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l193_c6_0783_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l193_c6_0783_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l193_c6_0783_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l195_c46_0008]
signal UNARY_OP_NOT_uxn_c_l195_c46_0008_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l195_c27_9e1d]
signal BIN_OP_AND_uxn_c_l195_c27_9e1d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l195_c27_9e1d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l196_c27_f1dc]
signal BIN_OP_AND_uxn_c_l196_c27_f1dc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l196_c27_f1dc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c3_1939]
signal MUX_uxn_c_l201_c3_1939_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c3_1939_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l201_c3_1939_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l201_c3_1939_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l202_c71_a153]
signal UNARY_OP_NOT_uxn_c_l202_c71_a153_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l202_c22_42ac]
signal BIN_OP_AND_uxn_c_l202_c22_42ac_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c22_42ac_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c22_42ac_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l202_c3_b534]
signal BIN_OP_OR_uxn_c_l202_c3_b534_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l202_c3_b534_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l202_c3_b534_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l198_c27_5f4a]
signal bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l198_c27_5f4a_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l198_c27_5f4a_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l198_c27_5f4a_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l198_c27_5f4a_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l198_c27_5f4a_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l208_c3_ffff]
signal MUX_uxn_c_l208_c3_ffff_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c3_ffff_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l208_c3_ffff_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l208_c3_ffff_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l209_c22_8573]
signal BIN_OP_AND_uxn_c_l209_c22_8573_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c22_8573_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c22_8573_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l209_c3_5eef]
signal BIN_OP_OR_uxn_c_l209_c3_5eef_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l209_c3_5eef_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l209_c3_5eef_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l205_c27_6b02]
signal fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l205_c27_6b02_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l205_c27_6b02_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l205_c27_6b02_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l205_c27_6b02_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l205_c27_6b02_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l212_c21_4d6f]
signal draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4d6f_read_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4d6f_write_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4d6f_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4d6f_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4d6f_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l219_c38_ae79]
signal BIN_OP_AND_uxn_c_l219_c38_ae79_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l219_c38_ae79_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l219_c38_ae79_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l219_c38_5746]
signal UNARY_OP_NOT_uxn_c_l219_c38_5746_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l219_c19_5a99]
signal MUX_uxn_c_l219_c19_5a99_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_5a99_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_5a99_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_5a99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l221_c19_de5c]
signal BIN_OP_EQ_uxn_c_l221_c19_de5c_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c19_de5c_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l221_c76_7ed1]
signal BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l221_c50_64f6]
signal MUX_uxn_c_l221_c50_64f6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c50_64f6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c50_64f6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c50_64f6_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l221_c19_fb5b]
signal MUX_uxn_c_l221_c19_fb5b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c19_fb5b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c19_fb5b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c19_fb5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l222_c25_9333]
signal BIN_OP_EQ_uxn_c_l222_c25_9333_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l222_c25_9333_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l222_c25_9333_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l222_c25_4c45]
signal MUX_uxn_c_l222_c25_4c45_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4c45_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4c45_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4c45_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l223_c17_76a2]
signal BIN_OP_EQ_uxn_c_l223_c17_76a2_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c17_76a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l223_c17_b19f]
signal MUX_uxn_c_l223_c17_b19f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l223_c17_b19f_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l223_c17_b19f_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l223_c17_b19f_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e
signal CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474
signal UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l144_c2_2bb4
BIN_OP_XOR_uxn_c_l144_c2_2bb4 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l144_c2_2bb4_left,
BIN_OP_XOR_uxn_c_l144_c2_2bb4_right,
BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output);

-- BIN_OP_EQ_uxn_c_l145_c17_0f33
BIN_OP_EQ_uxn_c_l145_c17_0f33 : entity work.BIN_OP_EQ_uint10_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l145_c17_0f33_left,
BIN_OP_EQ_uxn_c_l145_c17_0f33_right,
BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output);

-- MUX_uxn_c_l145_c17_3ae7
MUX_uxn_c_l145_c17_3ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l145_c17_3ae7_cond,
MUX_uxn_c_l145_c17_3ae7_iftrue,
MUX_uxn_c_l145_c17_3ae7_iffalse,
MUX_uxn_c_l145_c17_3ae7_return_output);

-- BIN_OP_EQ_uxn_c_l146_c18_8fe9
BIN_OP_EQ_uxn_c_l146_c18_8fe9 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l146_c18_8fe9_left,
BIN_OP_EQ_uxn_c_l146_c18_8fe9_right,
BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output);

-- MUX_uxn_c_l146_c18_a20d
MUX_uxn_c_l146_c18_a20d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c18_a20d_cond,
MUX_uxn_c_l146_c18_a20d_iftrue,
MUX_uxn_c_l146_c18_a20d_iffalse,
MUX_uxn_c_l146_c18_a20d_return_output);

-- UNARY_OP_NOT_uxn_c_l148_c7_f508
UNARY_OP_NOT_uxn_c_l148_c7_f508 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l148_c7_f508_expr,
UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output);

-- UNARY_OP_NOT_uxn_c_l148_c38_257f
UNARY_OP_NOT_uxn_c_l148_c38_257f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l148_c38_257f_expr,
UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output);

-- BIN_OP_AND_uxn_c_l148_c7_0012
BIN_OP_AND_uxn_c_l148_c7_0012 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c7_0012_left,
BIN_OP_AND_uxn_c_l148_c7_0012_right,
BIN_OP_AND_uxn_c_l148_c7_0012_return_output);

-- BIN_OP_AND_uxn_c_l148_c7_17bd
BIN_OP_AND_uxn_c_l148_c7_17bd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c7_17bd_left,
BIN_OP_AND_uxn_c_l148_c7_17bd_right,
BIN_OP_AND_uxn_c_l148_c7_17bd_return_output);

-- queue_phase_MUX_uxn_c_l148_c2_ecf3
queue_phase_MUX_uxn_c_l148_c2_ecf3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l148_c2_ecf3_cond,
queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue,
queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse,
queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output);

-- queue_read_ptr_MUX_uxn_c_l148_c2_ecf3
queue_read_ptr_MUX_uxn_c_l148_c2_ecf3 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond,
queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue,
queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse,
queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output);

-- current_queue_item_MUX_uxn_c_l148_c2_ecf3
current_queue_item_MUX_uxn_c_l148_c2_ecf3 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond,
current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue,
current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse,
current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output);

-- BIN_OP_PLUS_uxn_c_l157_c3_ccc3
BIN_OP_PLUS_uxn_c_l157_c3_ccc3 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left,
BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right,
BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output);

-- queue_phase_MUX_uxn_c_l160_c2_69bf
queue_phase_MUX_uxn_c_l160_c2_69bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l160_c2_69bf_cond,
queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue,
queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse,
queue_phase_MUX_uxn_c_l160_c2_69bf_return_output);

-- queue_write_value_MUX_uxn_c_l160_c2_69bf
queue_write_value_MUX_uxn_c_l160_c2_69bf : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l160_c2_69bf_cond,
queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue,
queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse,
queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output);

-- queue_write_ptr_MUX_uxn_c_l160_c2_69bf
queue_write_ptr_MUX_uxn_c_l160_c2_69bf : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond,
queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue,
queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse,
queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output);

-- BIN_OP_PLUS_uxn_c_l165_c3_1165
BIN_OP_PLUS_uxn_c_l165_c3_1165 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l165_c3_1165_left,
BIN_OP_PLUS_uxn_c_l165_c3_1165_right,
BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output);

-- BIN_OP_EQ_uxn_c_l169_c16_9d3f
BIN_OP_EQ_uxn_c_l169_c16_9d3f : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l169_c16_9d3f_left,
BIN_OP_EQ_uxn_c_l169_c16_9d3f_right,
BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output);

-- BIN_OP_PLUS_uxn_c_l169_c39_75b7
BIN_OP_PLUS_uxn_c_l169_c39_75b7 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l169_c39_75b7_left,
BIN_OP_PLUS_uxn_c_l169_c39_75b7_right,
BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output);

-- MUX_uxn_c_l169_c16_dc44
MUX_uxn_c_l169_c16_dc44 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l169_c16_dc44_cond,
MUX_uxn_c_l169_c16_dc44_iftrue,
MUX_uxn_c_l169_c16_dc44_iffalse,
MUX_uxn_c_l169_c16_dc44_return_output);

-- BIN_OP_AND_uxn_c_l171_c6_bb4f
BIN_OP_AND_uxn_c_l171_c6_bb4f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l171_c6_bb4f_left,
BIN_OP_AND_uxn_c_l171_c6_bb4f_right,
BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output);

-- UNARY_OP_NOT_uxn_c_l171_c66_ef69
UNARY_OP_NOT_uxn_c_l171_c66_ef69 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr,
UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output);

-- BIN_OP_AND_uxn_c_l171_c6_4a77
BIN_OP_AND_uxn_c_l171_c6_4a77 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l171_c6_4a77_left,
BIN_OP_AND_uxn_c_l171_c6_4a77_right,
BIN_OP_AND_uxn_c_l171_c6_4a77_return_output);

-- is_fill_active_MUX_uxn_c_l171_c2_cca3
is_fill_active_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l171_c2_cca3_cond,
is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue,
is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse,
is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output);

-- x_MUX_uxn_c_l171_c2_cca3
x_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l171_c2_cca3_cond,
x_MUX_uxn_c_l171_c2_cca3_iftrue,
x_MUX_uxn_c_l171_c2_cca3_iffalse,
x_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_y1_MUX_uxn_c_l171_c2_cca3
fill_y1_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l171_c2_cca3_cond,
fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_y1_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_x1_MUX_uxn_c_l171_c2_cca3
fill_x1_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l171_c2_cca3_cond,
fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_x1_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_x0_MUX_uxn_c_l171_c2_cca3
fill_x0_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l171_c2_cca3_cond,
fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_x0_MUX_uxn_c_l171_c2_cca3_return_output);

-- y_MUX_uxn_c_l171_c2_cca3
y_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l171_c2_cca3_cond,
y_MUX_uxn_c_l171_c2_cca3_iftrue,
y_MUX_uxn_c_l171_c2_cca3_iffalse,
y_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_y0_MUX_uxn_c_l171_c2_cca3
fill_y0_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l171_c2_cca3_cond,
fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_y0_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_layer_MUX_uxn_c_l171_c2_cca3
fill_layer_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l171_c2_cca3_cond,
fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_layer_MUX_uxn_c_l171_c2_cca3_return_output);

-- is_fill_top_MUX_uxn_c_l171_c2_cca3
is_fill_top_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l171_c2_cca3_cond,
is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue,
is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse,
is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output);

-- is_fill_left_MUX_uxn_c_l171_c2_cca3
is_fill_left_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l171_c2_cca3_cond,
is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue,
is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse,
is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output);

-- fill_color_MUX_uxn_c_l171_c2_cca3
fill_color_MUX_uxn_c_l171_c2_cca3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l171_c2_cca3_cond,
fill_color_MUX_uxn_c_l171_c2_cca3_iftrue,
fill_color_MUX_uxn_c_l171_c2_cca3_iffalse,
fill_color_MUX_uxn_c_l171_c2_cca3_return_output);

-- MUX_uxn_c_l175_c13_9c2e
MUX_uxn_c_l175_c13_9c2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c13_9c2e_cond,
MUX_uxn_c_l175_c13_9c2e_iftrue,
MUX_uxn_c_l175_c13_9c2e_iffalse,
MUX_uxn_c_l175_c13_9c2e_return_output);

-- BIN_OP_AND_uxn_c_l176_c28_50a3
BIN_OP_AND_uxn_c_l176_c28_50a3 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l176_c28_50a3_left,
BIN_OP_AND_uxn_c_l176_c28_50a3_right,
BIN_OP_AND_uxn_c_l176_c28_50a3_return_output);

-- MUX_uxn_c_l176_c13_f51a
MUX_uxn_c_l176_c13_f51a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c13_f51a_cond,
MUX_uxn_c_l176_c13_f51a_iftrue,
MUX_uxn_c_l176_c13_f51a_iffalse,
MUX_uxn_c_l176_c13_f51a_return_output);

-- MUX_uxn_c_l177_c13_6a8b
MUX_uxn_c_l177_c13_6a8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c13_6a8b_cond,
MUX_uxn_c_l177_c13_6a8b_iftrue,
MUX_uxn_c_l177_c13_6a8b_iffalse,
MUX_uxn_c_l177_c13_6a8b_return_output);

-- BIN_OP_AND_uxn_c_l178_c32_c496
BIN_OP_AND_uxn_c_l178_c32_c496 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l178_c32_c496_left,
BIN_OP_AND_uxn_c_l178_c32_c496_right,
BIN_OP_AND_uxn_c_l178_c32_c496_return_output);

-- MUX_uxn_c_l178_c13_0766
MUX_uxn_c_l178_c13_0766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l178_c13_0766_cond,
MUX_uxn_c_l178_c13_0766_iftrue,
MUX_uxn_c_l178_c13_0766_iffalse,
MUX_uxn_c_l178_c13_0766_return_output);

-- BIN_OP_AND_uxn_c_l187_c52_c141
BIN_OP_AND_uxn_c_l187_c52_c141 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l187_c52_c141_left,
BIN_OP_AND_uxn_c_l187_c52_c141_right,
BIN_OP_AND_uxn_c_l187_c52_c141_return_output);

-- MUX_uxn_c_l187_c52_a010
MUX_uxn_c_l187_c52_a010 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l187_c52_a010_cond,
MUX_uxn_c_l187_c52_a010_iftrue,
MUX_uxn_c_l187_c52_a010_iffalse,
MUX_uxn_c_l187_c52_a010_return_output);

-- BIN_OP_OR_uxn_c_l187_c35_8ad8
BIN_OP_OR_uxn_c_l187_c35_8ad8 : entity work.BIN_OP_OR_uint16_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l187_c35_8ad8_left,
BIN_OP_OR_uxn_c_l187_c35_8ad8_right,
BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output);

-- CONST_SL_8_uxn_c_l188_c56_48eb
CONST_SL_8_uxn_c_l188_c56_48eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l188_c56_48eb_x,
CONST_SL_8_uxn_c_l188_c56_48eb_return_output);

-- BIN_OP_PLUS_uxn_c_l188_c56_3272
BIN_OP_PLUS_uxn_c_l188_c56_3272 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l188_c56_3272_left,
BIN_OP_PLUS_uxn_c_l188_c56_3272_right,
BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output);

-- MUX_uxn_c_l188_c37_1d1d
MUX_uxn_c_l188_c37_1d1d : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c37_1d1d_cond,
MUX_uxn_c_l188_c37_1d1d_iftrue,
MUX_uxn_c_l188_c37_1d1d_iffalse,
MUX_uxn_c_l188_c37_1d1d_return_output);

-- UNARY_OP_NOT_uxn_c_l188_c108_ea67
UNARY_OP_NOT_uxn_c_l188_c108_ea67 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr,
UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output);

-- BIN_OP_AND_uxn_c_l188_c108_ea80
BIN_OP_AND_uxn_c_l188_c108_ea80 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c108_ea80_left,
BIN_OP_AND_uxn_c_l188_c108_ea80_right,
BIN_OP_AND_uxn_c_l188_c108_ea80_return_output);

-- MUX_uxn_c_l188_c108_6ebb
MUX_uxn_c_l188_c108_6ebb : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c108_6ebb_cond,
MUX_uxn_c_l188_c108_6ebb_iftrue,
MUX_uxn_c_l188_c108_6ebb_iffalse,
MUX_uxn_c_l188_c108_6ebb_return_output);

-- BIN_OP_OR_uxn_c_l188_c37_a66c
BIN_OP_OR_uxn_c_l188_c37_a66c : entity work.BIN_OP_OR_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l188_c37_a66c_left,
BIN_OP_OR_uxn_c_l188_c37_a66c_right,
BIN_OP_OR_uxn_c_l188_c37_a66c_return_output);

-- BIN_OP_EQ_uxn_c_l190_c21_b924
BIN_OP_EQ_uxn_c_l190_c21_b924 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l190_c21_b924_left,
BIN_OP_EQ_uxn_c_l190_c21_b924_right,
BIN_OP_EQ_uxn_c_l190_c21_b924_return_output);

-- MUX_uxn_c_l190_c21_c625
MUX_uxn_c_l190_c21_c625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c21_c625_cond,
MUX_uxn_c_l190_c21_c625_iftrue,
MUX_uxn_c_l190_c21_c625_iffalse,
MUX_uxn_c_l190_c21_c625_return_output);

-- BIN_OP_EQ_uxn_c_l191_c22_f0b8
BIN_OP_EQ_uxn_c_l191_c22_f0b8 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l191_c22_f0b8_left,
BIN_OP_EQ_uxn_c_l191_c22_f0b8_right,
BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output);

-- MUX_uxn_c_l191_c22_ca3b
MUX_uxn_c_l191_c22_ca3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c22_ca3b_cond,
MUX_uxn_c_l191_c22_ca3b_iftrue,
MUX_uxn_c_l191_c22_ca3b_iffalse,
MUX_uxn_c_l191_c22_ca3b_return_output);

-- BIN_OP_PLUS_uxn_c_l192_c25_2e5b
BIN_OP_PLUS_uxn_c_l192_c25_2e5b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left,
BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right,
BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output);

-- MUX_uxn_c_l192_c6_b287
MUX_uxn_c_l192_c6_b287 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l192_c6_b287_cond,
MUX_uxn_c_l192_c6_b287_iftrue,
MUX_uxn_c_l192_c6_b287_iffalse,
MUX_uxn_c_l192_c6_b287_return_output);

-- BIN_OP_PLUS_uxn_c_l193_c34_eaa0
BIN_OP_PLUS_uxn_c_l193_c34_eaa0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left,
BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right,
BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output);

-- MUX_uxn_c_l193_c6_0783
MUX_uxn_c_l193_c6_0783 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l193_c6_0783_cond,
MUX_uxn_c_l193_c6_0783_iftrue,
MUX_uxn_c_l193_c6_0783_iffalse,
MUX_uxn_c_l193_c6_0783_return_output);

-- UNARY_OP_NOT_uxn_c_l195_c46_0008
UNARY_OP_NOT_uxn_c_l195_c46_0008 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l195_c46_0008_expr,
UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output);

-- BIN_OP_AND_uxn_c_l195_c27_9e1d
BIN_OP_AND_uxn_c_l195_c27_9e1d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l195_c27_9e1d_left,
BIN_OP_AND_uxn_c_l195_c27_9e1d_right,
BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output);

-- BIN_OP_AND_uxn_c_l196_c27_f1dc
BIN_OP_AND_uxn_c_l196_c27_f1dc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l196_c27_f1dc_left,
BIN_OP_AND_uxn_c_l196_c27_f1dc_right,
BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output);

-- MUX_uxn_c_l201_c3_1939
MUX_uxn_c_l201_c3_1939 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c3_1939_cond,
MUX_uxn_c_l201_c3_1939_iftrue,
MUX_uxn_c_l201_c3_1939_iffalse,
MUX_uxn_c_l201_c3_1939_return_output);

-- UNARY_OP_NOT_uxn_c_l202_c71_a153
UNARY_OP_NOT_uxn_c_l202_c71_a153 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l202_c71_a153_expr,
UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output);

-- BIN_OP_AND_uxn_c_l202_c22_42ac
BIN_OP_AND_uxn_c_l202_c22_42ac : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c22_42ac_left,
BIN_OP_AND_uxn_c_l202_c22_42ac_right,
BIN_OP_AND_uxn_c_l202_c22_42ac_return_output);

-- BIN_OP_OR_uxn_c_l202_c3_b534
BIN_OP_OR_uxn_c_l202_c3_b534 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l202_c3_b534_left,
BIN_OP_OR_uxn_c_l202_c3_b534_right,
BIN_OP_OR_uxn_c_l202_c3_b534_return_output);

-- bg_vram_update_uxn_c_l198_c27_5f4a
bg_vram_update_uxn_c_l198_c27_5f4a : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE,
bg_vram_update_uxn_c_l198_c27_5f4a_read_address,
bg_vram_update_uxn_c_l198_c27_5f4a_write_address,
bg_vram_update_uxn_c_l198_c27_5f4a_write_value,
bg_vram_update_uxn_c_l198_c27_5f4a_write_enable,
bg_vram_update_uxn_c_l198_c27_5f4a_return_output);

-- MUX_uxn_c_l208_c3_ffff
MUX_uxn_c_l208_c3_ffff : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l208_c3_ffff_cond,
MUX_uxn_c_l208_c3_ffff_iftrue,
MUX_uxn_c_l208_c3_ffff_iffalse,
MUX_uxn_c_l208_c3_ffff_return_output);

-- BIN_OP_AND_uxn_c_l209_c22_8573
BIN_OP_AND_uxn_c_l209_c22_8573 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c22_8573_left,
BIN_OP_AND_uxn_c_l209_c22_8573_right,
BIN_OP_AND_uxn_c_l209_c22_8573_return_output);

-- BIN_OP_OR_uxn_c_l209_c3_5eef
BIN_OP_OR_uxn_c_l209_c3_5eef : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l209_c3_5eef_left,
BIN_OP_OR_uxn_c_l209_c3_5eef_right,
BIN_OP_OR_uxn_c_l209_c3_5eef_return_output);

-- fg_vram_update_uxn_c_l205_c27_6b02
fg_vram_update_uxn_c_l205_c27_6b02 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE,
fg_vram_update_uxn_c_l205_c27_6b02_read_address,
fg_vram_update_uxn_c_l205_c27_6b02_write_address,
fg_vram_update_uxn_c_l205_c27_6b02_write_value,
fg_vram_update_uxn_c_l205_c27_6b02_write_enable,
fg_vram_update_uxn_c_l205_c27_6b02_return_output);

-- draw_queue_update_uxn_c_l212_c21_4d6f
draw_queue_update_uxn_c_l212_c21_4d6f : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE,
draw_queue_update_uxn_c_l212_c21_4d6f_read_address,
draw_queue_update_uxn_c_l212_c21_4d6f_write_address,
draw_queue_update_uxn_c_l212_c21_4d6f_write_value,
draw_queue_update_uxn_c_l212_c21_4d6f_write_enable,
draw_queue_update_uxn_c_l212_c21_4d6f_return_output);

-- BIN_OP_AND_uxn_c_l219_c38_ae79
BIN_OP_AND_uxn_c_l219_c38_ae79 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l219_c38_ae79_left,
BIN_OP_AND_uxn_c_l219_c38_ae79_right,
BIN_OP_AND_uxn_c_l219_c38_ae79_return_output);

-- UNARY_OP_NOT_uxn_c_l219_c38_5746
UNARY_OP_NOT_uxn_c_l219_c38_5746 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l219_c38_5746_expr,
UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output);

-- MUX_uxn_c_l219_c19_5a99
MUX_uxn_c_l219_c19_5a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l219_c19_5a99_cond,
MUX_uxn_c_l219_c19_5a99_iftrue,
MUX_uxn_c_l219_c19_5a99_iffalse,
MUX_uxn_c_l219_c19_5a99_return_output);

-- BIN_OP_EQ_uxn_c_l221_c19_de5c
BIN_OP_EQ_uxn_c_l221_c19_de5c : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l221_c19_de5c_left,
BIN_OP_EQ_uxn_c_l221_c19_de5c_right,
BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output);

-- BIN_OP_PLUS_uxn_c_l221_c76_7ed1
BIN_OP_PLUS_uxn_c_l221_c76_7ed1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left,
BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right,
BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output);

-- MUX_uxn_c_l221_c50_64f6
MUX_uxn_c_l221_c50_64f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c50_64f6_cond,
MUX_uxn_c_l221_c50_64f6_iftrue,
MUX_uxn_c_l221_c50_64f6_iffalse,
MUX_uxn_c_l221_c50_64f6_return_output);

-- MUX_uxn_c_l221_c19_fb5b
MUX_uxn_c_l221_c19_fb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c19_fb5b_cond,
MUX_uxn_c_l221_c19_fb5b_iftrue,
MUX_uxn_c_l221_c19_fb5b_iffalse,
MUX_uxn_c_l221_c19_fb5b_return_output);

-- BIN_OP_EQ_uxn_c_l222_c25_9333
BIN_OP_EQ_uxn_c_l222_c25_9333 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l222_c25_9333_left,
BIN_OP_EQ_uxn_c_l222_c25_9333_right,
BIN_OP_EQ_uxn_c_l222_c25_9333_return_output);

-- MUX_uxn_c_l222_c25_4c45
MUX_uxn_c_l222_c25_4c45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l222_c25_4c45_cond,
MUX_uxn_c_l222_c25_4c45_iftrue,
MUX_uxn_c_l222_c25_4c45_iffalse,
MUX_uxn_c_l222_c25_4c45_return_output);

-- BIN_OP_EQ_uxn_c_l223_c17_76a2
BIN_OP_EQ_uxn_c_l223_c17_76a2 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l223_c17_76a2_left,
BIN_OP_EQ_uxn_c_l223_c17_76a2_right,
BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output);

-- MUX_uxn_c_l223_c17_b19f
MUX_uxn_c_l223_c17_b19f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l223_c17_b19f_cond,
MUX_uxn_c_l223_c17_b19f_iftrue,
MUX_uxn_c_l223_c17_b19f_iffalse,
MUX_uxn_c_l223_c17_b19f_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x,
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output);



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
 BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output,
 BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output,
 MUX_uxn_c_l145_c17_3ae7_return_output,
 BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output,
 MUX_uxn_c_l146_c18_a20d_return_output,
 UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output,
 UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output,
 BIN_OP_AND_uxn_c_l148_c7_0012_return_output,
 BIN_OP_AND_uxn_c_l148_c7_17bd_return_output,
 queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output,
 queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output,
 current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output,
 BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output,
 queue_phase_MUX_uxn_c_l160_c2_69bf_return_output,
 queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output,
 queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output,
 BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output,
 BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output,
 BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output,
 MUX_uxn_c_l169_c16_dc44_return_output,
 BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output,
 UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output,
 BIN_OP_AND_uxn_c_l171_c6_4a77_return_output,
 is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output,
 x_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_y1_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_x1_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_x0_MUX_uxn_c_l171_c2_cca3_return_output,
 y_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_y0_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_layer_MUX_uxn_c_l171_c2_cca3_return_output,
 is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output,
 is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output,
 fill_color_MUX_uxn_c_l171_c2_cca3_return_output,
 MUX_uxn_c_l175_c13_9c2e_return_output,
 BIN_OP_AND_uxn_c_l176_c28_50a3_return_output,
 MUX_uxn_c_l176_c13_f51a_return_output,
 MUX_uxn_c_l177_c13_6a8b_return_output,
 BIN_OP_AND_uxn_c_l178_c32_c496_return_output,
 MUX_uxn_c_l178_c13_0766_return_output,
 BIN_OP_AND_uxn_c_l187_c52_c141_return_output,
 MUX_uxn_c_l187_c52_a010_return_output,
 BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output,
 CONST_SL_8_uxn_c_l188_c56_48eb_return_output,
 BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output,
 MUX_uxn_c_l188_c37_1d1d_return_output,
 UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output,
 BIN_OP_AND_uxn_c_l188_c108_ea80_return_output,
 MUX_uxn_c_l188_c108_6ebb_return_output,
 BIN_OP_OR_uxn_c_l188_c37_a66c_return_output,
 BIN_OP_EQ_uxn_c_l190_c21_b924_return_output,
 MUX_uxn_c_l190_c21_c625_return_output,
 BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output,
 MUX_uxn_c_l191_c22_ca3b_return_output,
 BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output,
 MUX_uxn_c_l192_c6_b287_return_output,
 BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output,
 MUX_uxn_c_l193_c6_0783_return_output,
 UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output,
 BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output,
 BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output,
 MUX_uxn_c_l201_c3_1939_return_output,
 UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output,
 BIN_OP_AND_uxn_c_l202_c22_42ac_return_output,
 BIN_OP_OR_uxn_c_l202_c3_b534_return_output,
 bg_vram_update_uxn_c_l198_c27_5f4a_return_output,
 MUX_uxn_c_l208_c3_ffff_return_output,
 BIN_OP_AND_uxn_c_l209_c22_8573_return_output,
 BIN_OP_OR_uxn_c_l209_c3_5eef_return_output,
 fg_vram_update_uxn_c_l205_c27_6b02_return_output,
 draw_queue_update_uxn_c_l212_c21_4d6f_return_output,
 BIN_OP_AND_uxn_c_l219_c38_ae79_return_output,
 UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output,
 MUX_uxn_c_l219_c19_5a99_return_output,
 BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output,
 BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output,
 MUX_uxn_c_l221_c50_64f6_return_output,
 MUX_uxn_c_l221_c19_fb5b_return_output,
 BIN_OP_EQ_uxn_c_l222_c25_9333_return_output,
 MUX_uxn_c_l222_c25_4c45_return_output,
 BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output,
 MUX_uxn_c_l223_c17_b19f_return_output,
 CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_3ae7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_3ae7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_3ae7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_3ae7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_a20d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_a20d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_a20d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_a20d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e51d_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_0012_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_0012_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_0012_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l156_c3_32d6 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l157_c3_f768 : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_ecf3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l149_c37_0cce_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l150_c30_658d_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l151_c33_0174_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l152_c34_e695_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l153_c32_b553_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l154_c30_dfb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output : unsigned(10 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l164_c3_870d : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l163_c3_2c1f : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l165_c3_a4e7 : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l161_c3_0bb9 : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l161_c23_9a9a_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l162_c3_0a7e : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l162_c23_f865_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l163_c23_c8d0_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output : unsigned(10 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_dc44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_dc44_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_dc44_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_dc44_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_dfe4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_cca3_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_cca3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_fd34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_bd97_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_9c2e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_9c2e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_9c2e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_9c2e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_f51a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_f51a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_f51a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_f51a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6a8b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6a8b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6a8b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6a8b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_0766_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_0766_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_0766_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_c496_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_c496_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_c496_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_0766_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_read_address : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_a010_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_c141_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_c141_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_c141_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_a010_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_a010_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_a010_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_1d1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c56_48eb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c56_48eb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_1d1d_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_1d1d_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_1d1d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_left : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6ebb_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6ebb_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6ebb_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6ebb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_c625_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_c625_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_c625_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_c625_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_ca3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_ca3b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_ca3b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_ca3b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_b287_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_b287_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_b287_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_b287_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_0783_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_0783_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_0783_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_0783_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_1939_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_1939_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_1939_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_1939_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_b534_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_b534_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_b534_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_5f4a_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_ffff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_ffff_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_ffff_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_ffff_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_8573_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_8573_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_8573_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_6b02_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_read_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4d6f_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_5a99_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_5a99_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_5a99_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_5a99_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_fb5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_fb5b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_fb5b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_64f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_64f6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_64f6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_64f6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_fb5b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4c45_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4c45_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4c45_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4c45_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_b19f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_b19f_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_b19f_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_b19f_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_69d6_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_5748_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l225_l123_DUPLICATE_4e82_return_output : gpu_step_result_t;
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
     VAR_MUX_uxn_c_l145_c17_3ae7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l188_c108_6ebb_iftrue := to_unsigned(65536, 17);
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l187_c52_a010_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l222_c25_4c45_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l221_c19_fb5b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l219_c19_5a99_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l178_c13_0766_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l175_c13_9c2e_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_MUX_uxn_c_l222_c25_4c45_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l145_c17_3ae7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l176_c13_f51a_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l191_c22_ca3b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l146_c18_a20d_iffalse := to_unsigned(0, 1);
     VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue := to_unsigned(1, 1);
     VAR_queue_phase_uxn_c_l164_c3_870d := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue := VAR_queue_phase_uxn_c_l164_c3_870d;
     VAR_MUX_uxn_c_l146_c18_a20d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l178_c32_c496_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right := to_unsigned(1, 1);
     VAR_queue_phase_uxn_c_l156_c3_32d6 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue := VAR_queue_phase_uxn_c_l156_c3_32d6;
     VAR_MUX_uxn_c_l190_c21_c625_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l169_c16_dc44_iftrue := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_right := to_unsigned(255, 16);
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l188_c108_6ebb_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l177_c13_6a8b_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l191_c22_ca3b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l190_c21_c625_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l187_c52_a010_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_right := to_unsigned(3, 2);

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
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l187_c52_c141_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse := fill_y1;
     VAR_MUX_uxn_c_l221_c50_64f6_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_left := pixel_counter;
     VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left := pixel_counter;
     VAR_MUX_uxn_c_l221_c50_64f6_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l171_c2_cca3_iffalse := x;
     VAR_y_MUX_uxn_c_l171_c2_cca3_iffalse := y;
     -- BIN_OP_XOR[uxn_c_l144_c2_2bb4] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l144_c2_2bb4_left <= VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_left;
     BIN_OP_XOR_uxn_c_l144_c2_2bb4_right <= VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output := BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output;

     -- UNARY_OP_NOT[uxn_c_l171_c66_ef69] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr <= VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output := UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output;

     -- uint24_21_21[uxn_c_l154_c30_dfb5] LATENCY=0
     VAR_uint24_21_21_uxn_c_l154_c30_dfb5_return_output := uint24_21_21(
     queue_read_value);

     -- uint24_19_19[uxn_c_l152_c34_e695] LATENCY=0
     VAR_uint24_19_19_uxn_c_l152_c34_e695_return_output := uint24_19_19(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l221_c19_de5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l221_c19_de5c_left <= VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_left;
     BIN_OP_EQ_uxn_c_l221_c19_de5c_right <= VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output := BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output;

     -- uint24_18_18[uxn_c_l151_c33_0174] LATENCY=0
     VAR_uint24_18_18_uxn_c_l151_c33_0174_return_output := uint24_18_18(
     queue_read_value);

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l148_c7_e51d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e51d_return_output := current_queue_item.is_valid;

     -- BIN_OP_PLUS[uxn_c_l165_c3_1165] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l165_c3_1165_left <= VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_left;
     BIN_OP_PLUS_uxn_c_l165_c3_1165_right <= VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output := BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output;

     -- BIN_OP_PLUS[uxn_c_l157_c3_ccc3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left <= VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_left;
     BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right <= VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output := BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output;

     -- uint32_uint16_0[uxn_c_l161_c23_9a9a] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l161_c23_9a9a_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- uint24_20_20[uxn_c_l153_c32_b553] LATENCY=0
     VAR_uint24_20_20_uxn_c_l153_c32_b553_return_output := uint24_20_20(
     queue_read_value);

     -- uint24_17_16[uxn_c_l150_c30_658d] LATENCY=0
     VAR_uint24_17_16_uxn_c_l150_c30_658d_return_output := uint24_17_16(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l146_c18_8fe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l146_c18_8fe9_left <= VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_left;
     BIN_OP_EQ_uxn_c_l146_c18_8fe9_right <= VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output := BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output;

     -- uint24_15_0[uxn_c_l149_c37_0cce] LATENCY=0
     VAR_uint24_15_0_uxn_c_l149_c37_0cce_return_output := uint24_15_0(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l221_c76_7ed1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left <= VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_left;
     BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right <= VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output := BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output;

     -- BIN_OP_EQ[uxn_c_l145_c17_0f33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l145_c17_0f33_left <= VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_left;
     BIN_OP_EQ_uxn_c_l145_c17_0f33_right <= VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output := BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l145_c17_3ae7_cond := VAR_BIN_OP_EQ_uxn_c_l145_c17_0f33_return_output;
     VAR_MUX_uxn_c_l146_c18_a20d_cond := VAR_BIN_OP_EQ_uxn_c_l146_c18_8fe9_return_output;
     VAR_MUX_uxn_c_l221_c19_fb5b_cond := VAR_BIN_OP_EQ_uxn_c_l221_c19_de5c_return_output;
     VAR_queue_read_ptr_uxn_c_l157_c3_f768 := resize(VAR_BIN_OP_PLUS_uxn_c_l157_c3_ccc3_return_output, 10);
     VAR_queue_write_ptr_uxn_c_l165_c3_a4e7 := resize(VAR_BIN_OP_PLUS_uxn_c_l165_c3_1165_return_output, 10);
     VAR_MUX_uxn_c_l221_c50_64f6_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l221_c76_7ed1_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l187_c52_c141_left := VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr := VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l144_c2_2bb4_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e51d_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_right := VAR_UNARY_OP_NOT_uxn_c_l171_c66_ef69_return_output;
     VAR_queue_write_value_uxn_c_l161_c3_0bb9 := resize(VAR_uint32_uint16_0_uxn_c_l161_c23_9a9a_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue := VAR_queue_read_ptr_uxn_c_l157_c3_f768;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue := VAR_queue_write_ptr_uxn_c_l165_c3_a4e7;
     -- MUX[uxn_c_l221_c50_64f6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c50_64f6_cond <= VAR_MUX_uxn_c_l221_c50_64f6_cond;
     MUX_uxn_c_l221_c50_64f6_iftrue <= VAR_MUX_uxn_c_l221_c50_64f6_iftrue;
     MUX_uxn_c_l221_c50_64f6_iffalse <= VAR_MUX_uxn_c_l221_c50_64f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c50_64f6_return_output := MUX_uxn_c_l221_c50_64f6_return_output;

     -- UNARY_OP_NOT[uxn_c_l188_c108_ea67] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr <= VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output := UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output;

     -- MUX[uxn_c_l145_c17_3ae7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l145_c17_3ae7_cond <= VAR_MUX_uxn_c_l145_c17_3ae7_cond;
     MUX_uxn_c_l145_c17_3ae7_iftrue <= VAR_MUX_uxn_c_l145_c17_3ae7_iftrue;
     MUX_uxn_c_l145_c17_3ae7_iffalse <= VAR_MUX_uxn_c_l145_c17_3ae7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l145_c17_3ae7_return_output := MUX_uxn_c_l145_c17_3ae7_return_output;

     -- uint32_uint5_16[uxn_c_l162_c23_f865] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l162_c23_f865_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l161_c3_0bb9, 32),
     resize(VAR_vram_value, 5));

     -- queue_write_ptr_MUX[uxn_c_l160_c2_69bf] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_cond;
     queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iftrue;
     queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output := queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output;

     -- BIN_OP_AND[uxn_c_l187_c52_c141] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l187_c52_c141_left <= VAR_BIN_OP_AND_uxn_c_l187_c52_c141_left;
     BIN_OP_AND_uxn_c_l187_c52_c141_right <= VAR_BIN_OP_AND_uxn_c_l187_c52_c141_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l187_c52_c141_return_output := BIN_OP_AND_uxn_c_l187_c52_c141_return_output;

     -- UNARY_OP_NOT[uxn_c_l148_c7_f508] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l148_c7_f508_expr <= VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output := UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output;

     -- MUX[uxn_c_l146_c18_a20d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c18_a20d_cond <= VAR_MUX_uxn_c_l146_c18_a20d_cond;
     MUX_uxn_c_l146_c18_a20d_iftrue <= VAR_MUX_uxn_c_l146_c18_a20d_iftrue;
     MUX_uxn_c_l146_c18_a20d_iffalse <= VAR_MUX_uxn_c_l146_c18_a20d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c18_a20d_return_output := MUX_uxn_c_l146_c18_a20d_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l148_c2_ecf3] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_ecf3_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l149_c37_0cce_return_output,
     VAR_uint24_17_16_uxn_c_l150_c30_658d_return_output,
     VAR_uint24_18_18_uxn_c_l151_c33_0174_return_output,
     VAR_uint24_19_19_uxn_c_l152_c34_e695_return_output,
     VAR_uint24_20_20_uxn_c_l153_c32_b553_return_output,
     VAR_uint24_21_21_uxn_c_l154_c30_dfb5_return_output,
     to_unsigned(1, 1));

     -- Submodule level 2
     VAR_MUX_uxn_c_l187_c52_a010_cond := VAR_BIN_OP_AND_uxn_c_l187_c52_c141_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_expr := VAR_MUX_uxn_c_l145_c17_3ae7_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l145_c17_3ae7_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_right := VAR_MUX_uxn_c_l146_c18_a20d_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l146_c18_a20d_return_output;
     VAR_MUX_uxn_c_l221_c19_fb5b_iffalse := VAR_MUX_uxn_c_l221_c50_64f6_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_0012_left := VAR_UNARY_OP_NOT_uxn_c_l148_c7_f508_return_output;
     VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_left := VAR_UNARY_OP_NOT_uxn_c_l188_c108_ea67_return_output;
     VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_ecf3_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_address := VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l160_c2_69bf_return_output;
     VAR_queue_write_value_uxn_c_l162_c3_0a7e := resize(VAR_uint32_uint5_16_uxn_c_l162_c23_f865_return_output, 24);
     -- MUX[uxn_c_l187_c52_a010] LATENCY=0
     -- Inputs
     MUX_uxn_c_l187_c52_a010_cond <= VAR_MUX_uxn_c_l187_c52_a010_cond;
     MUX_uxn_c_l187_c52_a010_iftrue <= VAR_MUX_uxn_c_l187_c52_a010_iftrue;
     MUX_uxn_c_l187_c52_a010_iffalse <= VAR_MUX_uxn_c_l187_c52_a010_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l187_c52_a010_return_output := MUX_uxn_c_l187_c52_a010_return_output;

     -- BIN_OP_AND[uxn_c_l188_c108_ea80] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c108_ea80_left <= VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_left;
     BIN_OP_AND_uxn_c_l188_c108_ea80_right <= VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_return_output := BIN_OP_AND_uxn_c_l188_c108_ea80_return_output;

     -- MUX[uxn_c_l221_c19_fb5b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c19_fb5b_cond <= VAR_MUX_uxn_c_l221_c19_fb5b_cond;
     MUX_uxn_c_l221_c19_fb5b_iftrue <= VAR_MUX_uxn_c_l221_c19_fb5b_iftrue;
     MUX_uxn_c_l221_c19_fb5b_iffalse <= VAR_MUX_uxn_c_l221_c19_fb5b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c19_fb5b_return_output := MUX_uxn_c_l221_c19_fb5b_return_output;

     -- uint32_uint1_21[uxn_c_l163_c23_c8d0] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l163_c23_c8d0_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l162_c3_0a7e, 32),
     VAR_vram_write_layer);

     -- UNARY_OP_NOT[uxn_c_l148_c38_257f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l148_c38_257f_expr <= VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output := UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l188_c108_6ebb_cond := VAR_BIN_OP_AND_uxn_c_l188_c108_ea80_return_output;
     VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_right := VAR_MUX_uxn_c_l187_c52_a010_return_output;
     VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_left := VAR_MUX_uxn_c_l221_c19_fb5b_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l221_c19_fb5b_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_0012_right := VAR_UNARY_OP_NOT_uxn_c_l148_c38_257f_return_output;
     VAR_queue_write_value_uxn_c_l163_c3_2c1f := resize(VAR_uint32_uint1_21_uxn_c_l163_c23_c8d0_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue := VAR_queue_write_value_uxn_c_l163_c3_2c1f;
     -- BIN_OP_OR[uxn_c_l187_c35_8ad8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l187_c35_8ad8_left <= VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_left;
     BIN_OP_OR_uxn_c_l187_c35_8ad8_right <= VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output := BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output;

     -- MUX[uxn_c_l188_c108_6ebb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c108_6ebb_cond <= VAR_MUX_uxn_c_l188_c108_6ebb_cond;
     MUX_uxn_c_l188_c108_6ebb_iftrue <= VAR_MUX_uxn_c_l188_c108_6ebb_iftrue;
     MUX_uxn_c_l188_c108_6ebb_iffalse <= VAR_MUX_uxn_c_l188_c108_6ebb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c108_6ebb_return_output := MUX_uxn_c_l188_c108_6ebb_return_output;

     -- BIN_OP_EQ[uxn_c_l222_c25_9333] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l222_c25_9333_left <= VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_left;
     BIN_OP_EQ_uxn_c_l222_c25_9333_right <= VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_return_output := BIN_OP_EQ_uxn_c_l222_c25_9333_return_output;

     -- BIN_OP_AND[uxn_c_l148_c7_0012] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c7_0012_left <= VAR_BIN_OP_AND_uxn_c_l148_c7_0012_left;
     BIN_OP_AND_uxn_c_l148_c7_0012_right <= VAR_BIN_OP_AND_uxn_c_l148_c7_0012_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c7_0012_return_output := BIN_OP_AND_uxn_c_l148_c7_0012_return_output;

     -- queue_write_value_MUX[uxn_c_l160_c2_69bf] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l160_c2_69bf_cond <= VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_cond;
     queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue <= VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iftrue;
     queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse <= VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output := queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_left := VAR_BIN_OP_AND_uxn_c_l148_c7_0012_return_output;
     VAR_MUX_uxn_c_l222_c25_4c45_cond := VAR_BIN_OP_EQ_uxn_c_l222_c25_9333_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_read_address := VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_read_address := VAR_BIN_OP_OR_uxn_c_l187_c35_8ad8_return_output;
     VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_right := VAR_MUX_uxn_c_l188_c108_6ebb_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_value := VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l160_c2_69bf_return_output;
     -- MUX[uxn_c_l222_c25_4c45] LATENCY=0
     -- Inputs
     MUX_uxn_c_l222_c25_4c45_cond <= VAR_MUX_uxn_c_l222_c25_4c45_cond;
     MUX_uxn_c_l222_c25_4c45_iftrue <= VAR_MUX_uxn_c_l222_c25_4c45_iftrue;
     MUX_uxn_c_l222_c25_4c45_iffalse <= VAR_MUX_uxn_c_l222_c25_4c45_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l222_c25_4c45_return_output := MUX_uxn_c_l222_c25_4c45_return_output;

     -- BIN_OP_AND[uxn_c_l148_c7_17bd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c7_17bd_left <= VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_left;
     BIN_OP_AND_uxn_c_l148_c7_17bd_right <= VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_return_output := BIN_OP_AND_uxn_c_l148_c7_17bd_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_return_output;
     VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_17bd_return_output;
     -- queue_read_ptr_MUX[uxn_c_l148_c2_ecf3] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_cond;
     queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iftrue;
     queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output := queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output;

     -- queue_phase_MUX[uxn_c_l148_c2_ecf3] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l148_c2_ecf3_cond <= VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_cond;
     queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue <= VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iftrue;
     queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse <= VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output := queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output;

     -- current_queue_item_MUX[uxn_c_l148_c2_ecf3] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond <= VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_cond;
     current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue <= VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iftrue;
     current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse <= VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output := current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse := VAR_queue_phase_MUX_uxn_c_l148_c2_ecf3_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_read_address := VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l148_c2_ecf3_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.layer;

     -- draw_queue_update[uxn_c_l212_c21_4d6f] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l212_c21_4d6f_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l212_c21_4d6f_read_address <= VAR_draw_queue_update_uxn_c_l212_c21_4d6f_read_address;
     draw_queue_update_uxn_c_l212_c21_4d6f_write_address <= VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_address;
     draw_queue_update_uxn_c_l212_c21_4d6f_write_value <= VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_value;
     draw_queue_update_uxn_c_l212_c21_4d6f_write_enable <= VAR_draw_queue_update_uxn_c_l212_c21_4d6f_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l212_c21_4d6f_return_output := draw_queue_update_uxn_c_l212_c21_4d6f_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l173_c17_fd34] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_fd34_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.fill_top;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l171_c36_dfe4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_dfe4_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.is_fill;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l174_c18_bd97] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_bd97_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.fill_left;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_5748 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_5748_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output.is_valid;

     -- queue_phase_MUX[uxn_c_l160_c2_69bf] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l160_c2_69bf_cond <= VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_cond;
     queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue <= VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iftrue;
     queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse <= VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_return_output := queue_phase_MUX_uxn_c_l160_c2_69bf_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output;
     VAR_BIN_OP_AND_uxn_c_l178_c32_c496_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output;
     VAR_MUX_uxn_c_l188_c37_1d1d_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_8f4c_return_output, 17);
     VAR_MUX_uxn_c_l176_c13_f51a_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_bd97_return_output;
     VAR_MUX_uxn_c_l178_c13_0766_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_bd97_return_output;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_bd97_return_output;
     VAR_MUX_uxn_c_l175_c13_9c2e_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_fd34_return_output;
     VAR_MUX_uxn_c_l177_c13_6a8b_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_fd34_return_output;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_fd34_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_dfe4_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_5748_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_5748_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c22_8573_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8_return_output;
     VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l179_l202_l209_DUPLICATE_f0a8_return_output;
     VAR_MUX_uxn_c_l201_c3_1939_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28_return_output;
     VAR_MUX_uxn_c_l208_c3_ffff_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28_return_output;
     VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_1c28_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l212_c21_4d6f_return_output;
     VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_left := VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_left := VAR_queue_phase_MUX_uxn_c_l160_c2_69bf_return_output;
     -- UNARY_OP_NOT[uxn_c_l202_c71_a153] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l202_c71_a153_expr <= VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output := UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output;

     -- BIN_OP_EQ[uxn_c_l169_c16_9d3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l169_c16_9d3f_left <= VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_left;
     BIN_OP_EQ_uxn_c_l169_c16_9d3f_right <= VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output := BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output;

     -- BIN_OP_AND[uxn_c_l178_c32_c496] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l178_c32_c496_left <= VAR_BIN_OP_AND_uxn_c_l178_c32_c496_left;
     BIN_OP_AND_uxn_c_l178_c32_c496_right <= VAR_BIN_OP_AND_uxn_c_l178_c32_c496_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l178_c32_c496_return_output := BIN_OP_AND_uxn_c_l178_c32_c496_return_output;

     -- BIN_OP_AND[uxn_c_l176_c28_50a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l176_c28_50a3_left <= VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_left;
     BIN_OP_AND_uxn_c_l176_c28_50a3_right <= VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_return_output := BIN_OP_AND_uxn_c_l176_c28_50a3_return_output;

     -- BIN_OP_PLUS[uxn_c_l169_c39_75b7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l169_c39_75b7_left <= VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_left;
     BIN_OP_PLUS_uxn_c_l169_c39_75b7_right <= VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output := BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output := CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output;

     -- BIN_OP_AND[uxn_c_l171_c6_bb4f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l171_c6_bb4f_left <= VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_left;
     BIN_OP_AND_uxn_c_l171_c6_bb4f_right <= VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output := BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_left := VAR_BIN_OP_AND_uxn_c_l171_c6_bb4f_return_output;
     VAR_MUX_uxn_c_l176_c13_f51a_iftrue := VAR_BIN_OP_AND_uxn_c_l176_c28_50a3_return_output;
     VAR_MUX_uxn_c_l178_c13_0766_iffalse := VAR_BIN_OP_AND_uxn_c_l178_c32_c496_return_output;
     VAR_MUX_uxn_c_l169_c16_dc44_cond := VAR_BIN_OP_EQ_uxn_c_l169_c16_9d3f_return_output;
     VAR_MUX_uxn_c_l169_c16_dc44_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l169_c39_75b7_return_output, 2);
     VAR_MUX_uxn_c_l175_c13_9c2e_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output;
     VAR_MUX_uxn_c_l177_c13_6a8b_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_bc6e_return_output;
     VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_right := VAR_UNARY_OP_NOT_uxn_c_l202_c71_a153_return_output;
     -- MUX[uxn_c_l177_c13_6a8b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c13_6a8b_cond <= VAR_MUX_uxn_c_l177_c13_6a8b_cond;
     MUX_uxn_c_l177_c13_6a8b_iftrue <= VAR_MUX_uxn_c_l177_c13_6a8b_iftrue;
     MUX_uxn_c_l177_c13_6a8b_iffalse <= VAR_MUX_uxn_c_l177_c13_6a8b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c13_6a8b_return_output := MUX_uxn_c_l177_c13_6a8b_return_output;

     -- MUX[uxn_c_l175_c13_9c2e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c13_9c2e_cond <= VAR_MUX_uxn_c_l175_c13_9c2e_cond;
     MUX_uxn_c_l175_c13_9c2e_iftrue <= VAR_MUX_uxn_c_l175_c13_9c2e_iftrue;
     MUX_uxn_c_l175_c13_9c2e_iffalse <= VAR_MUX_uxn_c_l175_c13_9c2e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c13_9c2e_return_output := MUX_uxn_c_l175_c13_9c2e_return_output;

     -- MUX[uxn_c_l178_c13_0766] LATENCY=0
     -- Inputs
     MUX_uxn_c_l178_c13_0766_cond <= VAR_MUX_uxn_c_l178_c13_0766_cond;
     MUX_uxn_c_l178_c13_0766_iftrue <= VAR_MUX_uxn_c_l178_c13_0766_iftrue;
     MUX_uxn_c_l178_c13_0766_iffalse <= VAR_MUX_uxn_c_l178_c13_0766_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l178_c13_0766_return_output := MUX_uxn_c_l178_c13_0766_return_output;

     -- MUX[uxn_c_l176_c13_f51a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c13_f51a_cond <= VAR_MUX_uxn_c_l176_c13_f51a_cond;
     MUX_uxn_c_l176_c13_f51a_iftrue <= VAR_MUX_uxn_c_l176_c13_f51a_iftrue;
     MUX_uxn_c_l176_c13_f51a_iffalse <= VAR_MUX_uxn_c_l176_c13_f51a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c13_f51a_return_output := MUX_uxn_c_l176_c13_f51a_return_output;

     -- BIN_OP_AND[uxn_c_l171_c6_4a77] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l171_c6_4a77_left <= VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_left;
     BIN_OP_AND_uxn_c_l171_c6_4a77_right <= VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output := BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;

     -- MUX[uxn_c_l169_c16_dc44] LATENCY=0
     -- Inputs
     MUX_uxn_c_l169_c16_dc44_cond <= VAR_MUX_uxn_c_l169_c16_dc44_cond;
     MUX_uxn_c_l169_c16_dc44_iftrue <= VAR_MUX_uxn_c_l169_c16_dc44_iftrue;
     MUX_uxn_c_l169_c16_dc44_iffalse <= VAR_MUX_uxn_c_l169_c16_dc44_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l169_c16_dc44_return_output := MUX_uxn_c_l169_c16_dc44_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_x_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     VAR_y_MUX_uxn_c_l171_c2_cca3_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_4a77_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l169_c16_dc44_return_output;
     VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l175_c13_9c2e_return_output;
     VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l176_c13_f51a_return_output;
     VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l177_c13_6a8b_return_output;
     VAR_y_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l177_c13_6a8b_return_output;
     VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l178_c13_0766_return_output;
     VAR_x_MUX_uxn_c_l171_c2_cca3_iftrue := VAR_MUX_uxn_c_l178_c13_0766_return_output;
     -- fill_x0_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_cond;
     fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_return_output := fill_x0_MUX_uxn_c_l171_c2_cca3_return_output;

     -- fill_layer_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_cond;
     fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_return_output := fill_layer_MUX_uxn_c_l171_c2_cca3_return_output;

     -- fill_y0_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_cond;
     fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_return_output := fill_y0_MUX_uxn_c_l171_c2_cca3_return_output;

     -- x_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l171_c2_cca3_cond <= VAR_x_MUX_uxn_c_l171_c2_cca3_cond;
     x_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_x_MUX_uxn_c_l171_c2_cca3_iftrue;
     x_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_x_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l171_c2_cca3_return_output := x_MUX_uxn_c_l171_c2_cca3_return_output;

     -- is_fill_left_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l171_c2_cca3_cond <= VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_cond;
     is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iftrue;
     is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output := is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output;

     -- fill_color_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_color_MUX_uxn_c_l171_c2_cca3_cond;
     fill_color_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_color_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_color_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l171_c2_cca3_return_output := fill_color_MUX_uxn_c_l171_c2_cca3_return_output;

     -- fill_y1_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_cond;
     fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_return_output := fill_y1_MUX_uxn_c_l171_c2_cca3_return_output;

     -- fill_x1_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l171_c2_cca3_cond <= VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_cond;
     fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iftrue;
     fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_return_output := fill_x1_MUX_uxn_c_l171_c2_cca3_return_output;

     -- is_fill_active_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l171_c2_cca3_cond <= VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_cond;
     is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iftrue;
     is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output := is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;

     -- is_fill_top_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l171_c2_cca3_cond <= VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_cond;
     is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iftrue;
     is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output := is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output;

     -- y_MUX[uxn_c_l171_c2_cca3] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l171_c2_cca3_cond <= VAR_y_MUX_uxn_c_l171_c2_cca3_cond;
     y_MUX_uxn_c_l171_c2_cca3_iftrue <= VAR_y_MUX_uxn_c_l171_c2_cca3_iftrue;
     y_MUX_uxn_c_l171_c2_cca3_iffalse <= VAR_y_MUX_uxn_c_l171_c2_cca3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l171_c2_cca3_return_output := y_MUX_uxn_c_l171_c2_cca3_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l201_c3_1939_iftrue := VAR_fill_color_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_MUX_uxn_c_l208_c3_ffff_iftrue := VAR_fill_color_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_right := VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_expr := VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_MUX_uxn_c_l193_c6_0783_iftrue := VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_right := VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_right := VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_left := VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_left := VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_MUX_uxn_c_l188_c37_1d1d_cond := VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_MUX_uxn_c_l219_c19_5a99_cond := VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr := VAR_is_fill_active_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l171_c2_cca3_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_left := VAR_x_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_right := VAR_x_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left := VAR_x_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_left := VAR_y_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left := VAR_y_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_CONST_SL_8_uxn_c_l188_c56_48eb_x := VAR_y_MUX_uxn_c_l171_c2_cca3_return_output;
     VAR_MUX_uxn_c_l192_c6_b287_iffalse := VAR_y_MUX_uxn_c_l171_c2_cca3_return_output;
     -- CONST_SL_8[uxn_c_l188_c56_48eb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l188_c56_48eb_x <= VAR_CONST_SL_8_uxn_c_l188_c56_48eb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l188_c56_48eb_return_output := CONST_SL_8_uxn_c_l188_c56_48eb_return_output;

     -- BIN_OP_PLUS[uxn_c_l192_c25_2e5b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left <= VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_left;
     BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right <= VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output := BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output;

     -- BIN_OP_AND[uxn_c_l196_c27_f1dc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l196_c27_f1dc_left <= VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_left;
     BIN_OP_AND_uxn_c_l196_c27_f1dc_right <= VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output := BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output;

     -- BIN_OP_EQ[uxn_c_l191_c22_f0b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l191_c22_f0b8_left <= VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_left;
     BIN_OP_EQ_uxn_c_l191_c22_f0b8_right <= VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output := BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output;

     -- BIN_OP_EQ[uxn_c_l190_c21_b924] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l190_c21_b924_left <= VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_left;
     BIN_OP_EQ_uxn_c_l190_c21_b924_right <= VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_return_output := BIN_OP_EQ_uxn_c_l190_c21_b924_return_output;

     -- UNARY_OP_NOT[uxn_c_l195_c46_0008] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l195_c46_0008_expr <= VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output := UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output;

     -- BIN_OP_PLUS[uxn_c_l193_c34_eaa0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left <= VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_left;
     BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right <= VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output := BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_left := VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output;
     VAR_MUX_uxn_c_l208_c3_ffff_cond := VAR_BIN_OP_AND_uxn_c_l196_c27_f1dc_return_output;
     VAR_MUX_uxn_c_l190_c21_c625_cond := VAR_BIN_OP_EQ_uxn_c_l190_c21_b924_return_output;
     VAR_MUX_uxn_c_l191_c22_ca3b_cond := VAR_BIN_OP_EQ_uxn_c_l191_c22_f0b8_return_output;
     VAR_MUX_uxn_c_l192_c6_b287_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l192_c25_2e5b_return_output, 16);
     VAR_MUX_uxn_c_l193_c6_0783_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l193_c34_eaa0_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_left := VAR_CONST_SL_8_uxn_c_l188_c56_48eb_return_output;
     VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_right := VAR_UNARY_OP_NOT_uxn_c_l195_c46_0008_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_e474_return_output;
     -- MUX[uxn_c_l191_c22_ca3b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c22_ca3b_cond <= VAR_MUX_uxn_c_l191_c22_ca3b_cond;
     MUX_uxn_c_l191_c22_ca3b_iftrue <= VAR_MUX_uxn_c_l191_c22_ca3b_iftrue;
     MUX_uxn_c_l191_c22_ca3b_iffalse <= VAR_MUX_uxn_c_l191_c22_ca3b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c22_ca3b_return_output := MUX_uxn_c_l191_c22_ca3b_return_output;

     -- BIN_OP_PLUS[uxn_c_l188_c56_3272] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l188_c56_3272_left <= VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_left;
     BIN_OP_PLUS_uxn_c_l188_c56_3272_right <= VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output := BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output;

     -- MUX[uxn_c_l208_c3_ffff] LATENCY=0
     -- Inputs
     MUX_uxn_c_l208_c3_ffff_cond <= VAR_MUX_uxn_c_l208_c3_ffff_cond;
     MUX_uxn_c_l208_c3_ffff_iftrue <= VAR_MUX_uxn_c_l208_c3_ffff_iftrue;
     MUX_uxn_c_l208_c3_ffff_iffalse <= VAR_MUX_uxn_c_l208_c3_ffff_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l208_c3_ffff_return_output := MUX_uxn_c_l208_c3_ffff_return_output;

     -- BIN_OP_AND[uxn_c_l195_c27_9e1d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l195_c27_9e1d_left <= VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_left;
     BIN_OP_AND_uxn_c_l195_c27_9e1d_right <= VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output := BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output;

     -- MUX[uxn_c_l190_c21_c625] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c21_c625_cond <= VAR_MUX_uxn_c_l190_c21_c625_cond;
     MUX_uxn_c_l190_c21_c625_iftrue <= VAR_MUX_uxn_c_l190_c21_c625_iftrue;
     MUX_uxn_c_l190_c21_c625_iffalse <= VAR_MUX_uxn_c_l190_c21_c625_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c21_c625_return_output := MUX_uxn_c_l190_c21_c625_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l202_c3_b534_left := VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output;
     VAR_MUX_uxn_c_l201_c3_1939_cond := VAR_BIN_OP_AND_uxn_c_l195_c27_9e1d_return_output;
     VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c22_8573_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_3224_return_output;
     VAR_MUX_uxn_c_l188_c37_1d1d_iftrue := VAR_BIN_OP_PLUS_uxn_c_l188_c56_3272_return_output;
     VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_left := VAR_MUX_uxn_c_l190_c21_c625_return_output;
     VAR_MUX_uxn_c_l192_c6_b287_cond := VAR_MUX_uxn_c_l190_c21_c625_return_output;
     VAR_MUX_uxn_c_l193_c6_0783_cond := VAR_MUX_uxn_c_l190_c21_c625_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l190_c21_c625_return_output;
     VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_right := VAR_MUX_uxn_c_l191_c22_ca3b_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l191_c22_ca3b_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_value := VAR_MUX_uxn_c_l208_c3_ffff_return_output;
     -- MUX[uxn_c_l201_c3_1939] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c3_1939_cond <= VAR_MUX_uxn_c_l201_c3_1939_cond;
     MUX_uxn_c_l201_c3_1939_iftrue <= VAR_MUX_uxn_c_l201_c3_1939_iftrue;
     MUX_uxn_c_l201_c3_1939_iffalse <= VAR_MUX_uxn_c_l201_c3_1939_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c3_1939_return_output := MUX_uxn_c_l201_c3_1939_return_output;

     -- MUX[uxn_c_l192_c6_b287] LATENCY=0
     -- Inputs
     MUX_uxn_c_l192_c6_b287_cond <= VAR_MUX_uxn_c_l192_c6_b287_cond;
     MUX_uxn_c_l192_c6_b287_iftrue <= VAR_MUX_uxn_c_l192_c6_b287_iftrue;
     MUX_uxn_c_l192_c6_b287_iffalse <= VAR_MUX_uxn_c_l192_c6_b287_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l192_c6_b287_return_output := MUX_uxn_c_l192_c6_b287_return_output;

     -- BIN_OP_AND[uxn_c_l209_c22_8573] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c22_8573_left <= VAR_BIN_OP_AND_uxn_c_l209_c22_8573_left;
     BIN_OP_AND_uxn_c_l209_c22_8573_right <= VAR_BIN_OP_AND_uxn_c_l209_c22_8573_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c22_8573_return_output := BIN_OP_AND_uxn_c_l209_c22_8573_return_output;

     -- BIN_OP_AND[uxn_c_l219_c38_ae79] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l219_c38_ae79_left <= VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_left;
     BIN_OP_AND_uxn_c_l219_c38_ae79_right <= VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_return_output := BIN_OP_AND_uxn_c_l219_c38_ae79_return_output;

     -- BIN_OP_AND[uxn_c_l202_c22_42ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c22_42ac_left <= VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_left;
     BIN_OP_AND_uxn_c_l202_c22_42ac_right <= VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_return_output := BIN_OP_AND_uxn_c_l202_c22_42ac_return_output;

     -- MUX[uxn_c_l193_c6_0783] LATENCY=0
     -- Inputs
     MUX_uxn_c_l193_c6_0783_cond <= VAR_MUX_uxn_c_l193_c6_0783_cond;
     MUX_uxn_c_l193_c6_0783_iftrue <= VAR_MUX_uxn_c_l193_c6_0783_iftrue;
     MUX_uxn_c_l193_c6_0783_iffalse <= VAR_MUX_uxn_c_l193_c6_0783_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l193_c6_0783_return_output := MUX_uxn_c_l193_c6_0783_return_output;

     -- MUX[uxn_c_l188_c37_1d1d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c37_1d1d_cond <= VAR_MUX_uxn_c_l188_c37_1d1d_cond;
     MUX_uxn_c_l188_c37_1d1d_iftrue <= VAR_MUX_uxn_c_l188_c37_1d1d_iftrue;
     MUX_uxn_c_l188_c37_1d1d_iffalse <= VAR_MUX_uxn_c_l188_c37_1d1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c37_1d1d_return_output := MUX_uxn_c_l188_c37_1d1d_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l202_c3_b534_right := VAR_BIN_OP_AND_uxn_c_l202_c22_42ac_return_output;
     VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_right := VAR_BIN_OP_AND_uxn_c_l209_c22_8573_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_expr := VAR_BIN_OP_AND_uxn_c_l219_c38_ae79_return_output;
     VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_left := VAR_MUX_uxn_c_l188_c37_1d1d_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l192_c6_b287_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l193_c6_0783_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_value := VAR_MUX_uxn_c_l201_c3_1939_return_output;
     -- BIN_OP_OR[uxn_c_l209_c3_5eef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l209_c3_5eef_left <= VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_left;
     BIN_OP_OR_uxn_c_l209_c3_5eef_right <= VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_return_output := BIN_OP_OR_uxn_c_l209_c3_5eef_return_output;

     -- BIN_OP_OR[uxn_c_l202_c3_b534] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l202_c3_b534_left <= VAR_BIN_OP_OR_uxn_c_l202_c3_b534_left;
     BIN_OP_OR_uxn_c_l202_c3_b534_right <= VAR_BIN_OP_OR_uxn_c_l202_c3_b534_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l202_c3_b534_return_output := BIN_OP_OR_uxn_c_l202_c3_b534_return_output;

     -- BIN_OP_OR[uxn_c_l188_c37_a66c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l188_c37_a66c_left <= VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_left;
     BIN_OP_OR_uxn_c_l188_c37_a66c_right <= VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_return_output := BIN_OP_OR_uxn_c_l188_c37_a66c_return_output;

     -- UNARY_OP_NOT[uxn_c_l219_c38_5746] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l219_c38_5746_expr <= VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output := UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_address := VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_address := VAR_BIN_OP_OR_uxn_c_l188_c37_a66c_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_enable := VAR_BIN_OP_OR_uxn_c_l202_c3_b534_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_enable := VAR_BIN_OP_OR_uxn_c_l209_c3_5eef_return_output;
     VAR_MUX_uxn_c_l219_c19_5a99_iftrue := VAR_UNARY_OP_NOT_uxn_c_l219_c38_5746_return_output;
     -- bg_vram_update[uxn_c_l198_c27_5f4a] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l198_c27_5f4a_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l198_c27_5f4a_read_address <= VAR_bg_vram_update_uxn_c_l198_c27_5f4a_read_address;
     bg_vram_update_uxn_c_l198_c27_5f4a_write_address <= VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_address;
     bg_vram_update_uxn_c_l198_c27_5f4a_write_value <= VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_value;
     bg_vram_update_uxn_c_l198_c27_5f4a_write_enable <= VAR_bg_vram_update_uxn_c_l198_c27_5f4a_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l198_c27_5f4a_return_output := bg_vram_update_uxn_c_l198_c27_5f4a_return_output;

     -- MUX[uxn_c_l219_c19_5a99] LATENCY=0
     -- Inputs
     MUX_uxn_c_l219_c19_5a99_cond <= VAR_MUX_uxn_c_l219_c19_5a99_cond;
     MUX_uxn_c_l219_c19_5a99_iftrue <= VAR_MUX_uxn_c_l219_c19_5a99_iftrue;
     MUX_uxn_c_l219_c19_5a99_iffalse <= VAR_MUX_uxn_c_l219_c19_5a99_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l219_c19_5a99_return_output := MUX_uxn_c_l219_c19_5a99_return_output;

     -- fg_vram_update[uxn_c_l205_c27_6b02] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l205_c27_6b02_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l205_c27_6b02_read_address <= VAR_fg_vram_update_uxn_c_l205_c27_6b02_read_address;
     fg_vram_update_uxn_c_l205_c27_6b02_write_address <= VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_address;
     fg_vram_update_uxn_c_l205_c27_6b02_write_value <= VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_value;
     fg_vram_update_uxn_c_l205_c27_6b02_write_enable <= VAR_fg_vram_update_uxn_c_l205_c27_6b02_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l205_c27_6b02_return_output := fg_vram_update_uxn_c_l205_c27_6b02_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l219_c19_5a99_return_output;
     VAR_MUX_uxn_c_l223_c17_b19f_iftrue := VAR_bg_vram_update_uxn_c_l198_c27_5f4a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_left := VAR_fg_vram_update_uxn_c_l205_c27_6b02_return_output;
     VAR_MUX_uxn_c_l223_c17_b19f_iffalse := VAR_fg_vram_update_uxn_c_l205_c27_6b02_return_output;
     -- BIN_OP_EQ[uxn_c_l223_c17_76a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l223_c17_76a2_left <= VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_left;
     BIN_OP_EQ_uxn_c_l223_c17_76a2_right <= VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output := BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output;

     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l123_c19_69d6] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_69d6_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l148_c2_ecf3_return_output,
     VAR_MUX_uxn_c_l219_c19_5a99_return_output);

     -- Submodule level 16
     VAR_MUX_uxn_c_l223_c17_b19f_cond := VAR_BIN_OP_EQ_uxn_c_l223_c17_76a2_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_69d6_return_output;
     -- MUX[uxn_c_l223_c17_b19f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l223_c17_b19f_cond <= VAR_MUX_uxn_c_l223_c17_b19f_cond;
     MUX_uxn_c_l223_c17_b19f_iftrue <= VAR_MUX_uxn_c_l223_c17_b19f_iftrue;
     MUX_uxn_c_l223_c17_b19f_iffalse <= VAR_MUX_uxn_c_l223_c17_b19f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l223_c17_b19f_return_output := MUX_uxn_c_l223_c17_b19f_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l225_l123_DUPLICATE_4e82 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l225_l123_DUPLICATE_4e82_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l222_c25_4c45_return_output,
     VAR_MUX_uxn_c_l223_c17_b19f_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l225_l123_DUPLICATE_4e82_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l225_l123_DUPLICATE_4e82_return_output;
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
