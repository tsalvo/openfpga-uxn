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
-- BIN_OP_XOR[uxn_c_l144_c2_6c55]
signal BIN_OP_XOR_uxn_c_l144_c2_6c55_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l144_c2_6c55_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l145_c17_7e9e]
signal BIN_OP_EQ_uxn_c_l145_c17_7e9e_left : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l145_c17_7e9e_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l145_c17_eb5e]
signal MUX_uxn_c_l145_c17_eb5e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_eb5e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_eb5e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l145_c17_eb5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l146_c18_801b]
signal BIN_OP_EQ_uxn_c_l146_c18_801b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l146_c18_801b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l146_c18_801b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l146_c18_6e9f]
signal MUX_uxn_c_l146_c18_6e9f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_6e9f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_6e9f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l146_c18_6e9f_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l148_c7_ecae]
signal UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l148_c38_9314]
signal UNARY_OP_NOT_uxn_c_l148_c38_9314_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c7_8e11]
signal BIN_OP_AND_uxn_c_l148_c7_8e11_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_8e11_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_8e11_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l148_c7_329d]
signal BIN_OP_AND_uxn_c_l148_c7_329d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_329d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l148_c7_329d_return_output : unsigned(0 downto 0);

-- current_queue_item_MUX[uxn_c_l148_c2_2953]
signal current_queue_item_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l148_c2_2953_return_output : draw_command_t;

-- queue_read_ptr_MUX[uxn_c_l148_c2_2953]
signal queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l148_c2_2953]
signal queue_phase_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_2953_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_2953_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l148_c2_2953_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l157_c3_7889]
signal BIN_OP_PLUS_uxn_c_l157_c3_7889_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c3_7889_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output : unsigned(10 downto 0);

-- queue_write_value_MUX[uxn_c_l160_c2_cbe1]
signal queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(23 downto 0);

-- queue_write_ptr_MUX[uxn_c_l160_c2_cbe1]
signal queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l160_c2_cbe1]
signal queue_phase_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l165_c3_61fe]
signal BIN_OP_PLUS_uxn_c_l165_c3_61fe_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l165_c3_61fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output : unsigned(10 downto 0);

-- BIN_OP_EQ[uxn_c_l169_c16_3da8]
signal BIN_OP_EQ_uxn_c_l169_c16_3da8_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l169_c16_3da8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l169_c39_fa89]
signal BIN_OP_PLUS_uxn_c_l169_c39_fa89_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c39_fa89_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l169_c16_15ca]
signal MUX_uxn_c_l169_c16_15ca_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l169_c16_15ca_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c16_15ca_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l169_c16_15ca_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l171_c6_a5c8]
signal BIN_OP_AND_uxn_c_l171_c6_a5c8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_a5c8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l171_c66_678c]
signal UNARY_OP_NOT_uxn_c_l171_c66_678c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l171_c6_5d79]
signal BIN_OP_AND_uxn_c_l171_c6_5d79_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_5d79_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l171_c6_5d79_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l171_c2_ee99]
signal y_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- fill_layer_MUX[uxn_c_l171_c2_ee99]
signal fill_layer_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l171_c2_ee99]
signal x_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l171_c2_ee99]
signal fill_x0_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l171_c2_ee99]
signal fill_x1_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l171_c2_ee99]
signal fill_color_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(1 downto 0);

-- fill_y0_MUX[uxn_c_l171_c2_ee99]
signal fill_y0_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- fill_y1_MUX[uxn_c_l171_c2_ee99]
signal fill_y1_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);

-- is_fill_left_MUX[uxn_c_l171_c2_ee99]
signal is_fill_left_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);

-- is_fill_top_MUX[uxn_c_l171_c2_ee99]
signal is_fill_top_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l171_c2_ee99]
signal is_fill_active_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l175_c13_a9ea]
signal MUX_uxn_c_l175_c13_a9ea_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l175_c13_a9ea_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c13_a9ea_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l175_c13_a9ea_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l176_c28_a0c0]
signal BIN_OP_AND_uxn_c_l176_c28_a0c0_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l176_c28_a0c0_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l176_c13_4868]
signal MUX_uxn_c_l176_c13_4868_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l176_c13_4868_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l176_c13_4868_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l176_c13_4868_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l177_c13_6ac1]
signal MUX_uxn_c_l177_c13_6ac1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l177_c13_6ac1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c13_6ac1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l177_c13_6ac1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l178_c32_a1c2]
signal BIN_OP_AND_uxn_c_l178_c32_a1c2_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l178_c32_a1c2_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l178_c13_88f2]
signal MUX_uxn_c_l178_c13_88f2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l178_c13_88f2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l178_c13_88f2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l178_c13_88f2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l187_c52_7fcf]
signal BIN_OP_AND_uxn_c_l187_c52_7fcf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l187_c52_7fcf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l187_c52_48c0]
signal MUX_uxn_c_l187_c52_48c0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l187_c52_48c0_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l187_c52_48c0_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l187_c52_48c0_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l187_c35_c69d]
signal BIN_OP_OR_uxn_c_l187_c35_c69d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l187_c35_c69d_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l187_c35_c69d_return_output : unsigned(16 downto 0);

-- CONST_SL_8[uxn_c_l188_c56_e461]
signal CONST_SL_8_uxn_c_l188_c56_e461_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l188_c56_e461_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l188_c56_127c]
signal BIN_OP_PLUS_uxn_c_l188_c56_127c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c56_127c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l188_c37_5884]
signal MUX_uxn_c_l188_c37_5884_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c37_5884_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c37_5884_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c37_5884_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l188_c108_299a]
signal UNARY_OP_NOT_uxn_c_l188_c108_299a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l188_c108_b5bf]
signal BIN_OP_AND_uxn_c_l188_c108_b5bf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l188_c108_b5bf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l188_c108_6d0c]
signal MUX_uxn_c_l188_c108_6d0c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c108_6d0c_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c108_6d0c_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l188_c108_6d0c_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l188_c37_67bf]
signal BIN_OP_OR_uxn_c_l188_c37_67bf_left : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l188_c37_67bf_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l188_c37_67bf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l190_c21_eed4]
signal BIN_OP_EQ_uxn_c_l190_c21_eed4_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c21_eed4_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l190_c21_5893]
signal MUX_uxn_c_l190_c21_5893_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_5893_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_5893_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c21_5893_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l191_c22_cb81]
signal BIN_OP_EQ_uxn_c_l191_c22_cb81_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c22_cb81_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l191_c22_0782]
signal MUX_uxn_c_l191_c22_0782_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_0782_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_0782_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c22_0782_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l192_c25_ceff]
signal BIN_OP_PLUS_uxn_c_l192_c25_ceff_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l192_c25_ceff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l192_c6_144d]
signal MUX_uxn_c_l192_c6_144d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l192_c6_144d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l192_c6_144d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l192_c6_144d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l193_c34_50b6]
signal BIN_OP_PLUS_uxn_c_l193_c34_50b6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l193_c34_50b6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l193_c6_f84a]
signal MUX_uxn_c_l193_c6_f84a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l193_c6_f84a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l193_c6_f84a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l193_c6_f84a_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l195_c46_3c4c]
signal UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l195_c27_206a]
signal BIN_OP_AND_uxn_c_l195_c27_206a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l195_c27_206a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l195_c27_206a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l196_c27_535e]
signal BIN_OP_AND_uxn_c_l196_c27_535e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l196_c27_535e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l196_c27_535e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c3_0fe6]
signal MUX_uxn_c_l201_c3_0fe6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c3_0fe6_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l201_c3_0fe6_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l201_c3_0fe6_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l202_c71_a79a]
signal UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l202_c22_a263]
signal BIN_OP_AND_uxn_c_l202_c22_a263_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c22_a263_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l202_c22_a263_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l202_c3_d350]
signal BIN_OP_OR_uxn_c_l202_c3_d350_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l202_c3_d350_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l202_c3_d350_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l198_c27_3d56]
signal bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l198_c27_3d56_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l198_c27_3d56_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l198_c27_3d56_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l198_c27_3d56_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l198_c27_3d56_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l208_c3_bcdc]
signal MUX_uxn_c_l208_c3_bcdc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l208_c3_bcdc_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l208_c3_bcdc_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l208_c3_bcdc_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l209_c22_5c76]
signal BIN_OP_AND_uxn_c_l209_c22_5c76_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c22_5c76_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c22_5c76_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l209_c3_56b4]
signal BIN_OP_OR_uxn_c_l209_c3_56b4_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l209_c3_56b4_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l209_c3_56b4_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l205_c27_f38e]
signal fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l205_c27_f38e_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l205_c27_f38e_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l205_c27_f38e_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l205_c27_f38e_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l205_c27_f38e_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l212_c21_4058]
signal draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4058_read_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4058_write_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4058_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4058_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l212_c21_4058_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l219_c38_64d1]
signal BIN_OP_AND_uxn_c_l219_c38_64d1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l219_c38_64d1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l219_c38_64d1_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l219_c38_9eac]
signal UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l219_c19_10d7]
signal MUX_uxn_c_l219_c19_10d7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_10d7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_10d7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l219_c19_10d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l221_c19_316f]
signal BIN_OP_EQ_uxn_c_l221_c19_316f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c19_316f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l221_c19_316f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l221_c76_8765]
signal BIN_OP_PLUS_uxn_c_l221_c76_8765_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l221_c76_8765_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l221_c50_9f8d]
signal MUX_uxn_c_l221_c50_9f8d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c50_9f8d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c50_9f8d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c50_9f8d_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l221_c19_21dd]
signal MUX_uxn_c_l221_c19_21dd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c19_21dd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c19_21dd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l221_c19_21dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l222_c25_c5d6]
signal BIN_OP_EQ_uxn_c_l222_c25_c5d6_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l222_c25_c5d6_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l222_c25_4fb9]
signal MUX_uxn_c_l222_c25_4fb9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4fb9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4fb9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l222_c25_4fb9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l223_c17_d95c]
signal BIN_OP_EQ_uxn_c_l223_c17_d95c_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c17_d95c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l223_c17_a9e8]
signal MUX_uxn_c_l223_c17_a9e8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l223_c17_a9e8_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l223_c17_a9e8_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l223_c17_a9e8_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69
signal CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4
signal UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l144_c2_6c55
BIN_OP_XOR_uxn_c_l144_c2_6c55 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l144_c2_6c55_left,
BIN_OP_XOR_uxn_c_l144_c2_6c55_right,
BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output);

-- BIN_OP_EQ_uxn_c_l145_c17_7e9e
BIN_OP_EQ_uxn_c_l145_c17_7e9e : entity work.BIN_OP_EQ_uint10_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l145_c17_7e9e_left,
BIN_OP_EQ_uxn_c_l145_c17_7e9e_right,
BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output);

-- MUX_uxn_c_l145_c17_eb5e
MUX_uxn_c_l145_c17_eb5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l145_c17_eb5e_cond,
MUX_uxn_c_l145_c17_eb5e_iftrue,
MUX_uxn_c_l145_c17_eb5e_iffalse,
MUX_uxn_c_l145_c17_eb5e_return_output);

-- BIN_OP_EQ_uxn_c_l146_c18_801b
BIN_OP_EQ_uxn_c_l146_c18_801b : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l146_c18_801b_left,
BIN_OP_EQ_uxn_c_l146_c18_801b_right,
BIN_OP_EQ_uxn_c_l146_c18_801b_return_output);

-- MUX_uxn_c_l146_c18_6e9f
MUX_uxn_c_l146_c18_6e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l146_c18_6e9f_cond,
MUX_uxn_c_l146_c18_6e9f_iftrue,
MUX_uxn_c_l146_c18_6e9f_iffalse,
MUX_uxn_c_l146_c18_6e9f_return_output);

-- UNARY_OP_NOT_uxn_c_l148_c7_ecae
UNARY_OP_NOT_uxn_c_l148_c7_ecae : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr,
UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output);

-- UNARY_OP_NOT_uxn_c_l148_c38_9314
UNARY_OP_NOT_uxn_c_l148_c38_9314 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l148_c38_9314_expr,
UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output);

-- BIN_OP_AND_uxn_c_l148_c7_8e11
BIN_OP_AND_uxn_c_l148_c7_8e11 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c7_8e11_left,
BIN_OP_AND_uxn_c_l148_c7_8e11_right,
BIN_OP_AND_uxn_c_l148_c7_8e11_return_output);

-- BIN_OP_AND_uxn_c_l148_c7_329d
BIN_OP_AND_uxn_c_l148_c7_329d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l148_c7_329d_left,
BIN_OP_AND_uxn_c_l148_c7_329d_right,
BIN_OP_AND_uxn_c_l148_c7_329d_return_output);

-- current_queue_item_MUX_uxn_c_l148_c2_2953
current_queue_item_MUX_uxn_c_l148_c2_2953 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l148_c2_2953_cond,
current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue,
current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse,
current_queue_item_MUX_uxn_c_l148_c2_2953_return_output);

-- queue_read_ptr_MUX_uxn_c_l148_c2_2953
queue_read_ptr_MUX_uxn_c_l148_c2_2953 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond,
queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue,
queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse,
queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output);

-- queue_phase_MUX_uxn_c_l148_c2_2953
queue_phase_MUX_uxn_c_l148_c2_2953 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l148_c2_2953_cond,
queue_phase_MUX_uxn_c_l148_c2_2953_iftrue,
queue_phase_MUX_uxn_c_l148_c2_2953_iffalse,
queue_phase_MUX_uxn_c_l148_c2_2953_return_output);

-- BIN_OP_PLUS_uxn_c_l157_c3_7889
BIN_OP_PLUS_uxn_c_l157_c3_7889 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l157_c3_7889_left,
BIN_OP_PLUS_uxn_c_l157_c3_7889_right,
BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output);

-- queue_write_value_MUX_uxn_c_l160_c2_cbe1
queue_write_value_MUX_uxn_c_l160_c2_cbe1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond,
queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue,
queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse,
queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output);

-- queue_write_ptr_MUX_uxn_c_l160_c2_cbe1
queue_write_ptr_MUX_uxn_c_l160_c2_cbe1 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond,
queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue,
queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse,
queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output);

-- queue_phase_MUX_uxn_c_l160_c2_cbe1
queue_phase_MUX_uxn_c_l160_c2_cbe1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l160_c2_cbe1_cond,
queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue,
queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse,
queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output);

-- BIN_OP_PLUS_uxn_c_l165_c3_61fe
BIN_OP_PLUS_uxn_c_l165_c3_61fe : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l165_c3_61fe_left,
BIN_OP_PLUS_uxn_c_l165_c3_61fe_right,
BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output);

-- BIN_OP_EQ_uxn_c_l169_c16_3da8
BIN_OP_EQ_uxn_c_l169_c16_3da8 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l169_c16_3da8_left,
BIN_OP_EQ_uxn_c_l169_c16_3da8_right,
BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output);

-- BIN_OP_PLUS_uxn_c_l169_c39_fa89
BIN_OP_PLUS_uxn_c_l169_c39_fa89 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l169_c39_fa89_left,
BIN_OP_PLUS_uxn_c_l169_c39_fa89_right,
BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output);

-- MUX_uxn_c_l169_c16_15ca
MUX_uxn_c_l169_c16_15ca : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l169_c16_15ca_cond,
MUX_uxn_c_l169_c16_15ca_iftrue,
MUX_uxn_c_l169_c16_15ca_iffalse,
MUX_uxn_c_l169_c16_15ca_return_output);

-- BIN_OP_AND_uxn_c_l171_c6_a5c8
BIN_OP_AND_uxn_c_l171_c6_a5c8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l171_c6_a5c8_left,
BIN_OP_AND_uxn_c_l171_c6_a5c8_right,
BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output);

-- UNARY_OP_NOT_uxn_c_l171_c66_678c
UNARY_OP_NOT_uxn_c_l171_c66_678c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l171_c66_678c_expr,
UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output);

-- BIN_OP_AND_uxn_c_l171_c6_5d79
BIN_OP_AND_uxn_c_l171_c6_5d79 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l171_c6_5d79_left,
BIN_OP_AND_uxn_c_l171_c6_5d79_right,
BIN_OP_AND_uxn_c_l171_c6_5d79_return_output);

-- y_MUX_uxn_c_l171_c2_ee99
y_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l171_c2_ee99_cond,
y_MUX_uxn_c_l171_c2_ee99_iftrue,
y_MUX_uxn_c_l171_c2_ee99_iffalse,
y_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_layer_MUX_uxn_c_l171_c2_ee99
fill_layer_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l171_c2_ee99_cond,
fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_layer_MUX_uxn_c_l171_c2_ee99_return_output);

-- x_MUX_uxn_c_l171_c2_ee99
x_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l171_c2_ee99_cond,
x_MUX_uxn_c_l171_c2_ee99_iftrue,
x_MUX_uxn_c_l171_c2_ee99_iffalse,
x_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_x0_MUX_uxn_c_l171_c2_ee99
fill_x0_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l171_c2_ee99_cond,
fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_x0_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_x1_MUX_uxn_c_l171_c2_ee99
fill_x1_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l171_c2_ee99_cond,
fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_x1_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_color_MUX_uxn_c_l171_c2_ee99
fill_color_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l171_c2_ee99_cond,
fill_color_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_color_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_color_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_y0_MUX_uxn_c_l171_c2_ee99
fill_y0_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l171_c2_ee99_cond,
fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_y0_MUX_uxn_c_l171_c2_ee99_return_output);

-- fill_y1_MUX_uxn_c_l171_c2_ee99
fill_y1_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l171_c2_ee99_cond,
fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue,
fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse,
fill_y1_MUX_uxn_c_l171_c2_ee99_return_output);

-- is_fill_left_MUX_uxn_c_l171_c2_ee99
is_fill_left_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l171_c2_ee99_cond,
is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue,
is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse,
is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output);

-- is_fill_top_MUX_uxn_c_l171_c2_ee99
is_fill_top_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l171_c2_ee99_cond,
is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue,
is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse,
is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output);

-- is_fill_active_MUX_uxn_c_l171_c2_ee99
is_fill_active_MUX_uxn_c_l171_c2_ee99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l171_c2_ee99_cond,
is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue,
is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse,
is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output);

-- MUX_uxn_c_l175_c13_a9ea
MUX_uxn_c_l175_c13_a9ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l175_c13_a9ea_cond,
MUX_uxn_c_l175_c13_a9ea_iftrue,
MUX_uxn_c_l175_c13_a9ea_iffalse,
MUX_uxn_c_l175_c13_a9ea_return_output);

-- BIN_OP_AND_uxn_c_l176_c28_a0c0
BIN_OP_AND_uxn_c_l176_c28_a0c0 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l176_c28_a0c0_left,
BIN_OP_AND_uxn_c_l176_c28_a0c0_right,
BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output);

-- MUX_uxn_c_l176_c13_4868
MUX_uxn_c_l176_c13_4868 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l176_c13_4868_cond,
MUX_uxn_c_l176_c13_4868_iftrue,
MUX_uxn_c_l176_c13_4868_iffalse,
MUX_uxn_c_l176_c13_4868_return_output);

-- MUX_uxn_c_l177_c13_6ac1
MUX_uxn_c_l177_c13_6ac1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l177_c13_6ac1_cond,
MUX_uxn_c_l177_c13_6ac1_iftrue,
MUX_uxn_c_l177_c13_6ac1_iffalse,
MUX_uxn_c_l177_c13_6ac1_return_output);

-- BIN_OP_AND_uxn_c_l178_c32_a1c2
BIN_OP_AND_uxn_c_l178_c32_a1c2 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l178_c32_a1c2_left,
BIN_OP_AND_uxn_c_l178_c32_a1c2_right,
BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output);

-- MUX_uxn_c_l178_c13_88f2
MUX_uxn_c_l178_c13_88f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l178_c13_88f2_cond,
MUX_uxn_c_l178_c13_88f2_iftrue,
MUX_uxn_c_l178_c13_88f2_iffalse,
MUX_uxn_c_l178_c13_88f2_return_output);

-- BIN_OP_AND_uxn_c_l187_c52_7fcf
BIN_OP_AND_uxn_c_l187_c52_7fcf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l187_c52_7fcf_left,
BIN_OP_AND_uxn_c_l187_c52_7fcf_right,
BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output);

-- MUX_uxn_c_l187_c52_48c0
MUX_uxn_c_l187_c52_48c0 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l187_c52_48c0_cond,
MUX_uxn_c_l187_c52_48c0_iftrue,
MUX_uxn_c_l187_c52_48c0_iffalse,
MUX_uxn_c_l187_c52_48c0_return_output);

-- BIN_OP_OR_uxn_c_l187_c35_c69d
BIN_OP_OR_uxn_c_l187_c35_c69d : entity work.BIN_OP_OR_uint16_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l187_c35_c69d_left,
BIN_OP_OR_uxn_c_l187_c35_c69d_right,
BIN_OP_OR_uxn_c_l187_c35_c69d_return_output);

-- CONST_SL_8_uxn_c_l188_c56_e461
CONST_SL_8_uxn_c_l188_c56_e461 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l188_c56_e461_x,
CONST_SL_8_uxn_c_l188_c56_e461_return_output);

-- BIN_OP_PLUS_uxn_c_l188_c56_127c
BIN_OP_PLUS_uxn_c_l188_c56_127c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l188_c56_127c_left,
BIN_OP_PLUS_uxn_c_l188_c56_127c_right,
BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output);

-- MUX_uxn_c_l188_c37_5884
MUX_uxn_c_l188_c37_5884 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c37_5884_cond,
MUX_uxn_c_l188_c37_5884_iftrue,
MUX_uxn_c_l188_c37_5884_iffalse,
MUX_uxn_c_l188_c37_5884_return_output);

-- UNARY_OP_NOT_uxn_c_l188_c108_299a
UNARY_OP_NOT_uxn_c_l188_c108_299a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l188_c108_299a_expr,
UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output);

-- BIN_OP_AND_uxn_c_l188_c108_b5bf
BIN_OP_AND_uxn_c_l188_c108_b5bf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c108_b5bf_left,
BIN_OP_AND_uxn_c_l188_c108_b5bf_right,
BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output);

-- MUX_uxn_c_l188_c108_6d0c
MUX_uxn_c_l188_c108_6d0c : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c108_6d0c_cond,
MUX_uxn_c_l188_c108_6d0c_iftrue,
MUX_uxn_c_l188_c108_6d0c_iffalse,
MUX_uxn_c_l188_c108_6d0c_return_output);

-- BIN_OP_OR_uxn_c_l188_c37_67bf
BIN_OP_OR_uxn_c_l188_c37_67bf : entity work.BIN_OP_OR_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l188_c37_67bf_left,
BIN_OP_OR_uxn_c_l188_c37_67bf_right,
BIN_OP_OR_uxn_c_l188_c37_67bf_return_output);

-- BIN_OP_EQ_uxn_c_l190_c21_eed4
BIN_OP_EQ_uxn_c_l190_c21_eed4 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l190_c21_eed4_left,
BIN_OP_EQ_uxn_c_l190_c21_eed4_right,
BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output);

-- MUX_uxn_c_l190_c21_5893
MUX_uxn_c_l190_c21_5893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c21_5893_cond,
MUX_uxn_c_l190_c21_5893_iftrue,
MUX_uxn_c_l190_c21_5893_iffalse,
MUX_uxn_c_l190_c21_5893_return_output);

-- BIN_OP_EQ_uxn_c_l191_c22_cb81
BIN_OP_EQ_uxn_c_l191_c22_cb81 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l191_c22_cb81_left,
BIN_OP_EQ_uxn_c_l191_c22_cb81_right,
BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output);

-- MUX_uxn_c_l191_c22_0782
MUX_uxn_c_l191_c22_0782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c22_0782_cond,
MUX_uxn_c_l191_c22_0782_iftrue,
MUX_uxn_c_l191_c22_0782_iffalse,
MUX_uxn_c_l191_c22_0782_return_output);

-- BIN_OP_PLUS_uxn_c_l192_c25_ceff
BIN_OP_PLUS_uxn_c_l192_c25_ceff : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l192_c25_ceff_left,
BIN_OP_PLUS_uxn_c_l192_c25_ceff_right,
BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output);

-- MUX_uxn_c_l192_c6_144d
MUX_uxn_c_l192_c6_144d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l192_c6_144d_cond,
MUX_uxn_c_l192_c6_144d_iftrue,
MUX_uxn_c_l192_c6_144d_iffalse,
MUX_uxn_c_l192_c6_144d_return_output);

-- BIN_OP_PLUS_uxn_c_l193_c34_50b6
BIN_OP_PLUS_uxn_c_l193_c34_50b6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l193_c34_50b6_left,
BIN_OP_PLUS_uxn_c_l193_c34_50b6_right,
BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output);

-- MUX_uxn_c_l193_c6_f84a
MUX_uxn_c_l193_c6_f84a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l193_c6_f84a_cond,
MUX_uxn_c_l193_c6_f84a_iftrue,
MUX_uxn_c_l193_c6_f84a_iffalse,
MUX_uxn_c_l193_c6_f84a_return_output);

-- UNARY_OP_NOT_uxn_c_l195_c46_3c4c
UNARY_OP_NOT_uxn_c_l195_c46_3c4c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr,
UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output);

-- BIN_OP_AND_uxn_c_l195_c27_206a
BIN_OP_AND_uxn_c_l195_c27_206a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l195_c27_206a_left,
BIN_OP_AND_uxn_c_l195_c27_206a_right,
BIN_OP_AND_uxn_c_l195_c27_206a_return_output);

-- BIN_OP_AND_uxn_c_l196_c27_535e
BIN_OP_AND_uxn_c_l196_c27_535e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l196_c27_535e_left,
BIN_OP_AND_uxn_c_l196_c27_535e_right,
BIN_OP_AND_uxn_c_l196_c27_535e_return_output);

-- MUX_uxn_c_l201_c3_0fe6
MUX_uxn_c_l201_c3_0fe6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c3_0fe6_cond,
MUX_uxn_c_l201_c3_0fe6_iftrue,
MUX_uxn_c_l201_c3_0fe6_iffalse,
MUX_uxn_c_l201_c3_0fe6_return_output);

-- UNARY_OP_NOT_uxn_c_l202_c71_a79a
UNARY_OP_NOT_uxn_c_l202_c71_a79a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr,
UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output);

-- BIN_OP_AND_uxn_c_l202_c22_a263
BIN_OP_AND_uxn_c_l202_c22_a263 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c22_a263_left,
BIN_OP_AND_uxn_c_l202_c22_a263_right,
BIN_OP_AND_uxn_c_l202_c22_a263_return_output);

-- BIN_OP_OR_uxn_c_l202_c3_d350
BIN_OP_OR_uxn_c_l202_c3_d350 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l202_c3_d350_left,
BIN_OP_OR_uxn_c_l202_c3_d350_right,
BIN_OP_OR_uxn_c_l202_c3_d350_return_output);

-- bg_vram_update_uxn_c_l198_c27_3d56
bg_vram_update_uxn_c_l198_c27_3d56 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE,
bg_vram_update_uxn_c_l198_c27_3d56_read_address,
bg_vram_update_uxn_c_l198_c27_3d56_write_address,
bg_vram_update_uxn_c_l198_c27_3d56_write_value,
bg_vram_update_uxn_c_l198_c27_3d56_write_enable,
bg_vram_update_uxn_c_l198_c27_3d56_return_output);

-- MUX_uxn_c_l208_c3_bcdc
MUX_uxn_c_l208_c3_bcdc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l208_c3_bcdc_cond,
MUX_uxn_c_l208_c3_bcdc_iftrue,
MUX_uxn_c_l208_c3_bcdc_iffalse,
MUX_uxn_c_l208_c3_bcdc_return_output);

-- BIN_OP_AND_uxn_c_l209_c22_5c76
BIN_OP_AND_uxn_c_l209_c22_5c76 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c22_5c76_left,
BIN_OP_AND_uxn_c_l209_c22_5c76_right,
BIN_OP_AND_uxn_c_l209_c22_5c76_return_output);

-- BIN_OP_OR_uxn_c_l209_c3_56b4
BIN_OP_OR_uxn_c_l209_c3_56b4 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l209_c3_56b4_left,
BIN_OP_OR_uxn_c_l209_c3_56b4_right,
BIN_OP_OR_uxn_c_l209_c3_56b4_return_output);

-- fg_vram_update_uxn_c_l205_c27_f38e
fg_vram_update_uxn_c_l205_c27_f38e : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE,
fg_vram_update_uxn_c_l205_c27_f38e_read_address,
fg_vram_update_uxn_c_l205_c27_f38e_write_address,
fg_vram_update_uxn_c_l205_c27_f38e_write_value,
fg_vram_update_uxn_c_l205_c27_f38e_write_enable,
fg_vram_update_uxn_c_l205_c27_f38e_return_output);

-- draw_queue_update_uxn_c_l212_c21_4058
draw_queue_update_uxn_c_l212_c21_4058 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE,
draw_queue_update_uxn_c_l212_c21_4058_read_address,
draw_queue_update_uxn_c_l212_c21_4058_write_address,
draw_queue_update_uxn_c_l212_c21_4058_write_value,
draw_queue_update_uxn_c_l212_c21_4058_write_enable,
draw_queue_update_uxn_c_l212_c21_4058_return_output);

-- BIN_OP_AND_uxn_c_l219_c38_64d1
BIN_OP_AND_uxn_c_l219_c38_64d1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l219_c38_64d1_left,
BIN_OP_AND_uxn_c_l219_c38_64d1_right,
BIN_OP_AND_uxn_c_l219_c38_64d1_return_output);

-- UNARY_OP_NOT_uxn_c_l219_c38_9eac
UNARY_OP_NOT_uxn_c_l219_c38_9eac : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr,
UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output);

-- MUX_uxn_c_l219_c19_10d7
MUX_uxn_c_l219_c19_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l219_c19_10d7_cond,
MUX_uxn_c_l219_c19_10d7_iftrue,
MUX_uxn_c_l219_c19_10d7_iffalse,
MUX_uxn_c_l219_c19_10d7_return_output);

-- BIN_OP_EQ_uxn_c_l221_c19_316f
BIN_OP_EQ_uxn_c_l221_c19_316f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l221_c19_316f_left,
BIN_OP_EQ_uxn_c_l221_c19_316f_right,
BIN_OP_EQ_uxn_c_l221_c19_316f_return_output);

-- BIN_OP_PLUS_uxn_c_l221_c76_8765
BIN_OP_PLUS_uxn_c_l221_c76_8765 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l221_c76_8765_left,
BIN_OP_PLUS_uxn_c_l221_c76_8765_right,
BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output);

-- MUX_uxn_c_l221_c50_9f8d
MUX_uxn_c_l221_c50_9f8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c50_9f8d_cond,
MUX_uxn_c_l221_c50_9f8d_iftrue,
MUX_uxn_c_l221_c50_9f8d_iffalse,
MUX_uxn_c_l221_c50_9f8d_return_output);

-- MUX_uxn_c_l221_c19_21dd
MUX_uxn_c_l221_c19_21dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c19_21dd_cond,
MUX_uxn_c_l221_c19_21dd_iftrue,
MUX_uxn_c_l221_c19_21dd_iffalse,
MUX_uxn_c_l221_c19_21dd_return_output);

-- BIN_OP_EQ_uxn_c_l222_c25_c5d6
BIN_OP_EQ_uxn_c_l222_c25_c5d6 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l222_c25_c5d6_left,
BIN_OP_EQ_uxn_c_l222_c25_c5d6_right,
BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output);

-- MUX_uxn_c_l222_c25_4fb9
MUX_uxn_c_l222_c25_4fb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l222_c25_4fb9_cond,
MUX_uxn_c_l222_c25_4fb9_iftrue,
MUX_uxn_c_l222_c25_4fb9_iffalse,
MUX_uxn_c_l222_c25_4fb9_return_output);

-- BIN_OP_EQ_uxn_c_l223_c17_d95c
BIN_OP_EQ_uxn_c_l223_c17_d95c : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l223_c17_d95c_left,
BIN_OP_EQ_uxn_c_l223_c17_d95c_right,
BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output);

-- MUX_uxn_c_l223_c17_a9e8
MUX_uxn_c_l223_c17_a9e8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l223_c17_a9e8_cond,
MUX_uxn_c_l223_c17_a9e8_iftrue,
MUX_uxn_c_l223_c17_a9e8_iffalse,
MUX_uxn_c_l223_c17_a9e8_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x,
CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output);



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
 BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output,
 BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output,
 MUX_uxn_c_l145_c17_eb5e_return_output,
 BIN_OP_EQ_uxn_c_l146_c18_801b_return_output,
 MUX_uxn_c_l146_c18_6e9f_return_output,
 UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output,
 UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output,
 BIN_OP_AND_uxn_c_l148_c7_8e11_return_output,
 BIN_OP_AND_uxn_c_l148_c7_329d_return_output,
 current_queue_item_MUX_uxn_c_l148_c2_2953_return_output,
 queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output,
 queue_phase_MUX_uxn_c_l148_c2_2953_return_output,
 BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output,
 queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output,
 queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output,
 queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output,
 BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output,
 BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output,
 BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output,
 MUX_uxn_c_l169_c16_15ca_return_output,
 BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output,
 UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output,
 BIN_OP_AND_uxn_c_l171_c6_5d79_return_output,
 y_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_layer_MUX_uxn_c_l171_c2_ee99_return_output,
 x_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_x0_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_x1_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_color_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_y0_MUX_uxn_c_l171_c2_ee99_return_output,
 fill_y1_MUX_uxn_c_l171_c2_ee99_return_output,
 is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output,
 is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output,
 is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output,
 MUX_uxn_c_l175_c13_a9ea_return_output,
 BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output,
 MUX_uxn_c_l176_c13_4868_return_output,
 MUX_uxn_c_l177_c13_6ac1_return_output,
 BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output,
 MUX_uxn_c_l178_c13_88f2_return_output,
 BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output,
 MUX_uxn_c_l187_c52_48c0_return_output,
 BIN_OP_OR_uxn_c_l187_c35_c69d_return_output,
 CONST_SL_8_uxn_c_l188_c56_e461_return_output,
 BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output,
 MUX_uxn_c_l188_c37_5884_return_output,
 UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output,
 BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output,
 MUX_uxn_c_l188_c108_6d0c_return_output,
 BIN_OP_OR_uxn_c_l188_c37_67bf_return_output,
 BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output,
 MUX_uxn_c_l190_c21_5893_return_output,
 BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output,
 MUX_uxn_c_l191_c22_0782_return_output,
 BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output,
 MUX_uxn_c_l192_c6_144d_return_output,
 BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output,
 MUX_uxn_c_l193_c6_f84a_return_output,
 UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output,
 BIN_OP_AND_uxn_c_l195_c27_206a_return_output,
 BIN_OP_AND_uxn_c_l196_c27_535e_return_output,
 MUX_uxn_c_l201_c3_0fe6_return_output,
 UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output,
 BIN_OP_AND_uxn_c_l202_c22_a263_return_output,
 BIN_OP_OR_uxn_c_l202_c3_d350_return_output,
 bg_vram_update_uxn_c_l198_c27_3d56_return_output,
 MUX_uxn_c_l208_c3_bcdc_return_output,
 BIN_OP_AND_uxn_c_l209_c22_5c76_return_output,
 BIN_OP_OR_uxn_c_l209_c3_56b4_return_output,
 fg_vram_update_uxn_c_l205_c27_f38e_return_output,
 draw_queue_update_uxn_c_l212_c21_4058_return_output,
 BIN_OP_AND_uxn_c_l219_c38_64d1_return_output,
 UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output,
 MUX_uxn_c_l219_c19_10d7_return_output,
 BIN_OP_EQ_uxn_c_l221_c19_316f_return_output,
 BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output,
 MUX_uxn_c_l221_c50_9f8d_return_output,
 MUX_uxn_c_l221_c19_21dd_return_output,
 BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output,
 MUX_uxn_c_l222_c25_4fb9_return_output,
 BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output,
 MUX_uxn_c_l223_c17_a9e8_return_output,
 CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_eb5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_eb5e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_eb5e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l145_c17_eb5e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_6e9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_6e9f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_6e9f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l146_c18_6e9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e0d0_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_329d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_329d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l148_c7_329d_return_output : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_2953_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l157_c3_20b9 : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l156_c3_4ccb : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_2953_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l148_c2_2953_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l149_c37_d32a_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l150_c30_5bcd_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l151_c33_8f4c_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l152_c34_0771_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l153_c32_6015_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l154_c30_81ae_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output : unsigned(10 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l163_c3_692b : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l165_c3_3bec : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l164_c3_600a : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l161_c3_c974 : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l161_c23_a040_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l162_c3_8ce9 : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l162_c23_ef8a_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l163_c23_2e48_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output : unsigned(10 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_15ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_15ca_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_15ca_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l169_c16_15ca_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_3a2e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_e305_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_a32a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_a9ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_a9ea_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_a9ea_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l175_c13_a9ea_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_4868_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_4868_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_4868_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l176_c13_4868_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6ac1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6ac1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6ac1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l177_c13_6ac1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_88f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_88f2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_88f2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l178_c13_88f2_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_read_address : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_48c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_48c0_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_48c0_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l187_c52_48c0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_5884_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c56_e461_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c56_e461_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_5884_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_5884_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c37_5884_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_left : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6d0c_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6d0c_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6d0c_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l188_c108_6d0c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_5893_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_5893_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_5893_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c21_5893_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_0782_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_0782_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_0782_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c22_0782_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_144d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_144d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_144d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l192_c6_144d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_f84a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_f84a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_f84a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l193_c6_f84a_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_206a_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_206a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c27_206a_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_535e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_535e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c27_535e_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_0fe6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_0fe6_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_0fe6_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l201_c3_0fe6_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_d350_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_a263_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_a263_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c22_a263_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_d350_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l202_c3_d350_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l198_c27_3d56_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_bcdc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_bcdc_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_bcdc_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l208_c3_bcdc_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l205_c27_f38e_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_read_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_write_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l212_c21_4058_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_10d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l219_c19_10d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_21dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_21dd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_21dd_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_9f8d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_9f8d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_9f8d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l221_c50_9f8d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l221_c19_21dd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4fb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4fb9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4fb9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l222_c25_4fb9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_a9e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_a9e8_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_a9e8_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l223_c17_a9e8_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_e25b_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_8039_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l123_l225_DUPLICATE_653f_return_output : gpu_step_result_t;
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
     VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l176_c13_4868_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l222_c25_4fb9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l146_c18_6e9f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l222_c25_4fb9_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l175_c13_a9ea_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_MUX_uxn_c_l145_c17_eb5e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_right := to_unsigned(1, 1);
     VAR_queue_phase_uxn_c_l164_c3_600a := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue := VAR_queue_phase_uxn_c_l164_c3_600a;
     VAR_MUX_uxn_c_l169_c16_15ca_iftrue := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l187_c52_48c0_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l188_c108_6d0c_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l190_c21_5893_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l190_c21_5893_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l146_c18_6e9f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_right := to_unsigned(3, 2);
     VAR_queue_phase_uxn_c_l156_c3_4ccb := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iftrue := VAR_queue_phase_uxn_c_l156_c3_4ccb;
     VAR_MUX_uxn_c_l221_c19_21dd_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l219_c19_10d7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l145_c17_eb5e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l177_c13_6ac1_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l191_c22_0782_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l178_c13_88f2_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l191_c22_0782_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l188_c108_6d0c_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l187_c52_48c0_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_right := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse := fill_y1;
     VAR_MUX_uxn_c_l221_c50_9f8d_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l212_c21_4058_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_left := pixel_counter;
     VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_left := pixel_counter;
     VAR_MUX_uxn_c_l221_c50_9f8d_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l171_c2_ee99_iffalse := x;
     VAR_y_MUX_uxn_c_l171_c2_ee99_iffalse := y;
     -- uint32_uint16_0[uxn_c_l161_c23_a040] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l161_c23_a040_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- uint24_17_16[uxn_c_l150_c30_5bcd] LATENCY=0
     VAR_uint24_17_16_uxn_c_l150_c30_5bcd_return_output := uint24_17_16(
     queue_read_value);

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l148_c7_e0d0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e0d0_return_output := current_queue_item.is_valid;

     -- BIN_OP_EQ[uxn_c_l145_c17_7e9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l145_c17_7e9e_left <= VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_left;
     BIN_OP_EQ_uxn_c_l145_c17_7e9e_right <= VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output := BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output;

     -- uint24_19_19[uxn_c_l152_c34_0771] LATENCY=0
     VAR_uint24_19_19_uxn_c_l152_c34_0771_return_output := uint24_19_19(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l157_c3_7889] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l157_c3_7889_left <= VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_left;
     BIN_OP_PLUS_uxn_c_l157_c3_7889_right <= VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output := BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output;

     -- BIN_OP_PLUS[uxn_c_l221_c76_8765] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l221_c76_8765_left <= VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_left;
     BIN_OP_PLUS_uxn_c_l221_c76_8765_right <= VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output := BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output;

     -- BIN_OP_EQ[uxn_c_l146_c18_801b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l146_c18_801b_left <= VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_left;
     BIN_OP_EQ_uxn_c_l146_c18_801b_right <= VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_return_output := BIN_OP_EQ_uxn_c_l146_c18_801b_return_output;

     -- uint24_20_20[uxn_c_l153_c32_6015] LATENCY=0
     VAR_uint24_20_20_uxn_c_l153_c32_6015_return_output := uint24_20_20(
     queue_read_value);

     -- BIN_OP_XOR[uxn_c_l144_c2_6c55] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l144_c2_6c55_left <= VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_left;
     BIN_OP_XOR_uxn_c_l144_c2_6c55_right <= VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output := BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output;

     -- uint24_21_21[uxn_c_l154_c30_81ae] LATENCY=0
     VAR_uint24_21_21_uxn_c_l154_c30_81ae_return_output := uint24_21_21(
     queue_read_value);

     -- uint24_18_18[uxn_c_l151_c33_8f4c] LATENCY=0
     VAR_uint24_18_18_uxn_c_l151_c33_8f4c_return_output := uint24_18_18(
     queue_read_value);

     -- uint24_15_0[uxn_c_l149_c37_d32a] LATENCY=0
     VAR_uint24_15_0_uxn_c_l149_c37_d32a_return_output := uint24_15_0(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l165_c3_61fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l165_c3_61fe_left <= VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_left;
     BIN_OP_PLUS_uxn_c_l165_c3_61fe_right <= VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output := BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output;

     -- BIN_OP_EQ[uxn_c_l221_c19_316f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l221_c19_316f_left <= VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_left;
     BIN_OP_EQ_uxn_c_l221_c19_316f_right <= VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_return_output := BIN_OP_EQ_uxn_c_l221_c19_316f_return_output;

     -- UNARY_OP_NOT[uxn_c_l171_c66_678c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l171_c66_678c_expr <= VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output := UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l145_c17_eb5e_cond := VAR_BIN_OP_EQ_uxn_c_l145_c17_7e9e_return_output;
     VAR_MUX_uxn_c_l146_c18_6e9f_cond := VAR_BIN_OP_EQ_uxn_c_l146_c18_801b_return_output;
     VAR_MUX_uxn_c_l221_c19_21dd_cond := VAR_BIN_OP_EQ_uxn_c_l221_c19_316f_return_output;
     VAR_queue_read_ptr_uxn_c_l157_c3_20b9 := resize(VAR_BIN_OP_PLUS_uxn_c_l157_c3_7889_return_output, 10);
     VAR_queue_write_ptr_uxn_c_l165_c3_3bec := resize(VAR_BIN_OP_PLUS_uxn_c_l165_c3_61fe_return_output, 10);
     VAR_MUX_uxn_c_l221_c50_9f8d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l221_c76_8765_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_left := VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_expr := VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l144_c2_6c55_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l148_c7_e0d0_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_right := VAR_UNARY_OP_NOT_uxn_c_l171_c66_678c_return_output;
     VAR_queue_write_value_uxn_c_l161_c3_c974 := resize(VAR_uint32_uint16_0_uxn_c_l161_c23_a040_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue := VAR_queue_read_ptr_uxn_c_l157_c3_20b9;
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue := VAR_queue_write_ptr_uxn_c_l165_c3_3bec;
     -- UNARY_OP_NOT[uxn_c_l148_c7_ecae] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr <= VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output := UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output;

     -- UNARY_OP_NOT[uxn_c_l188_c108_299a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l188_c108_299a_expr <= VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output := UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output;

     -- uint32_uint5_16[uxn_c_l162_c23_ef8a] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l162_c23_ef8a_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l161_c3_c974, 32),
     resize(VAR_vram_value, 5));

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l148_c2_2953] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_2953_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l149_c37_d32a_return_output,
     VAR_uint24_17_16_uxn_c_l150_c30_5bcd_return_output,
     VAR_uint24_18_18_uxn_c_l151_c33_8f4c_return_output,
     VAR_uint24_19_19_uxn_c_l152_c34_0771_return_output,
     VAR_uint24_20_20_uxn_c_l153_c32_6015_return_output,
     VAR_uint24_21_21_uxn_c_l154_c30_81ae_return_output,
     to_unsigned(1, 1));

     -- queue_write_ptr_MUX[uxn_c_l160_c2_cbe1] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_cond;
     queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iftrue;
     queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output := queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output;

     -- MUX[uxn_c_l145_c17_eb5e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l145_c17_eb5e_cond <= VAR_MUX_uxn_c_l145_c17_eb5e_cond;
     MUX_uxn_c_l145_c17_eb5e_iftrue <= VAR_MUX_uxn_c_l145_c17_eb5e_iftrue;
     MUX_uxn_c_l145_c17_eb5e_iffalse <= VAR_MUX_uxn_c_l145_c17_eb5e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l145_c17_eb5e_return_output := MUX_uxn_c_l145_c17_eb5e_return_output;

     -- BIN_OP_AND[uxn_c_l187_c52_7fcf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l187_c52_7fcf_left <= VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_left;
     BIN_OP_AND_uxn_c_l187_c52_7fcf_right <= VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output := BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output;

     -- MUX[uxn_c_l146_c18_6e9f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l146_c18_6e9f_cond <= VAR_MUX_uxn_c_l146_c18_6e9f_cond;
     MUX_uxn_c_l146_c18_6e9f_iftrue <= VAR_MUX_uxn_c_l146_c18_6e9f_iftrue;
     MUX_uxn_c_l146_c18_6e9f_iffalse <= VAR_MUX_uxn_c_l146_c18_6e9f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l146_c18_6e9f_return_output := MUX_uxn_c_l146_c18_6e9f_return_output;

     -- MUX[uxn_c_l221_c50_9f8d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c50_9f8d_cond <= VAR_MUX_uxn_c_l221_c50_9f8d_cond;
     MUX_uxn_c_l221_c50_9f8d_iftrue <= VAR_MUX_uxn_c_l221_c50_9f8d_iftrue;
     MUX_uxn_c_l221_c50_9f8d_iffalse <= VAR_MUX_uxn_c_l221_c50_9f8d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c50_9f8d_return_output := MUX_uxn_c_l221_c50_9f8d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l187_c52_48c0_cond := VAR_BIN_OP_AND_uxn_c_l187_c52_7fcf_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_expr := VAR_MUX_uxn_c_l145_c17_eb5e_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l145_c17_eb5e_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_329d_right := VAR_MUX_uxn_c_l146_c18_6e9f_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l146_c18_6e9f_return_output;
     VAR_MUX_uxn_c_l221_c19_21dd_iffalse := VAR_MUX_uxn_c_l221_c50_9f8d_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_left := VAR_UNARY_OP_NOT_uxn_c_l148_c7_ecae_return_output;
     VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_left := VAR_UNARY_OP_NOT_uxn_c_l188_c108_299a_return_output;
     VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l148_c2_2953_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4058_write_address := VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l160_c2_cbe1_return_output;
     VAR_queue_write_value_uxn_c_l162_c3_8ce9 := resize(VAR_uint32_uint5_16_uxn_c_l162_c23_ef8a_return_output, 24);
     -- MUX[uxn_c_l221_c19_21dd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c19_21dd_cond <= VAR_MUX_uxn_c_l221_c19_21dd_cond;
     MUX_uxn_c_l221_c19_21dd_iftrue <= VAR_MUX_uxn_c_l221_c19_21dd_iftrue;
     MUX_uxn_c_l221_c19_21dd_iffalse <= VAR_MUX_uxn_c_l221_c19_21dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c19_21dd_return_output := MUX_uxn_c_l221_c19_21dd_return_output;

     -- BIN_OP_AND[uxn_c_l188_c108_b5bf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c108_b5bf_left <= VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_left;
     BIN_OP_AND_uxn_c_l188_c108_b5bf_right <= VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output := BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output;

     -- UNARY_OP_NOT[uxn_c_l148_c38_9314] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l148_c38_9314_expr <= VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output := UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output;

     -- uint32_uint1_21[uxn_c_l163_c23_2e48] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l163_c23_2e48_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l162_c3_8ce9, 32),
     VAR_vram_write_layer);

     -- MUX[uxn_c_l187_c52_48c0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l187_c52_48c0_cond <= VAR_MUX_uxn_c_l187_c52_48c0_cond;
     MUX_uxn_c_l187_c52_48c0_iftrue <= VAR_MUX_uxn_c_l187_c52_48c0_iftrue;
     MUX_uxn_c_l187_c52_48c0_iffalse <= VAR_MUX_uxn_c_l187_c52_48c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l187_c52_48c0_return_output := MUX_uxn_c_l187_c52_48c0_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l188_c108_6d0c_cond := VAR_BIN_OP_AND_uxn_c_l188_c108_b5bf_return_output;
     VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_right := VAR_MUX_uxn_c_l187_c52_48c0_return_output;
     VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_left := VAR_MUX_uxn_c_l221_c19_21dd_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l221_c19_21dd_return_output;
     VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_right := VAR_UNARY_OP_NOT_uxn_c_l148_c38_9314_return_output;
     VAR_queue_write_value_uxn_c_l163_c3_692b := resize(VAR_uint32_uint1_21_uxn_c_l163_c23_2e48_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue := VAR_queue_write_value_uxn_c_l163_c3_692b;
     -- BIN_OP_OR[uxn_c_l187_c35_c69d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l187_c35_c69d_left <= VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_left;
     BIN_OP_OR_uxn_c_l187_c35_c69d_right <= VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_return_output := BIN_OP_OR_uxn_c_l187_c35_c69d_return_output;

     -- BIN_OP_AND[uxn_c_l148_c7_8e11] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c7_8e11_left <= VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_left;
     BIN_OP_AND_uxn_c_l148_c7_8e11_right <= VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_return_output := BIN_OP_AND_uxn_c_l148_c7_8e11_return_output;

     -- queue_write_value_MUX[uxn_c_l160_c2_cbe1] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond <= VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_cond;
     queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue <= VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iftrue;
     queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse <= VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output := queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output;

     -- MUX[uxn_c_l188_c108_6d0c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c108_6d0c_cond <= VAR_MUX_uxn_c_l188_c108_6d0c_cond;
     MUX_uxn_c_l188_c108_6d0c_iftrue <= VAR_MUX_uxn_c_l188_c108_6d0c_iftrue;
     MUX_uxn_c_l188_c108_6d0c_iffalse <= VAR_MUX_uxn_c_l188_c108_6d0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c108_6d0c_return_output := MUX_uxn_c_l188_c108_6d0c_return_output;

     -- BIN_OP_EQ[uxn_c_l222_c25_c5d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l222_c25_c5d6_left <= VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_left;
     BIN_OP_EQ_uxn_c_l222_c25_c5d6_right <= VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output := BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l148_c7_329d_left := VAR_BIN_OP_AND_uxn_c_l148_c7_8e11_return_output;
     VAR_MUX_uxn_c_l222_c25_4fb9_cond := VAR_BIN_OP_EQ_uxn_c_l222_c25_c5d6_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_read_address := VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_read_address := VAR_BIN_OP_OR_uxn_c_l187_c35_c69d_return_output;
     VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_right := VAR_MUX_uxn_c_l188_c108_6d0c_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4058_write_value := VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l160_c2_cbe1_return_output;
     -- BIN_OP_AND[uxn_c_l148_c7_329d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l148_c7_329d_left <= VAR_BIN_OP_AND_uxn_c_l148_c7_329d_left;
     BIN_OP_AND_uxn_c_l148_c7_329d_right <= VAR_BIN_OP_AND_uxn_c_l148_c7_329d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l148_c7_329d_return_output := BIN_OP_AND_uxn_c_l148_c7_329d_return_output;

     -- MUX[uxn_c_l222_c25_4fb9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l222_c25_4fb9_cond <= VAR_MUX_uxn_c_l222_c25_4fb9_cond;
     MUX_uxn_c_l222_c25_4fb9_iftrue <= VAR_MUX_uxn_c_l222_c25_4fb9_iftrue;
     MUX_uxn_c_l222_c25_4fb9_iffalse <= VAR_MUX_uxn_c_l222_c25_4fb9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l222_c25_4fb9_return_output := MUX_uxn_c_l222_c25_4fb9_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_329d_return_output;
     VAR_queue_phase_MUX_uxn_c_l148_c2_2953_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_329d_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond := VAR_BIN_OP_AND_uxn_c_l148_c7_329d_return_output;
     -- current_queue_item_MUX[uxn_c_l148_c2_2953] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l148_c2_2953_cond <= VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_cond;
     current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue <= VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iftrue;
     current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse <= VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output := current_queue_item_MUX_uxn_c_l148_c2_2953_return_output;

     -- queue_read_ptr_MUX[uxn_c_l148_c2_2953] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_cond;
     queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iftrue;
     queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output := queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output;

     -- queue_phase_MUX[uxn_c_l148_c2_2953] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l148_c2_2953_cond <= VAR_queue_phase_MUX_uxn_c_l148_c2_2953_cond;
     queue_phase_MUX_uxn_c_l148_c2_2953_iftrue <= VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iftrue;
     queue_phase_MUX_uxn_c_l148_c2_2953_iffalse <= VAR_queue_phase_MUX_uxn_c_l148_c2_2953_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l148_c2_2953_return_output := queue_phase_MUX_uxn_c_l148_c2_2953_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse := VAR_queue_phase_MUX_uxn_c_l148_c2_2953_return_output;
     VAR_draw_queue_update_uxn_c_l212_c21_4058_read_address := VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l148_c2_2953_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_8039 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_8039_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.is_valid;

     -- queue_phase_MUX[uxn_c_l160_c2_cbe1] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l160_c2_cbe1_cond <= VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_cond;
     queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue <= VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iftrue;
     queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse <= VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output := queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l171_c36_3a2e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_3a2e_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.is_fill;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l174_c18_a32a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_a32a_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.fill_left;

     -- draw_queue_update[uxn_c_l212_c21_4058] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l212_c21_4058_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l212_c21_4058_read_address <= VAR_draw_queue_update_uxn_c_l212_c21_4058_read_address;
     draw_queue_update_uxn_c_l212_c21_4058_write_address <= VAR_draw_queue_update_uxn_c_l212_c21_4058_write_address;
     draw_queue_update_uxn_c_l212_c21_4058_write_value <= VAR_draw_queue_update_uxn_c_l212_c21_4058_write_value;
     draw_queue_update_uxn_c_l212_c21_4058_write_enable <= VAR_draw_queue_update_uxn_c_l212_c21_4058_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l212_c21_4058_return_output := draw_queue_update_uxn_c_l212_c21_4058_return_output;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.vram_address;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.layer;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l173_c17_e305] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_e305_return_output := VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output.fill_top;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output;
     VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output;
     VAR_MUX_uxn_c_l188_c37_5884_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l176_l188_l175_l178_l177_DUPLICATE_a06b_return_output, 17);
     VAR_MUX_uxn_c_l176_c13_4868_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_a32a_return_output;
     VAR_MUX_uxn_c_l178_c13_88f2_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_a32a_return_output;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l174_c18_a32a_return_output;
     VAR_MUX_uxn_c_l175_c13_a9ea_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_e305_return_output;
     VAR_MUX_uxn_c_l177_c13_6ac1_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_e305_return_output;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l173_c17_e305_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l171_c36_3a2e_return_output;
     VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_8039_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l202_l209_l171_DUPLICATE_8039_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4_return_output;
     VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l209_l179_l202_DUPLICATE_91d4_return_output;
     VAR_MUX_uxn_c_l201_c3_0fe6_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35_return_output;
     VAR_MUX_uxn_c_l208_c3_bcdc_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35_return_output;
     VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l201_l208_l180_DUPLICATE_cb35_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l212_c21_4058_return_output;
     VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_left := VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_left := VAR_queue_phase_MUX_uxn_c_l160_c2_cbe1_return_output;
     -- UNARY_OP_NOT[uxn_c_l202_c71_a79a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr <= VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output := UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output := CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output;

     -- BIN_OP_AND[uxn_c_l171_c6_a5c8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l171_c6_a5c8_left <= VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_left;
     BIN_OP_AND_uxn_c_l171_c6_a5c8_right <= VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output := BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output;

     -- BIN_OP_AND[uxn_c_l176_c28_a0c0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l176_c28_a0c0_left <= VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_left;
     BIN_OP_AND_uxn_c_l176_c28_a0c0_right <= VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output := BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output;

     -- BIN_OP_PLUS[uxn_c_l169_c39_fa89] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l169_c39_fa89_left <= VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_left;
     BIN_OP_PLUS_uxn_c_l169_c39_fa89_right <= VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output := BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output;

     -- BIN_OP_AND[uxn_c_l178_c32_a1c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l178_c32_a1c2_left <= VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_left;
     BIN_OP_AND_uxn_c_l178_c32_a1c2_right <= VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output := BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output;

     -- BIN_OP_EQ[uxn_c_l169_c16_3da8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l169_c16_3da8_left <= VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_left;
     BIN_OP_EQ_uxn_c_l169_c16_3da8_right <= VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output := BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_left := VAR_BIN_OP_AND_uxn_c_l171_c6_a5c8_return_output;
     VAR_MUX_uxn_c_l176_c13_4868_iftrue := VAR_BIN_OP_AND_uxn_c_l176_c28_a0c0_return_output;
     VAR_MUX_uxn_c_l178_c13_88f2_iffalse := VAR_BIN_OP_AND_uxn_c_l178_c32_a1c2_return_output;
     VAR_MUX_uxn_c_l169_c16_15ca_cond := VAR_BIN_OP_EQ_uxn_c_l169_c16_3da8_return_output;
     VAR_MUX_uxn_c_l169_c16_15ca_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l169_c39_fa89_return_output, 2);
     VAR_MUX_uxn_c_l175_c13_a9ea_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output;
     VAR_MUX_uxn_c_l177_c13_6ac1_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l175_l177_DUPLICATE_4a69_return_output;
     VAR_BIN_OP_AND_uxn_c_l202_c22_a263_right := VAR_UNARY_OP_NOT_uxn_c_l202_c71_a79a_return_output;
     -- MUX[uxn_c_l177_c13_6ac1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l177_c13_6ac1_cond <= VAR_MUX_uxn_c_l177_c13_6ac1_cond;
     MUX_uxn_c_l177_c13_6ac1_iftrue <= VAR_MUX_uxn_c_l177_c13_6ac1_iftrue;
     MUX_uxn_c_l177_c13_6ac1_iffalse <= VAR_MUX_uxn_c_l177_c13_6ac1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l177_c13_6ac1_return_output := MUX_uxn_c_l177_c13_6ac1_return_output;

     -- MUX[uxn_c_l178_c13_88f2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l178_c13_88f2_cond <= VAR_MUX_uxn_c_l178_c13_88f2_cond;
     MUX_uxn_c_l178_c13_88f2_iftrue <= VAR_MUX_uxn_c_l178_c13_88f2_iftrue;
     MUX_uxn_c_l178_c13_88f2_iffalse <= VAR_MUX_uxn_c_l178_c13_88f2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l178_c13_88f2_return_output := MUX_uxn_c_l178_c13_88f2_return_output;

     -- MUX[uxn_c_l176_c13_4868] LATENCY=0
     -- Inputs
     MUX_uxn_c_l176_c13_4868_cond <= VAR_MUX_uxn_c_l176_c13_4868_cond;
     MUX_uxn_c_l176_c13_4868_iftrue <= VAR_MUX_uxn_c_l176_c13_4868_iftrue;
     MUX_uxn_c_l176_c13_4868_iffalse <= VAR_MUX_uxn_c_l176_c13_4868_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l176_c13_4868_return_output := MUX_uxn_c_l176_c13_4868_return_output;

     -- BIN_OP_AND[uxn_c_l171_c6_5d79] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l171_c6_5d79_left <= VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_left;
     BIN_OP_AND_uxn_c_l171_c6_5d79_right <= VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output := BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;

     -- MUX[uxn_c_l175_c13_a9ea] LATENCY=0
     -- Inputs
     MUX_uxn_c_l175_c13_a9ea_cond <= VAR_MUX_uxn_c_l175_c13_a9ea_cond;
     MUX_uxn_c_l175_c13_a9ea_iftrue <= VAR_MUX_uxn_c_l175_c13_a9ea_iftrue;
     MUX_uxn_c_l175_c13_a9ea_iffalse <= VAR_MUX_uxn_c_l175_c13_a9ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l175_c13_a9ea_return_output := MUX_uxn_c_l175_c13_a9ea_return_output;

     -- MUX[uxn_c_l169_c16_15ca] LATENCY=0
     -- Inputs
     MUX_uxn_c_l169_c16_15ca_cond <= VAR_MUX_uxn_c_l169_c16_15ca_cond;
     MUX_uxn_c_l169_c16_15ca_iftrue <= VAR_MUX_uxn_c_l169_c16_15ca_iftrue;
     MUX_uxn_c_l169_c16_15ca_iffalse <= VAR_MUX_uxn_c_l169_c16_15ca_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l169_c16_15ca_return_output := MUX_uxn_c_l169_c16_15ca_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_x_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     VAR_y_MUX_uxn_c_l171_c2_ee99_cond := VAR_BIN_OP_AND_uxn_c_l171_c6_5d79_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l169_c16_15ca_return_output;
     VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l175_c13_a9ea_return_output;
     VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l176_c13_4868_return_output;
     VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l177_c13_6ac1_return_output;
     VAR_y_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l177_c13_6ac1_return_output;
     VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l178_c13_88f2_return_output;
     VAR_x_MUX_uxn_c_l171_c2_ee99_iftrue := VAR_MUX_uxn_c_l178_c13_88f2_return_output;
     -- fill_y0_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_cond;
     fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_return_output := fill_y0_MUX_uxn_c_l171_c2_ee99_return_output;

     -- fill_x0_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_cond;
     fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_return_output := fill_x0_MUX_uxn_c_l171_c2_ee99_return_output;

     -- fill_x1_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_cond;
     fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_return_output := fill_x1_MUX_uxn_c_l171_c2_ee99_return_output;

     -- fill_color_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_color_MUX_uxn_c_l171_c2_ee99_cond;
     fill_color_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_color_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_color_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l171_c2_ee99_return_output := fill_color_MUX_uxn_c_l171_c2_ee99_return_output;

     -- is_fill_left_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l171_c2_ee99_cond <= VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_cond;
     is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iftrue;
     is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output := is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output;

     -- is_fill_active_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l171_c2_ee99_cond <= VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_cond;
     is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iftrue;
     is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output := is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;

     -- x_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l171_c2_ee99_cond <= VAR_x_MUX_uxn_c_l171_c2_ee99_cond;
     x_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_x_MUX_uxn_c_l171_c2_ee99_iftrue;
     x_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_x_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l171_c2_ee99_return_output := x_MUX_uxn_c_l171_c2_ee99_return_output;

     -- is_fill_top_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l171_c2_ee99_cond <= VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_cond;
     is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iftrue;
     is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output := is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output;

     -- fill_y1_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_cond;
     fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_return_output := fill_y1_MUX_uxn_c_l171_c2_ee99_return_output;

     -- y_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l171_c2_ee99_cond <= VAR_y_MUX_uxn_c_l171_c2_ee99_cond;
     y_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_y_MUX_uxn_c_l171_c2_ee99_iftrue;
     y_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_y_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l171_c2_ee99_return_output := y_MUX_uxn_c_l171_c2_ee99_return_output;

     -- fill_layer_MUX[uxn_c_l171_c2_ee99] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l171_c2_ee99_cond <= VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_cond;
     fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue <= VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iftrue;
     fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse <= VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_return_output := fill_layer_MUX_uxn_c_l171_c2_ee99_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l201_c3_0fe6_iftrue := VAR_fill_color_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_MUX_uxn_c_l208_c3_bcdc_iftrue := VAR_fill_color_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_AND_uxn_c_l196_c27_535e_right := VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr := VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_MUX_uxn_c_l193_c6_f84a_iftrue := VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_right := VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_right := VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_AND_uxn_c_l195_c27_206a_left := VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_AND_uxn_c_l196_c27_535e_left := VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_MUX_uxn_c_l188_c37_5884_cond := VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_MUX_uxn_c_l219_c19_10d7_cond := VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr := VAR_is_fill_active_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l171_c2_ee99_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_left := VAR_x_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_right := VAR_x_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_left := VAR_x_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_left := VAR_y_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_left := VAR_y_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_CONST_SL_8_uxn_c_l188_c56_e461_x := VAR_y_MUX_uxn_c_l171_c2_ee99_return_output;
     VAR_MUX_uxn_c_l192_c6_144d_iffalse := VAR_y_MUX_uxn_c_l171_c2_ee99_return_output;
     -- CONST_SL_8[uxn_c_l188_c56_e461] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l188_c56_e461_x <= VAR_CONST_SL_8_uxn_c_l188_c56_e461_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l188_c56_e461_return_output := CONST_SL_8_uxn_c_l188_c56_e461_return_output;

     -- BIN_OP_PLUS[uxn_c_l193_c34_50b6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l193_c34_50b6_left <= VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_left;
     BIN_OP_PLUS_uxn_c_l193_c34_50b6_right <= VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output := BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output;

     -- BIN_OP_AND[uxn_c_l196_c27_535e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l196_c27_535e_left <= VAR_BIN_OP_AND_uxn_c_l196_c27_535e_left;
     BIN_OP_AND_uxn_c_l196_c27_535e_right <= VAR_BIN_OP_AND_uxn_c_l196_c27_535e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l196_c27_535e_return_output := BIN_OP_AND_uxn_c_l196_c27_535e_return_output;

     -- BIN_OP_EQ[uxn_c_l190_c21_eed4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l190_c21_eed4_left <= VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_left;
     BIN_OP_EQ_uxn_c_l190_c21_eed4_right <= VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output := BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output;

     -- BIN_OP_PLUS[uxn_c_l192_c25_ceff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l192_c25_ceff_left <= VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_left;
     BIN_OP_PLUS_uxn_c_l192_c25_ceff_right <= VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output := BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output;

     -- UNARY_OP_NOT[uxn_c_l195_c46_3c4c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr <= VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output := UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output;

     -- BIN_OP_EQ[uxn_c_l191_c22_cb81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l191_c22_cb81_left <= VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_left;
     BIN_OP_EQ_uxn_c_l191_c22_cb81_right <= VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output := BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_left := VAR_BIN_OP_AND_uxn_c_l196_c27_535e_return_output;
     VAR_MUX_uxn_c_l208_c3_bcdc_cond := VAR_BIN_OP_AND_uxn_c_l196_c27_535e_return_output;
     VAR_MUX_uxn_c_l190_c21_5893_cond := VAR_BIN_OP_EQ_uxn_c_l190_c21_eed4_return_output;
     VAR_MUX_uxn_c_l191_c22_0782_cond := VAR_BIN_OP_EQ_uxn_c_l191_c22_cb81_return_output;
     VAR_MUX_uxn_c_l192_c6_144d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l192_c25_ceff_return_output, 16);
     VAR_MUX_uxn_c_l193_c6_f84a_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l193_c34_50b6_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_left := VAR_CONST_SL_8_uxn_c_l188_c56_e461_return_output;
     VAR_BIN_OP_AND_uxn_c_l195_c27_206a_right := VAR_UNARY_OP_NOT_uxn_c_l195_c46_3c4c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l202_l209_DUPLICATE_87a4_return_output;
     -- MUX[uxn_c_l190_c21_5893] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c21_5893_cond <= VAR_MUX_uxn_c_l190_c21_5893_cond;
     MUX_uxn_c_l190_c21_5893_iftrue <= VAR_MUX_uxn_c_l190_c21_5893_iftrue;
     MUX_uxn_c_l190_c21_5893_iffalse <= VAR_MUX_uxn_c_l190_c21_5893_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c21_5893_return_output := MUX_uxn_c_l190_c21_5893_return_output;

     -- MUX[uxn_c_l208_c3_bcdc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l208_c3_bcdc_cond <= VAR_MUX_uxn_c_l208_c3_bcdc_cond;
     MUX_uxn_c_l208_c3_bcdc_iftrue <= VAR_MUX_uxn_c_l208_c3_bcdc_iftrue;
     MUX_uxn_c_l208_c3_bcdc_iffalse <= VAR_MUX_uxn_c_l208_c3_bcdc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l208_c3_bcdc_return_output := MUX_uxn_c_l208_c3_bcdc_return_output;

     -- BIN_OP_AND[uxn_c_l195_c27_206a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l195_c27_206a_left <= VAR_BIN_OP_AND_uxn_c_l195_c27_206a_left;
     BIN_OP_AND_uxn_c_l195_c27_206a_right <= VAR_BIN_OP_AND_uxn_c_l195_c27_206a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l195_c27_206a_return_output := BIN_OP_AND_uxn_c_l195_c27_206a_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output;

     -- MUX[uxn_c_l191_c22_0782] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c22_0782_cond <= VAR_MUX_uxn_c_l191_c22_0782_cond;
     MUX_uxn_c_l191_c22_0782_iftrue <= VAR_MUX_uxn_c_l191_c22_0782_iftrue;
     MUX_uxn_c_l191_c22_0782_iffalse <= VAR_MUX_uxn_c_l191_c22_0782_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c22_0782_return_output := MUX_uxn_c_l191_c22_0782_return_output;

     -- BIN_OP_PLUS[uxn_c_l188_c56_127c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l188_c56_127c_left <= VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_left;
     BIN_OP_PLUS_uxn_c_l188_c56_127c_right <= VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output := BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l202_c3_d350_left := VAR_BIN_OP_AND_uxn_c_l195_c27_206a_return_output;
     VAR_MUX_uxn_c_l201_c3_0fe6_cond := VAR_BIN_OP_AND_uxn_c_l195_c27_206a_return_output;
     VAR_BIN_OP_AND_uxn_c_l202_c22_a263_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l202_l209_DUPLICATE_d783_return_output;
     VAR_MUX_uxn_c_l188_c37_5884_iftrue := VAR_BIN_OP_PLUS_uxn_c_l188_c56_127c_return_output;
     VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_left := VAR_MUX_uxn_c_l190_c21_5893_return_output;
     VAR_MUX_uxn_c_l192_c6_144d_cond := VAR_MUX_uxn_c_l190_c21_5893_return_output;
     VAR_MUX_uxn_c_l193_c6_f84a_cond := VAR_MUX_uxn_c_l190_c21_5893_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l190_c21_5893_return_output;
     VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_right := VAR_MUX_uxn_c_l191_c22_0782_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l191_c22_0782_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_value := VAR_MUX_uxn_c_l208_c3_bcdc_return_output;
     -- MUX[uxn_c_l188_c37_5884] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c37_5884_cond <= VAR_MUX_uxn_c_l188_c37_5884_cond;
     MUX_uxn_c_l188_c37_5884_iftrue <= VAR_MUX_uxn_c_l188_c37_5884_iftrue;
     MUX_uxn_c_l188_c37_5884_iffalse <= VAR_MUX_uxn_c_l188_c37_5884_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c37_5884_return_output := MUX_uxn_c_l188_c37_5884_return_output;

     -- MUX[uxn_c_l201_c3_0fe6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c3_0fe6_cond <= VAR_MUX_uxn_c_l201_c3_0fe6_cond;
     MUX_uxn_c_l201_c3_0fe6_iftrue <= VAR_MUX_uxn_c_l201_c3_0fe6_iftrue;
     MUX_uxn_c_l201_c3_0fe6_iffalse <= VAR_MUX_uxn_c_l201_c3_0fe6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c3_0fe6_return_output := MUX_uxn_c_l201_c3_0fe6_return_output;

     -- BIN_OP_AND[uxn_c_l209_c22_5c76] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c22_5c76_left <= VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_left;
     BIN_OP_AND_uxn_c_l209_c22_5c76_right <= VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_return_output := BIN_OP_AND_uxn_c_l209_c22_5c76_return_output;

     -- BIN_OP_AND[uxn_c_l202_c22_a263] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c22_a263_left <= VAR_BIN_OP_AND_uxn_c_l202_c22_a263_left;
     BIN_OP_AND_uxn_c_l202_c22_a263_right <= VAR_BIN_OP_AND_uxn_c_l202_c22_a263_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c22_a263_return_output := BIN_OP_AND_uxn_c_l202_c22_a263_return_output;

     -- BIN_OP_AND[uxn_c_l219_c38_64d1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l219_c38_64d1_left <= VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_left;
     BIN_OP_AND_uxn_c_l219_c38_64d1_right <= VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_return_output := BIN_OP_AND_uxn_c_l219_c38_64d1_return_output;

     -- MUX[uxn_c_l193_c6_f84a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l193_c6_f84a_cond <= VAR_MUX_uxn_c_l193_c6_f84a_cond;
     MUX_uxn_c_l193_c6_f84a_iftrue <= VAR_MUX_uxn_c_l193_c6_f84a_iftrue;
     MUX_uxn_c_l193_c6_f84a_iffalse <= VAR_MUX_uxn_c_l193_c6_f84a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l193_c6_f84a_return_output := MUX_uxn_c_l193_c6_f84a_return_output;

     -- MUX[uxn_c_l192_c6_144d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l192_c6_144d_cond <= VAR_MUX_uxn_c_l192_c6_144d_cond;
     MUX_uxn_c_l192_c6_144d_iftrue <= VAR_MUX_uxn_c_l192_c6_144d_iftrue;
     MUX_uxn_c_l192_c6_144d_iffalse <= VAR_MUX_uxn_c_l192_c6_144d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l192_c6_144d_return_output := MUX_uxn_c_l192_c6_144d_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l202_c3_d350_right := VAR_BIN_OP_AND_uxn_c_l202_c22_a263_return_output;
     VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_right := VAR_BIN_OP_AND_uxn_c_l209_c22_5c76_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr := VAR_BIN_OP_AND_uxn_c_l219_c38_64d1_return_output;
     VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_left := VAR_MUX_uxn_c_l188_c37_5884_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l192_c6_144d_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l193_c6_f84a_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_value := VAR_MUX_uxn_c_l201_c3_0fe6_return_output;
     -- BIN_OP_OR[uxn_c_l188_c37_67bf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l188_c37_67bf_left <= VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_left;
     BIN_OP_OR_uxn_c_l188_c37_67bf_right <= VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_return_output := BIN_OP_OR_uxn_c_l188_c37_67bf_return_output;

     -- BIN_OP_OR[uxn_c_l202_c3_d350] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l202_c3_d350_left <= VAR_BIN_OP_OR_uxn_c_l202_c3_d350_left;
     BIN_OP_OR_uxn_c_l202_c3_d350_right <= VAR_BIN_OP_OR_uxn_c_l202_c3_d350_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l202_c3_d350_return_output := BIN_OP_OR_uxn_c_l202_c3_d350_return_output;

     -- BIN_OP_OR[uxn_c_l209_c3_56b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l209_c3_56b4_left <= VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_left;
     BIN_OP_OR_uxn_c_l209_c3_56b4_right <= VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_return_output := BIN_OP_OR_uxn_c_l209_c3_56b4_return_output;

     -- UNARY_OP_NOT[uxn_c_l219_c38_9eac] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr <= VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output := UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_address := VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_address := VAR_BIN_OP_OR_uxn_c_l188_c37_67bf_return_output;
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_enable := VAR_BIN_OP_OR_uxn_c_l202_c3_d350_return_output;
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_enable := VAR_BIN_OP_OR_uxn_c_l209_c3_56b4_return_output;
     VAR_MUX_uxn_c_l219_c19_10d7_iftrue := VAR_UNARY_OP_NOT_uxn_c_l219_c38_9eac_return_output;
     -- fg_vram_update[uxn_c_l205_c27_f38e] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l205_c27_f38e_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l205_c27_f38e_read_address <= VAR_fg_vram_update_uxn_c_l205_c27_f38e_read_address;
     fg_vram_update_uxn_c_l205_c27_f38e_write_address <= VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_address;
     fg_vram_update_uxn_c_l205_c27_f38e_write_value <= VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_value;
     fg_vram_update_uxn_c_l205_c27_f38e_write_enable <= VAR_fg_vram_update_uxn_c_l205_c27_f38e_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l205_c27_f38e_return_output := fg_vram_update_uxn_c_l205_c27_f38e_return_output;

     -- MUX[uxn_c_l219_c19_10d7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l219_c19_10d7_cond <= VAR_MUX_uxn_c_l219_c19_10d7_cond;
     MUX_uxn_c_l219_c19_10d7_iftrue <= VAR_MUX_uxn_c_l219_c19_10d7_iftrue;
     MUX_uxn_c_l219_c19_10d7_iffalse <= VAR_MUX_uxn_c_l219_c19_10d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l219_c19_10d7_return_output := MUX_uxn_c_l219_c19_10d7_return_output;

     -- bg_vram_update[uxn_c_l198_c27_3d56] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l198_c27_3d56_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l198_c27_3d56_read_address <= VAR_bg_vram_update_uxn_c_l198_c27_3d56_read_address;
     bg_vram_update_uxn_c_l198_c27_3d56_write_address <= VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_address;
     bg_vram_update_uxn_c_l198_c27_3d56_write_value <= VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_value;
     bg_vram_update_uxn_c_l198_c27_3d56_write_enable <= VAR_bg_vram_update_uxn_c_l198_c27_3d56_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l198_c27_3d56_return_output := bg_vram_update_uxn_c_l198_c27_3d56_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l219_c19_10d7_return_output;
     VAR_MUX_uxn_c_l223_c17_a9e8_iftrue := VAR_bg_vram_update_uxn_c_l198_c27_3d56_return_output;
     VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_left := VAR_fg_vram_update_uxn_c_l205_c27_f38e_return_output;
     VAR_MUX_uxn_c_l223_c17_a9e8_iffalse := VAR_fg_vram_update_uxn_c_l205_c27_f38e_return_output;
     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l123_c19_e25b] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_e25b_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l148_c2_2953_return_output,
     VAR_MUX_uxn_c_l219_c19_10d7_return_output);

     -- BIN_OP_EQ[uxn_c_l223_c17_d95c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l223_c17_d95c_left <= VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_left;
     BIN_OP_EQ_uxn_c_l223_c17_d95c_right <= VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output := BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l223_c17_a9e8_cond := VAR_BIN_OP_EQ_uxn_c_l223_c17_d95c_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l123_c19_e25b_return_output;
     -- MUX[uxn_c_l223_c17_a9e8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l223_c17_a9e8_cond <= VAR_MUX_uxn_c_l223_c17_a9e8_cond;
     MUX_uxn_c_l223_c17_a9e8_iftrue <= VAR_MUX_uxn_c_l223_c17_a9e8_iftrue;
     MUX_uxn_c_l223_c17_a9e8_iffalse <= VAR_MUX_uxn_c_l223_c17_a9e8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l223_c17_a9e8_return_output := MUX_uxn_c_l223_c17_a9e8_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l123_l225_DUPLICATE_653f LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l123_l225_DUPLICATE_653f_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l222_c25_4fb9_return_output,
     VAR_MUX_uxn_c_l223_c17_a9e8_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l123_l225_DUPLICATE_653f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l123_l225_DUPLICATE_653f_return_output;
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
