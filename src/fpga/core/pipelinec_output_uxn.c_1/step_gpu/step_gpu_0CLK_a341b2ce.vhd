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
-- BIN_OP_XOR[uxn_c_l157_c2_859a]
signal BIN_OP_XOR_uxn_c_l157_c2_859a_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_859a_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_859a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_47ea]
signal BIN_OP_EQ_uxn_c_l158_c17_47ea_left : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_47ea_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_29b4]
signal MUX_uxn_c_l158_c17_29b4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_29b4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_29b4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_29b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_8508]
signal BIN_OP_EQ_uxn_c_l159_c18_8508_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_8508_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_8508_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_fc90]
signal MUX_uxn_c_l159_c18_fc90_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc90_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc90_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_fc90_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_178d]
signal UNARY_OP_NOT_uxn_c_l161_c7_178d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_0d2e]
signal UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_eb8b]
signal BIN_OP_AND_uxn_c_l161_c7_eb8b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_eb8b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_aa8d]
signal BIN_OP_AND_uxn_c_l161_c7_aa8d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_aa8d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output : unsigned(0 downto 0);

-- queue_read_ptr_MUX[uxn_c_l161_c2_5280]
signal queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse : unsigned(9 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l161_c2_5280]
signal queue_phase_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_5280_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_5280_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_5280_return_output : unsigned(1 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_5280]
signal current_queue_item_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_5280_return_output : draw_command_t;

-- BIN_OP_PLUS[uxn_c_l170_c3_d0c6]
signal BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output : unsigned(10 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_1d12]
signal queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(9 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(9 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_1d12]
signal queue_phase_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(1 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_1d12]
signal queue_write_value_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_38b0]
signal BIN_OP_PLUS_uxn_c_l178_c3_38b0_left : unsigned(9 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_38b0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output : unsigned(10 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_728b]
signal BIN_OP_EQ_uxn_c_l182_c16_728b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_728b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_728b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_be44]
signal BIN_OP_PLUS_uxn_c_l182_c39_be44_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_be44_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_5605]
signal MUX_uxn_c_l182_c16_5605_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_5605_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_5605_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_5605_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_c51b]
signal BIN_OP_AND_uxn_c_l184_c6_c51b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_c51b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_c51b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l184_c66_ec1f]
signal UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l184_c6_257c]
signal BIN_OP_AND_uxn_c_l184_c6_257c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_257c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l184_c6_257c_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l184_c2_74e8]
signal fill_y1_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal fill_y1_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_c_l184_c2_74e8]
signal y_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- fill_x1_MUX[uxn_c_l184_c2_74e8]
signal fill_x1_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal fill_x1_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- fill_x0_MUX[uxn_c_l184_c2_74e8]
signal fill_x0_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal fill_x0_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_c_l184_c2_74e8]
signal x_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- fill_color_MUX[uxn_c_l184_c2_74e8]
signal fill_color_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(1 downto 0);

-- fill_y0_MUX[uxn_c_l184_c2_74e8]
signal fill_y0_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
signal fill_y0_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);

-- is_fill_top_MUX[uxn_c_l184_c2_74e8]
signal is_fill_top_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);

-- is_fill_left_MUX[uxn_c_l184_c2_74e8]
signal is_fill_left_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);

-- is_fill_active_MUX[uxn_c_l184_c2_74e8]
signal is_fill_active_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);

-- fill_layer_MUX[uxn_c_l184_c2_74e8]
signal fill_layer_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l188_c13_fb10]
signal MUX_uxn_c_l188_c13_fb10_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_fb10_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_fb10_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l188_c13_fb10_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c28_1d02]
signal BIN_OP_AND_uxn_c_l189_c28_1d02_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_1d02_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c28_1d02_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l189_c13_ae79]
signal MUX_uxn_c_l189_c13_ae79_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_ae79_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_ae79_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l189_c13_ae79_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l190_c13_9957]
signal MUX_uxn_c_l190_c13_9957_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_9957_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_9957_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l190_c13_9957_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c32_bbed]
signal BIN_OP_AND_uxn_c_l191_c32_bbed_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_bbed_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c32_bbed_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l191_c13_1f53]
signal MUX_uxn_c_l191_c13_1f53_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_1f53_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_1f53_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l191_c13_1f53_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l200_c52_aa0b]
signal BIN_OP_AND_uxn_c_l200_c52_aa0b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_aa0b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l200_c52_a389]
signal MUX_uxn_c_l200_c52_a389_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l200_c52_a389_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_a389_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l200_c52_a389_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l200_c35_45ae]
signal BIN_OP_OR_uxn_c_l200_c35_45ae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_45ae_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l200_c35_45ae_return_output : unsigned(16 downto 0);

-- CONST_SL_8[uxn_c_l201_c56_6a94]
signal CONST_SL_8_uxn_c_l201_c56_6a94_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l201_c56_6a94_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l201_c56_4e37]
signal BIN_OP_PLUS_uxn_c_l201_c56_4e37_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_4e37_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l201_c37_0504]
signal MUX_uxn_c_l201_c37_0504_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c37_0504_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_0504_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c37_0504_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l201_c108_b1eb]
signal UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l201_c108_3030]
signal BIN_OP_AND_uxn_c_l201_c108_3030_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_3030_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l201_c108_3030_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l201_c108_ea8f]
signal MUX_uxn_c_l201_c108_ea8f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l201_c108_ea8f_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_ea8f_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l201_c108_ea8f_return_output : unsigned(16 downto 0);

-- BIN_OP_OR[uxn_c_l201_c37_e2b9]
signal BIN_OP_OR_uxn_c_l201_c37_e2b9_left : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_e2b9_right : unsigned(16 downto 0);
signal BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l203_c21_9376]
signal BIN_OP_EQ_uxn_c_l203_c21_9376_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_9376_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l203_c21_9376_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l203_c21_602e]
signal MUX_uxn_c_l203_c21_602e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_602e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_602e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l203_c21_602e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l204_c22_a30f]
signal BIN_OP_EQ_uxn_c_l204_c22_a30f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_a30f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l204_c22_dd39]
signal MUX_uxn_c_l204_c22_dd39_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_dd39_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_dd39_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l204_c22_dd39_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l205_c25_3ea8]
signal BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l205_c6_ef3b]
signal MUX_uxn_c_l205_c6_ef3b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l205_c6_ef3b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_ef3b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l205_c6_ef3b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l206_c34_a843]
signal BIN_OP_PLUS_uxn_c_l206_c34_a843_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_a843_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l206_c6_ad8c]
signal MUX_uxn_c_l206_c6_ad8c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l206_c6_ad8c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_ad8c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l206_c6_ad8c_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l208_c46_19f4]
signal UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l208_c27_5c72]
signal BIN_OP_AND_uxn_c_l208_c27_5c72_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_5c72_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l208_c27_5c72_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l209_c27_0bbe]
signal BIN_OP_AND_uxn_c_l209_c27_0bbe_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_0bbe_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l214_c3_223d]
signal MUX_uxn_c_l214_c3_223d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l214_c3_223d_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_223d_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l214_c3_223d_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l215_c71_229d]
signal UNARY_OP_NOT_uxn_c_l215_c71_229d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l215_c22_dcc0]
signal BIN_OP_AND_uxn_c_l215_c22_dcc0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_dcc0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l215_c3_4f41]
signal BIN_OP_OR_uxn_c_l215_c3_4f41_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_4f41_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l215_c3_4f41_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l211_c27_7af7]
signal bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_7af7_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_7af7_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l211_c27_7af7_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l211_c27_7af7_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l211_c27_7af7_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l221_c3_2c48]
signal MUX_uxn_c_l221_c3_2c48_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l221_c3_2c48_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_2c48_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l221_c3_2c48_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l222_c22_2b84]
signal BIN_OP_AND_uxn_c_l222_c22_2b84_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_2b84_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l222_c22_2b84_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l222_c3_9458]
signal BIN_OP_OR_uxn_c_l222_c3_9458_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_9458_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l222_c3_9458_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l218_c27_47cf]
signal fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_47cf_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_47cf_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l218_c27_47cf_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l218_c27_47cf_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l218_c27_47cf_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l225_c21_d417]
signal draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_d417_read_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_d417_write_address : unsigned(9 downto 0);
signal draw_queue_update_uxn_c_l225_c21_d417_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l225_c21_d417_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l225_c21_d417_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l232_c38_4789]
signal BIN_OP_AND_uxn_c_l232_c38_4789_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_4789_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l232_c38_4789_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l232_c38_30dc]
signal UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l232_c19_f30f]
signal MUX_uxn_c_l232_c19_f30f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_f30f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_f30f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l232_c19_f30f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l234_c19_56e9]
signal BIN_OP_EQ_uxn_c_l234_c19_56e9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_56e9_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l234_c76_dac3]
signal BIN_OP_PLUS_uxn_c_l234_c76_dac3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_dac3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l234_c50_9957]
signal MUX_uxn_c_l234_c50_9957_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c50_9957_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_9957_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c50_9957_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l234_c19_e4b1]
signal MUX_uxn_c_l234_c19_e4b1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l234_c19_e4b1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_e4b1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_c_l234_c19_e4b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l235_c25_a3cf]
signal BIN_OP_EQ_uxn_c_l235_c25_a3cf_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_a3cf_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l235_c25_219e]
signal MUX_uxn_c_l235_c25_219e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_219e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_219e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l235_c25_219e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l236_c17_7c52]
signal BIN_OP_EQ_uxn_c_l236_c17_7c52_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_7c52_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l236_c17_2ecf]
signal MUX_uxn_c_l236_c17_2ecf_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l236_c17_2ecf_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_2ecf_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l236_c17_2ecf_return_output : unsigned(1 downto 0);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l157_c2_859a
BIN_OP_XOR_uxn_c_l157_c2_859a : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_859a_left,
BIN_OP_XOR_uxn_c_l157_c2_859a_right,
BIN_OP_XOR_uxn_c_l157_c2_859a_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_47ea
BIN_OP_EQ_uxn_c_l158_c17_47ea : entity work.BIN_OP_EQ_uint10_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_47ea_left,
BIN_OP_EQ_uxn_c_l158_c17_47ea_right,
BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output);

-- MUX_uxn_c_l158_c17_29b4
MUX_uxn_c_l158_c17_29b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_29b4_cond,
MUX_uxn_c_l158_c17_29b4_iftrue,
MUX_uxn_c_l158_c17_29b4_iffalse,
MUX_uxn_c_l158_c17_29b4_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_8508
BIN_OP_EQ_uxn_c_l159_c18_8508 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_8508_left,
BIN_OP_EQ_uxn_c_l159_c18_8508_right,
BIN_OP_EQ_uxn_c_l159_c18_8508_return_output);

-- MUX_uxn_c_l159_c18_fc90
MUX_uxn_c_l159_c18_fc90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_fc90_cond,
MUX_uxn_c_l159_c18_fc90_iftrue,
MUX_uxn_c_l159_c18_fc90_iffalse,
MUX_uxn_c_l159_c18_fc90_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_178d
UNARY_OP_NOT_uxn_c_l161_c7_178d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_178d_expr,
UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_0d2e
UNARY_OP_NOT_uxn_c_l161_c38_0d2e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr,
UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_eb8b
BIN_OP_AND_uxn_c_l161_c7_eb8b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_eb8b_left,
BIN_OP_AND_uxn_c_l161_c7_eb8b_right,
BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_aa8d
BIN_OP_AND_uxn_c_l161_c7_aa8d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_aa8d_left,
BIN_OP_AND_uxn_c_l161_c7_aa8d_right,
BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_5280
queue_read_ptr_MUX_uxn_c_l161_c2_5280 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_5280
queue_phase_MUX_uxn_c_l161_c2_5280 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_5280_cond,
queue_phase_MUX_uxn_c_l161_c2_5280_iftrue,
queue_phase_MUX_uxn_c_l161_c2_5280_iffalse,
queue_phase_MUX_uxn_c_l161_c2_5280_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_5280
current_queue_item_MUX_uxn_c_l161_c2_5280 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_5280_cond,
current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_5280_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_d0c6
BIN_OP_PLUS_uxn_c_l170_c3_d0c6 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left,
BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right,
BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_1d12
queue_write_ptr_MUX_uxn_c_l173_c2_1d12 : entity work.MUX_uint1_t_uint10_t_uint10_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_1d12
queue_phase_MUX_uxn_c_l173_c2_1d12 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_1d12_cond,
queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue,
queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse,
queue_phase_MUX_uxn_c_l173_c2_1d12_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_1d12
queue_write_value_MUX_uxn_c_l173_c2_1d12 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_1d12_cond,
queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_38b0
BIN_OP_PLUS_uxn_c_l178_c3_38b0 : entity work.BIN_OP_PLUS_uint10_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_38b0_left,
BIN_OP_PLUS_uxn_c_l178_c3_38b0_right,
BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_728b
BIN_OP_EQ_uxn_c_l182_c16_728b : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_728b_left,
BIN_OP_EQ_uxn_c_l182_c16_728b_right,
BIN_OP_EQ_uxn_c_l182_c16_728b_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_be44
BIN_OP_PLUS_uxn_c_l182_c39_be44 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_be44_left,
BIN_OP_PLUS_uxn_c_l182_c39_be44_right,
BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output);

-- MUX_uxn_c_l182_c16_5605
MUX_uxn_c_l182_c16_5605 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_5605_cond,
MUX_uxn_c_l182_c16_5605_iftrue,
MUX_uxn_c_l182_c16_5605_iffalse,
MUX_uxn_c_l182_c16_5605_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_c51b
BIN_OP_AND_uxn_c_l184_c6_c51b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_c51b_left,
BIN_OP_AND_uxn_c_l184_c6_c51b_right,
BIN_OP_AND_uxn_c_l184_c6_c51b_return_output);

-- UNARY_OP_NOT_uxn_c_l184_c66_ec1f
UNARY_OP_NOT_uxn_c_l184_c66_ec1f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr,
UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output);

-- BIN_OP_AND_uxn_c_l184_c6_257c
BIN_OP_AND_uxn_c_l184_c6_257c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l184_c6_257c_left,
BIN_OP_AND_uxn_c_l184_c6_257c_right,
BIN_OP_AND_uxn_c_l184_c6_257c_return_output);

-- fill_y1_MUX_uxn_c_l184_c2_74e8
fill_y1_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l184_c2_74e8_cond,
fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_y1_MUX_uxn_c_l184_c2_74e8_return_output);

-- y_MUX_uxn_c_l184_c2_74e8
y_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l184_c2_74e8_cond,
y_MUX_uxn_c_l184_c2_74e8_iftrue,
y_MUX_uxn_c_l184_c2_74e8_iffalse,
y_MUX_uxn_c_l184_c2_74e8_return_output);

-- fill_x1_MUX_uxn_c_l184_c2_74e8
fill_x1_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l184_c2_74e8_cond,
fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_x1_MUX_uxn_c_l184_c2_74e8_return_output);

-- fill_x0_MUX_uxn_c_l184_c2_74e8
fill_x0_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l184_c2_74e8_cond,
fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_x0_MUX_uxn_c_l184_c2_74e8_return_output);

-- x_MUX_uxn_c_l184_c2_74e8
x_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l184_c2_74e8_cond,
x_MUX_uxn_c_l184_c2_74e8_iftrue,
x_MUX_uxn_c_l184_c2_74e8_iffalse,
x_MUX_uxn_c_l184_c2_74e8_return_output);

-- fill_color_MUX_uxn_c_l184_c2_74e8
fill_color_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l184_c2_74e8_cond,
fill_color_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_color_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_color_MUX_uxn_c_l184_c2_74e8_return_output);

-- fill_y0_MUX_uxn_c_l184_c2_74e8
fill_y0_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l184_c2_74e8_cond,
fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_y0_MUX_uxn_c_l184_c2_74e8_return_output);

-- is_fill_top_MUX_uxn_c_l184_c2_74e8
is_fill_top_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l184_c2_74e8_cond,
is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue,
is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse,
is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output);

-- is_fill_left_MUX_uxn_c_l184_c2_74e8
is_fill_left_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l184_c2_74e8_cond,
is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue,
is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse,
is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output);

-- is_fill_active_MUX_uxn_c_l184_c2_74e8
is_fill_active_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l184_c2_74e8_cond,
is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue,
is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse,
is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output);

-- fill_layer_MUX_uxn_c_l184_c2_74e8
fill_layer_MUX_uxn_c_l184_c2_74e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l184_c2_74e8_cond,
fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue,
fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse,
fill_layer_MUX_uxn_c_l184_c2_74e8_return_output);

-- MUX_uxn_c_l188_c13_fb10
MUX_uxn_c_l188_c13_fb10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_fb10_cond,
MUX_uxn_c_l188_c13_fb10_iftrue,
MUX_uxn_c_l188_c13_fb10_iffalse,
MUX_uxn_c_l188_c13_fb10_return_output);

-- BIN_OP_AND_uxn_c_l189_c28_1d02
BIN_OP_AND_uxn_c_l189_c28_1d02 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c28_1d02_left,
BIN_OP_AND_uxn_c_l189_c28_1d02_right,
BIN_OP_AND_uxn_c_l189_c28_1d02_return_output);

-- MUX_uxn_c_l189_c13_ae79
MUX_uxn_c_l189_c13_ae79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_ae79_cond,
MUX_uxn_c_l189_c13_ae79_iftrue,
MUX_uxn_c_l189_c13_ae79_iffalse,
MUX_uxn_c_l189_c13_ae79_return_output);

-- MUX_uxn_c_l190_c13_9957
MUX_uxn_c_l190_c13_9957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_9957_cond,
MUX_uxn_c_l190_c13_9957_iftrue,
MUX_uxn_c_l190_c13_9957_iffalse,
MUX_uxn_c_l190_c13_9957_return_output);

-- BIN_OP_AND_uxn_c_l191_c32_bbed
BIN_OP_AND_uxn_c_l191_c32_bbed : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c32_bbed_left,
BIN_OP_AND_uxn_c_l191_c32_bbed_right,
BIN_OP_AND_uxn_c_l191_c32_bbed_return_output);

-- MUX_uxn_c_l191_c13_1f53
MUX_uxn_c_l191_c13_1f53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_1f53_cond,
MUX_uxn_c_l191_c13_1f53_iftrue,
MUX_uxn_c_l191_c13_1f53_iffalse,
MUX_uxn_c_l191_c13_1f53_return_output);

-- BIN_OP_AND_uxn_c_l200_c52_aa0b
BIN_OP_AND_uxn_c_l200_c52_aa0b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l200_c52_aa0b_left,
BIN_OP_AND_uxn_c_l200_c52_aa0b_right,
BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output);

-- MUX_uxn_c_l200_c52_a389
MUX_uxn_c_l200_c52_a389 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l200_c52_a389_cond,
MUX_uxn_c_l200_c52_a389_iftrue,
MUX_uxn_c_l200_c52_a389_iffalse,
MUX_uxn_c_l200_c52_a389_return_output);

-- BIN_OP_OR_uxn_c_l200_c35_45ae
BIN_OP_OR_uxn_c_l200_c35_45ae : entity work.BIN_OP_OR_uint16_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l200_c35_45ae_left,
BIN_OP_OR_uxn_c_l200_c35_45ae_right,
BIN_OP_OR_uxn_c_l200_c35_45ae_return_output);

-- CONST_SL_8_uxn_c_l201_c56_6a94
CONST_SL_8_uxn_c_l201_c56_6a94 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l201_c56_6a94_x,
CONST_SL_8_uxn_c_l201_c56_6a94_return_output);

-- BIN_OP_PLUS_uxn_c_l201_c56_4e37
BIN_OP_PLUS_uxn_c_l201_c56_4e37 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l201_c56_4e37_left,
BIN_OP_PLUS_uxn_c_l201_c56_4e37_right,
BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output);

-- MUX_uxn_c_l201_c37_0504
MUX_uxn_c_l201_c37_0504 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c37_0504_cond,
MUX_uxn_c_l201_c37_0504_iftrue,
MUX_uxn_c_l201_c37_0504_iffalse,
MUX_uxn_c_l201_c37_0504_return_output);

-- UNARY_OP_NOT_uxn_c_l201_c108_b1eb
UNARY_OP_NOT_uxn_c_l201_c108_b1eb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr,
UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output);

-- BIN_OP_AND_uxn_c_l201_c108_3030
BIN_OP_AND_uxn_c_l201_c108_3030 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l201_c108_3030_left,
BIN_OP_AND_uxn_c_l201_c108_3030_right,
BIN_OP_AND_uxn_c_l201_c108_3030_return_output);

-- MUX_uxn_c_l201_c108_ea8f
MUX_uxn_c_l201_c108_ea8f : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l201_c108_ea8f_cond,
MUX_uxn_c_l201_c108_ea8f_iftrue,
MUX_uxn_c_l201_c108_ea8f_iffalse,
MUX_uxn_c_l201_c108_ea8f_return_output);

-- BIN_OP_OR_uxn_c_l201_c37_e2b9
BIN_OP_OR_uxn_c_l201_c37_e2b9 : entity work.BIN_OP_OR_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l201_c37_e2b9_left,
BIN_OP_OR_uxn_c_l201_c37_e2b9_right,
BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output);

-- BIN_OP_EQ_uxn_c_l203_c21_9376
BIN_OP_EQ_uxn_c_l203_c21_9376 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l203_c21_9376_left,
BIN_OP_EQ_uxn_c_l203_c21_9376_right,
BIN_OP_EQ_uxn_c_l203_c21_9376_return_output);

-- MUX_uxn_c_l203_c21_602e
MUX_uxn_c_l203_c21_602e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l203_c21_602e_cond,
MUX_uxn_c_l203_c21_602e_iftrue,
MUX_uxn_c_l203_c21_602e_iffalse,
MUX_uxn_c_l203_c21_602e_return_output);

-- BIN_OP_EQ_uxn_c_l204_c22_a30f
BIN_OP_EQ_uxn_c_l204_c22_a30f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l204_c22_a30f_left,
BIN_OP_EQ_uxn_c_l204_c22_a30f_right,
BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output);

-- MUX_uxn_c_l204_c22_dd39
MUX_uxn_c_l204_c22_dd39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l204_c22_dd39_cond,
MUX_uxn_c_l204_c22_dd39_iftrue,
MUX_uxn_c_l204_c22_dd39_iffalse,
MUX_uxn_c_l204_c22_dd39_return_output);

-- BIN_OP_PLUS_uxn_c_l205_c25_3ea8
BIN_OP_PLUS_uxn_c_l205_c25_3ea8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left,
BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right,
BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output);

-- MUX_uxn_c_l205_c6_ef3b
MUX_uxn_c_l205_c6_ef3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l205_c6_ef3b_cond,
MUX_uxn_c_l205_c6_ef3b_iftrue,
MUX_uxn_c_l205_c6_ef3b_iffalse,
MUX_uxn_c_l205_c6_ef3b_return_output);

-- BIN_OP_PLUS_uxn_c_l206_c34_a843
BIN_OP_PLUS_uxn_c_l206_c34_a843 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l206_c34_a843_left,
BIN_OP_PLUS_uxn_c_l206_c34_a843_right,
BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output);

-- MUX_uxn_c_l206_c6_ad8c
MUX_uxn_c_l206_c6_ad8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l206_c6_ad8c_cond,
MUX_uxn_c_l206_c6_ad8c_iftrue,
MUX_uxn_c_l206_c6_ad8c_iffalse,
MUX_uxn_c_l206_c6_ad8c_return_output);

-- UNARY_OP_NOT_uxn_c_l208_c46_19f4
UNARY_OP_NOT_uxn_c_l208_c46_19f4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr,
UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output);

-- BIN_OP_AND_uxn_c_l208_c27_5c72
BIN_OP_AND_uxn_c_l208_c27_5c72 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l208_c27_5c72_left,
BIN_OP_AND_uxn_c_l208_c27_5c72_right,
BIN_OP_AND_uxn_c_l208_c27_5c72_return_output);

-- BIN_OP_AND_uxn_c_l209_c27_0bbe
BIN_OP_AND_uxn_c_l209_c27_0bbe : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l209_c27_0bbe_left,
BIN_OP_AND_uxn_c_l209_c27_0bbe_right,
BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output);

-- MUX_uxn_c_l214_c3_223d
MUX_uxn_c_l214_c3_223d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l214_c3_223d_cond,
MUX_uxn_c_l214_c3_223d_iftrue,
MUX_uxn_c_l214_c3_223d_iffalse,
MUX_uxn_c_l214_c3_223d_return_output);

-- UNARY_OP_NOT_uxn_c_l215_c71_229d
UNARY_OP_NOT_uxn_c_l215_c71_229d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l215_c71_229d_expr,
UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output);

-- BIN_OP_AND_uxn_c_l215_c22_dcc0
BIN_OP_AND_uxn_c_l215_c22_dcc0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c22_dcc0_left,
BIN_OP_AND_uxn_c_l215_c22_dcc0_right,
BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output);

-- BIN_OP_OR_uxn_c_l215_c3_4f41
BIN_OP_OR_uxn_c_l215_c3_4f41 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l215_c3_4f41_left,
BIN_OP_OR_uxn_c_l215_c3_4f41_right,
BIN_OP_OR_uxn_c_l215_c3_4f41_return_output);

-- bg_vram_update_uxn_c_l211_c27_7af7
bg_vram_update_uxn_c_l211_c27_7af7 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE,
bg_vram_update_uxn_c_l211_c27_7af7_read_address,
bg_vram_update_uxn_c_l211_c27_7af7_write_address,
bg_vram_update_uxn_c_l211_c27_7af7_write_value,
bg_vram_update_uxn_c_l211_c27_7af7_write_enable,
bg_vram_update_uxn_c_l211_c27_7af7_return_output);

-- MUX_uxn_c_l221_c3_2c48
MUX_uxn_c_l221_c3_2c48 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l221_c3_2c48_cond,
MUX_uxn_c_l221_c3_2c48_iftrue,
MUX_uxn_c_l221_c3_2c48_iffalse,
MUX_uxn_c_l221_c3_2c48_return_output);

-- BIN_OP_AND_uxn_c_l222_c22_2b84
BIN_OP_AND_uxn_c_l222_c22_2b84 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l222_c22_2b84_left,
BIN_OP_AND_uxn_c_l222_c22_2b84_right,
BIN_OP_AND_uxn_c_l222_c22_2b84_return_output);

-- BIN_OP_OR_uxn_c_l222_c3_9458
BIN_OP_OR_uxn_c_l222_c3_9458 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l222_c3_9458_left,
BIN_OP_OR_uxn_c_l222_c3_9458_right,
BIN_OP_OR_uxn_c_l222_c3_9458_return_output);

-- fg_vram_update_uxn_c_l218_c27_47cf
fg_vram_update_uxn_c_l218_c27_47cf : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE,
fg_vram_update_uxn_c_l218_c27_47cf_read_address,
fg_vram_update_uxn_c_l218_c27_47cf_write_address,
fg_vram_update_uxn_c_l218_c27_47cf_write_value,
fg_vram_update_uxn_c_l218_c27_47cf_write_enable,
fg_vram_update_uxn_c_l218_c27_47cf_return_output);

-- draw_queue_update_uxn_c_l225_c21_d417
draw_queue_update_uxn_c_l225_c21_d417 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE,
draw_queue_update_uxn_c_l225_c21_d417_read_address,
draw_queue_update_uxn_c_l225_c21_d417_write_address,
draw_queue_update_uxn_c_l225_c21_d417_write_value,
draw_queue_update_uxn_c_l225_c21_d417_write_enable,
draw_queue_update_uxn_c_l225_c21_d417_return_output);

-- BIN_OP_AND_uxn_c_l232_c38_4789
BIN_OP_AND_uxn_c_l232_c38_4789 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l232_c38_4789_left,
BIN_OP_AND_uxn_c_l232_c38_4789_right,
BIN_OP_AND_uxn_c_l232_c38_4789_return_output);

-- UNARY_OP_NOT_uxn_c_l232_c38_30dc
UNARY_OP_NOT_uxn_c_l232_c38_30dc : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr,
UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output);

-- MUX_uxn_c_l232_c19_f30f
MUX_uxn_c_l232_c19_f30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l232_c19_f30f_cond,
MUX_uxn_c_l232_c19_f30f_iftrue,
MUX_uxn_c_l232_c19_f30f_iffalse,
MUX_uxn_c_l232_c19_f30f_return_output);

-- BIN_OP_EQ_uxn_c_l234_c19_56e9
BIN_OP_EQ_uxn_c_l234_c19_56e9 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l234_c19_56e9_left,
BIN_OP_EQ_uxn_c_l234_c19_56e9_right,
BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output);

-- BIN_OP_PLUS_uxn_c_l234_c76_dac3
BIN_OP_PLUS_uxn_c_l234_c76_dac3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l234_c76_dac3_left,
BIN_OP_PLUS_uxn_c_l234_c76_dac3_right,
BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output);

-- MUX_uxn_c_l234_c50_9957
MUX_uxn_c_l234_c50_9957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c50_9957_cond,
MUX_uxn_c_l234_c50_9957_iftrue,
MUX_uxn_c_l234_c50_9957_iffalse,
MUX_uxn_c_l234_c50_9957_return_output);

-- MUX_uxn_c_l234_c19_e4b1
MUX_uxn_c_l234_c19_e4b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_c_l234_c19_e4b1_cond,
MUX_uxn_c_l234_c19_e4b1_iftrue,
MUX_uxn_c_l234_c19_e4b1_iffalse,
MUX_uxn_c_l234_c19_e4b1_return_output);

-- BIN_OP_EQ_uxn_c_l235_c25_a3cf
BIN_OP_EQ_uxn_c_l235_c25_a3cf : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l235_c25_a3cf_left,
BIN_OP_EQ_uxn_c_l235_c25_a3cf_right,
BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output);

-- MUX_uxn_c_l235_c25_219e
MUX_uxn_c_l235_c25_219e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l235_c25_219e_cond,
MUX_uxn_c_l235_c25_219e_iftrue,
MUX_uxn_c_l235_c25_219e_iffalse,
MUX_uxn_c_l235_c25_219e_return_output);

-- BIN_OP_EQ_uxn_c_l236_c17_7c52
BIN_OP_EQ_uxn_c_l236_c17_7c52 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l236_c17_7c52_left,
BIN_OP_EQ_uxn_c_l236_c17_7c52_right,
BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output);

-- MUX_uxn_c_l236_c17_2ecf
MUX_uxn_c_l236_c17_2ecf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l236_c17_2ecf_cond,
MUX_uxn_c_l236_c17_2ecf_iftrue,
MUX_uxn_c_l236_c17_2ecf_iffalse,
MUX_uxn_c_l236_c17_2ecf_return_output);

-- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x,
CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output);



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
 BIN_OP_XOR_uxn_c_l157_c2_859a_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output,
 MUX_uxn_c_l158_c17_29b4_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_8508_return_output,
 MUX_uxn_c_l159_c18_fc90_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output,
 BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output,
 BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output,
 queue_phase_MUX_uxn_c_l161_c2_5280_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_5280_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output,
 queue_phase_MUX_uxn_c_l173_c2_1d12_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_728b_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output,
 MUX_uxn_c_l182_c16_5605_return_output,
 BIN_OP_AND_uxn_c_l184_c6_c51b_return_output,
 UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output,
 BIN_OP_AND_uxn_c_l184_c6_257c_return_output,
 fill_y1_MUX_uxn_c_l184_c2_74e8_return_output,
 y_MUX_uxn_c_l184_c2_74e8_return_output,
 fill_x1_MUX_uxn_c_l184_c2_74e8_return_output,
 fill_x0_MUX_uxn_c_l184_c2_74e8_return_output,
 x_MUX_uxn_c_l184_c2_74e8_return_output,
 fill_color_MUX_uxn_c_l184_c2_74e8_return_output,
 fill_y0_MUX_uxn_c_l184_c2_74e8_return_output,
 is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output,
 is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output,
 is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output,
 fill_layer_MUX_uxn_c_l184_c2_74e8_return_output,
 MUX_uxn_c_l188_c13_fb10_return_output,
 BIN_OP_AND_uxn_c_l189_c28_1d02_return_output,
 MUX_uxn_c_l189_c13_ae79_return_output,
 MUX_uxn_c_l190_c13_9957_return_output,
 BIN_OP_AND_uxn_c_l191_c32_bbed_return_output,
 MUX_uxn_c_l191_c13_1f53_return_output,
 BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output,
 MUX_uxn_c_l200_c52_a389_return_output,
 BIN_OP_OR_uxn_c_l200_c35_45ae_return_output,
 CONST_SL_8_uxn_c_l201_c56_6a94_return_output,
 BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output,
 MUX_uxn_c_l201_c37_0504_return_output,
 UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output,
 BIN_OP_AND_uxn_c_l201_c108_3030_return_output,
 MUX_uxn_c_l201_c108_ea8f_return_output,
 BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output,
 BIN_OP_EQ_uxn_c_l203_c21_9376_return_output,
 MUX_uxn_c_l203_c21_602e_return_output,
 BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output,
 MUX_uxn_c_l204_c22_dd39_return_output,
 BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output,
 MUX_uxn_c_l205_c6_ef3b_return_output,
 BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output,
 MUX_uxn_c_l206_c6_ad8c_return_output,
 UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output,
 BIN_OP_AND_uxn_c_l208_c27_5c72_return_output,
 BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output,
 MUX_uxn_c_l214_c3_223d_return_output,
 UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output,
 BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output,
 BIN_OP_OR_uxn_c_l215_c3_4f41_return_output,
 bg_vram_update_uxn_c_l211_c27_7af7_return_output,
 MUX_uxn_c_l221_c3_2c48_return_output,
 BIN_OP_AND_uxn_c_l222_c22_2b84_return_output,
 BIN_OP_OR_uxn_c_l222_c3_9458_return_output,
 fg_vram_update_uxn_c_l218_c27_47cf_return_output,
 draw_queue_update_uxn_c_l225_c21_d417_return_output,
 BIN_OP_AND_uxn_c_l232_c38_4789_return_output,
 UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output,
 MUX_uxn_c_l232_c19_f30f_return_output,
 BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output,
 BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output,
 MUX_uxn_c_l234_c50_9957_return_output,
 MUX_uxn_c_l234_c19_e4b1_return_output,
 BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output,
 MUX_uxn_c_l235_c25_219e_return_output,
 BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output,
 MUX_uxn_c_l236_c17_2ecf_return_output,
 CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_29b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_29b4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_29b4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_29b4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc90_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc90_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_fc90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_093c_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_e90b : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output : unsigned(9 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_db83 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_5280_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_5280_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_1136_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_651d_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_b3f0_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_169d_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_e907_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_03b8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output : unsigned(10 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_5ddb : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(9 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_16a2 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_uxn_c_l176_c3_2c71 : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_uxn_c_l174_c3_6b8d : unsigned(23 downto 0);
 variable VAR_uint32_uint16_0_uxn_c_l174_c23_7ffb_return_output : unsigned(31 downto 0);
 variable VAR_queue_write_value_uxn_c_l175_c3_21c9 : unsigned(23 downto 0);
 variable VAR_uint32_uint5_16_uxn_c_l175_c23_d8d4_return_output : unsigned(31 downto 0);
 variable VAR_uint32_uint1_21_uxn_c_l176_c23_3e52_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_left : unsigned(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output : unsigned(10 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_5605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_5605_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_5605_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_5605_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_a9c3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_257c_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_257c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(15 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_8d1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_39e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_fb10_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_fb10_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_fb10_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_fb10_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_ae79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_ae79_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_ae79_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_ae79_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9957_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9957_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9957_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9957_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_1f53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_1f53_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_1f53_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_1f53_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_read_address : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_a389_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_a389_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_a389_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l200_c52_a389_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_0504_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_6a94_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l201_c56_6a94_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_0504_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_0504_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c37_0504_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_left : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_ea8f_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_3030_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_3030_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l201_c108_3030_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_ea8f_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_ea8f_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l201_c108_ea8f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_602e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_602e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_602e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l203_c21_602e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_dd39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_dd39_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_dd39_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l204_c22_dd39_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_ef3b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_ef3b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_ef3b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l205_c6_ef3b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_ad8c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_ad8c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_ad8c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l206_c6_ad8c_return_output : unsigned(15 downto 0);
 variable VAR_is_fill_pixel0 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_pixel1 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output : unsigned(0 downto 0);
 variable VAR_bg_pixel_color : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_223d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_223d_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_223d_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l214_c3_223d_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l211_c27_7af7_return_output : unsigned(1 downto 0);
 variable VAR_fg_pixel_color : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_2c48_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_2c48_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_2c48_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l221_c3_2c48_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_9458_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_9458_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l222_c3_9458_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l218_c27_47cf_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_read_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_write_address : unsigned(9 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l225_c21_d417_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_f30f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_f30f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_f30f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_4789_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_4789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l232_c38_4789_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l232_c19_f30f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e4b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e4b1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e4b1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_9957_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_9957_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_9957_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l234_c50_9957_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l234_c19_e4b1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_219e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_219e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_219e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l235_c25_219e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_2ecf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_2ecf_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_2ecf_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l236_c17_2ecf_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_ac58_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l215_l222_l184_DUPLICATE_c9d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_dbb3_return_output : gpu_step_result_t;
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
     VAR_queue_phase_uxn_c_l177_c3_16a2 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue := VAR_queue_phase_uxn_c_l177_c3_16a2;
     VAR_MUX_uxn_c_l234_c19_e4b1_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_c_l201_c108_ea8f_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_queue_phase_uxn_c_l169_c3_db83 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iftrue := VAR_queue_phase_uxn_c_l169_c3_db83;
     VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l182_c16_5605_iftrue := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l158_c17_29b4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l159_c18_fc90_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l188_c13_fb10_iffalse := resize(to_unsigned(239, 8), 16);
     VAR_MUX_uxn_c_l235_c25_219e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l203_c21_602e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l189_c13_ae79_iffalse := resize(to_unsigned(255, 8), 16);
     VAR_MUX_uxn_c_l201_c108_ea8f_iftrue := to_unsigned(65536, 17);
     VAR_MUX_uxn_c_l204_c22_dd39_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l204_c22_dd39_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_right := to_unsigned(255, 16);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l158_c17_29b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_right := to_unsigned(255, 16);
     VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l235_c25_219e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l191_c13_1f53_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l232_c19_f30f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l200_c52_a389_iffalse := resize(to_unsigned(0, 1), 17);
     VAR_MUX_uxn_c_l203_c21_602e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l159_c18_fc90_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l200_c52_a389_iftrue := to_unsigned(65536, 17);
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l190_c13_9957_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l201_c108_3030_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse := fill_y1;
     VAR_MUX_uxn_c_l234_c50_9957_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l225_c21_d417_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_left := pixel_counter;
     VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_left := pixel_counter;
     VAR_MUX_uxn_c_l234_c50_9957_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l184_c2_74e8_iffalse := x;
     VAR_y_MUX_uxn_c_l184_c2_74e8_iffalse := y;
     -- BIN_OP_PLUS[uxn_c_l170_c3_d0c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_left;
     BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output := BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output;

     -- uint24_18_18[uxn_c_l164_c33_b3f0] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_b3f0_return_output := uint24_18_18(
     queue_read_value);

     -- uint24_15_0[uxn_c_l162_c37_1136] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_1136_return_output := uint24_15_0(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l234_c76_dac3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l234_c76_dac3_left <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_left;
     BIN_OP_PLUS_uxn_c_l234_c76_dac3_right <= VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output := BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output;

     -- BIN_OP_EQ[uxn_c_l234_c19_56e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l234_c19_56e9_left <= VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_left;
     BIN_OP_EQ_uxn_c_l234_c19_56e9_right <= VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output := BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_093c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_093c_return_output := current_queue_item.is_valid;

     -- uint24_20_20[uxn_c_l166_c32_e907] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_e907_return_output := uint24_20_20(
     queue_read_value);

     -- BIN_OP_XOR[uxn_c_l157_c2_859a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_859a_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_left;
     BIN_OP_XOR_uxn_c_l157_c2_859a_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_return_output := BIN_OP_XOR_uxn_c_l157_c2_859a_return_output;

     -- BIN_OP_EQ[uxn_c_l158_c17_47ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_47ea_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_left;
     BIN_OP_EQ_uxn_c_l158_c17_47ea_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output := BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output;

     -- BIN_OP_PLUS[uxn_c_l178_c3_38b0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_38b0_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_left;
     BIN_OP_PLUS_uxn_c_l178_c3_38b0_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output := BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output;

     -- BIN_OP_EQ[uxn_c_l159_c18_8508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_8508_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_left;
     BIN_OP_EQ_uxn_c_l159_c18_8508_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_return_output := BIN_OP_EQ_uxn_c_l159_c18_8508_return_output;

     -- uint32_uint16_0[uxn_c_l174_c23_7ffb] LATENCY=0
     VAR_uint32_uint16_0_uxn_c_l174_c23_7ffb_return_output := uint32_uint16_0(
     resize(to_unsigned(0, 1), 32),
     VAR_vram_address);

     -- uint24_17_16[uxn_c_l163_c30_651d] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_651d_return_output := uint24_17_16(
     queue_read_value);

     -- UNARY_OP_NOT[uxn_c_l184_c66_ec1f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr <= VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output := UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output;

     -- uint24_19_19[uxn_c_l165_c34_169d] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_169d_return_output := uint24_19_19(
     queue_read_value);

     -- uint24_21_21[uxn_c_l167_c30_03b8] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_03b8_return_output := uint24_21_21(
     queue_read_value);

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_29b4_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_47ea_return_output;
     VAR_MUX_uxn_c_l159_c18_fc90_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_8508_return_output;
     VAR_MUX_uxn_c_l234_c19_e4b1_cond := VAR_BIN_OP_EQ_uxn_c_l234_c19_56e9_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_e90b := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_d0c6_return_output, 10);
     VAR_queue_write_ptr_uxn_c_l178_c3_5ddb := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_38b0_return_output, 10);
     VAR_MUX_uxn_c_l234_c50_9957_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l234_c76_dac3_return_output, 16);
     VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_859a_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_093c_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_257c_right := VAR_UNARY_OP_NOT_uxn_c_l184_c66_ec1f_return_output;
     VAR_queue_write_value_uxn_c_l174_c3_6b8d := resize(VAR_uint32_uint16_0_uxn_c_l174_c23_7ffb_return_output, 24);
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_e90b;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_5ddb;
     -- BIN_OP_AND[uxn_c_l200_c52_aa0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l200_c52_aa0b_left <= VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_left;
     BIN_OP_AND_uxn_c_l200_c52_aa0b_right <= VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output := BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output;

     -- UNARY_OP_NOT[uxn_c_l201_c108_b1eb] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr <= VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output := UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output;

     -- MUX[uxn_c_l159_c18_fc90] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_fc90_cond <= VAR_MUX_uxn_c_l159_c18_fc90_cond;
     MUX_uxn_c_l159_c18_fc90_iftrue <= VAR_MUX_uxn_c_l159_c18_fc90_iftrue;
     MUX_uxn_c_l159_c18_fc90_iffalse <= VAR_MUX_uxn_c_l159_c18_fc90_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_fc90_return_output := MUX_uxn_c_l159_c18_fc90_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_5280] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_5280_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_1136_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_651d_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_b3f0_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_169d_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_e907_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_03b8_return_output,
     to_unsigned(1, 1));

     -- uint32_uint5_16[uxn_c_l175_c23_d8d4] LATENCY=0
     VAR_uint32_uint5_16_uxn_c_l175_c23_d8d4_return_output := uint32_uint5_16(
     resize(VAR_queue_write_value_uxn_c_l174_c3_6b8d, 32),
     resize(VAR_vram_value, 5));

     -- MUX[uxn_c_l234_c50_9957] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c50_9957_cond <= VAR_MUX_uxn_c_l234_c50_9957_cond;
     MUX_uxn_c_l234_c50_9957_iftrue <= VAR_MUX_uxn_c_l234_c50_9957_iftrue;
     MUX_uxn_c_l234_c50_9957_iffalse <= VAR_MUX_uxn_c_l234_c50_9957_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c50_9957_return_output := MUX_uxn_c_l234_c50_9957_return_output;

     -- MUX[uxn_c_l158_c17_29b4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_29b4_cond <= VAR_MUX_uxn_c_l158_c17_29b4_cond;
     MUX_uxn_c_l158_c17_29b4_iftrue <= VAR_MUX_uxn_c_l158_c17_29b4_iftrue;
     MUX_uxn_c_l158_c17_29b4_iffalse <= VAR_MUX_uxn_c_l158_c17_29b4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_29b4_return_output := MUX_uxn_c_l158_c17_29b4_return_output;

     -- queue_write_ptr_MUX[uxn_c_l173_c2_1d12] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c7_178d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_178d_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output := UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l200_c52_a389_cond := VAR_BIN_OP_AND_uxn_c_l200_c52_aa0b_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr := VAR_MUX_uxn_c_l158_c17_29b4_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_29b4_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_right := VAR_MUX_uxn_c_l159_c18_fc90_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_fc90_return_output;
     VAR_MUX_uxn_c_l234_c19_e4b1_iffalse := VAR_MUX_uxn_c_l234_c50_9957_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_178d_return_output;
     VAR_BIN_OP_AND_uxn_c_l201_c108_3030_left := VAR_UNARY_OP_NOT_uxn_c_l201_c108_b1eb_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_5280_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_d417_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_1d12_return_output;
     VAR_queue_write_value_uxn_c_l175_c3_21c9 := resize(VAR_uint32_uint5_16_uxn_c_l175_c23_d8d4_return_output, 24);
     -- MUX[uxn_c_l200_c52_a389] LATENCY=0
     -- Inputs
     MUX_uxn_c_l200_c52_a389_cond <= VAR_MUX_uxn_c_l200_c52_a389_cond;
     MUX_uxn_c_l200_c52_a389_iftrue <= VAR_MUX_uxn_c_l200_c52_a389_iftrue;
     MUX_uxn_c_l200_c52_a389_iffalse <= VAR_MUX_uxn_c_l200_c52_a389_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l200_c52_a389_return_output := MUX_uxn_c_l200_c52_a389_return_output;

     -- BIN_OP_AND[uxn_c_l201_c108_3030] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l201_c108_3030_left <= VAR_BIN_OP_AND_uxn_c_l201_c108_3030_left;
     BIN_OP_AND_uxn_c_l201_c108_3030_right <= VAR_BIN_OP_AND_uxn_c_l201_c108_3030_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l201_c108_3030_return_output := BIN_OP_AND_uxn_c_l201_c108_3030_return_output;

     -- MUX[uxn_c_l234_c19_e4b1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l234_c19_e4b1_cond <= VAR_MUX_uxn_c_l234_c19_e4b1_cond;
     MUX_uxn_c_l234_c19_e4b1_iftrue <= VAR_MUX_uxn_c_l234_c19_e4b1_iftrue;
     MUX_uxn_c_l234_c19_e4b1_iffalse <= VAR_MUX_uxn_c_l234_c19_e4b1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l234_c19_e4b1_return_output := MUX_uxn_c_l234_c19_e4b1_return_output;

     -- UNARY_OP_NOT[uxn_c_l161_c38_0d2e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output := UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output;

     -- uint32_uint1_21[uxn_c_l176_c23_3e52] LATENCY=0
     VAR_uint32_uint1_21_uxn_c_l176_c23_3e52_return_output := uint32_uint1_21(
     resize(VAR_queue_write_value_uxn_c_l175_c3_21c9, 32),
     VAR_vram_write_layer);

     -- Submodule level 3
     VAR_MUX_uxn_c_l201_c108_ea8f_cond := VAR_BIN_OP_AND_uxn_c_l201_c108_3030_return_output;
     VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_right := VAR_MUX_uxn_c_l200_c52_a389_return_output;
     VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_left := VAR_MUX_uxn_c_l234_c19_e4b1_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l234_c19_e4b1_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_0d2e_return_output;
     VAR_queue_write_value_uxn_c_l176_c3_2c71 := resize(VAR_uint32_uint1_21_uxn_c_l176_c23_3e52_return_output, 24);
     VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue := VAR_queue_write_value_uxn_c_l176_c3_2c71;
     -- BIN_OP_EQ[uxn_c_l235_c25_a3cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l235_c25_a3cf_left <= VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_left;
     BIN_OP_EQ_uxn_c_l235_c25_a3cf_right <= VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output := BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output;

     -- BIN_OP_OR[uxn_c_l200_c35_45ae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l200_c35_45ae_left <= VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_left;
     BIN_OP_OR_uxn_c_l200_c35_45ae_right <= VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_return_output := BIN_OP_OR_uxn_c_l200_c35_45ae_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_1d12] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_1d12_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_cond;
     queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output := queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output;

     -- MUX[uxn_c_l201_c108_ea8f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c108_ea8f_cond <= VAR_MUX_uxn_c_l201_c108_ea8f_cond;
     MUX_uxn_c_l201_c108_ea8f_iftrue <= VAR_MUX_uxn_c_l201_c108_ea8f_iftrue;
     MUX_uxn_c_l201_c108_ea8f_iffalse <= VAR_MUX_uxn_c_l201_c108_ea8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c108_ea8f_return_output := MUX_uxn_c_l201_c108_ea8f_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_eb8b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_eb8b_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_left;
     BIN_OP_AND_uxn_c_l161_c7_eb8b_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output := BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_left := VAR_BIN_OP_AND_uxn_c_l161_c7_eb8b_return_output;
     VAR_MUX_uxn_c_l235_c25_219e_cond := VAR_BIN_OP_EQ_uxn_c_l235_c25_a3cf_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_read_address := VAR_BIN_OP_OR_uxn_c_l200_c35_45ae_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_right := VAR_MUX_uxn_c_l201_c108_ea8f_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_d417_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_1d12_return_output;
     -- MUX[uxn_c_l235_c25_219e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l235_c25_219e_cond <= VAR_MUX_uxn_c_l235_c25_219e_cond;
     MUX_uxn_c_l235_c25_219e_iftrue <= VAR_MUX_uxn_c_l235_c25_219e_iftrue;
     MUX_uxn_c_l235_c25_219e_iffalse <= VAR_MUX_uxn_c_l235_c25_219e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l235_c25_219e_return_output := MUX_uxn_c_l235_c25_219e_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_aa8d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_aa8d_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_left;
     BIN_OP_AND_uxn_c_l161_c7_aa8d_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output := BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_5280_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_aa8d_return_output;
     -- queue_read_ptr_MUX[uxn_c_l161_c2_5280] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output;

     -- queue_phase_MUX[uxn_c_l161_c2_5280] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_5280_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_5280_cond;
     queue_phase_MUX_uxn_c_l161_c2_5280_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_5280_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_5280_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_5280_return_output := queue_phase_MUX_uxn_c_l161_c2_5280_return_output;

     -- current_queue_item_MUX[uxn_c_l161_c2_5280] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_5280_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_cond;
     current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output := current_queue_item_MUX_uxn_c_l161_c2_5280_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_5280_return_output;
     VAR_draw_queue_update_uxn_c_l225_c21_d417_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_5280_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l215_l222_l184_DUPLICATE_c9d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l215_l222_l184_DUPLICATE_c9d6_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.is_valid;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_39e2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_39e2_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.fill_left;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_8d1a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_8d1a_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.fill_top;

     -- draw_queue_update[uxn_c_l225_c21_d417] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l225_c21_d417_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l225_c21_d417_read_address <= VAR_draw_queue_update_uxn_c_l225_c21_d417_read_address;
     draw_queue_update_uxn_c_l225_c21_d417_write_address <= VAR_draw_queue_update_uxn_c_l225_c21_d417_write_address;
     draw_queue_update_uxn_c_l225_c21_d417_write_value <= VAR_draw_queue_update_uxn_c_l225_c21_d417_write_value;
     draw_queue_update_uxn_c_l225_c21_d417_write_enable <= VAR_draw_queue_update_uxn_c_l225_c21_d417_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l225_c21_d417_return_output := draw_queue_update_uxn_c_l225_c21_d417_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d[uxn_c_l184_c36_a9c3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_a9c3_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.is_fill;

     -- queue_phase_MUX[uxn_c_l173_c2_1d12] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_1d12_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_cond;
     queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_return_output := queue_phase_MUX_uxn_c_l173_c2_1d12_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.layer;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.color;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output.vram_address;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output;
     VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_left := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output;
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output;
     VAR_MUX_uxn_c_l201_c37_0504_iffalse := resize(VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l191_l190_l189_l201_l188_DUPLICATE_74b5_return_output, 17);
     VAR_MUX_uxn_c_l189_c13_ae79_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_39e2_return_output;
     VAR_MUX_uxn_c_l191_c13_1f53_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_39e2_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_39e2_return_output;
     VAR_MUX_uxn_c_l188_c13_fb10_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_8d1a_return_output;
     VAR_MUX_uxn_c_l190_c13_9957_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_8d1a_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_8d1a_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l184_c36_a9c3_return_output;
     VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l215_l222_l184_DUPLICATE_c9d6_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l215_l222_l184_DUPLICATE_c9d6_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l222_l215_l192_DUPLICATE_fdc1_return_output;
     VAR_MUX_uxn_c_l214_c3_223d_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26_return_output;
     VAR_MUX_uxn_c_l221_c3_2c48_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26_return_output;
     VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l214_l221_l193_DUPLICATE_ef26_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l225_c21_d417_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_left := VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_left := VAR_queue_phase_MUX_uxn_c_l173_c2_1d12_return_output;
     -- BIN_OP_EQ[uxn_c_l182_c16_728b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_728b_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_left;
     BIN_OP_EQ_uxn_c_l182_c16_728b_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_return_output := BIN_OP_EQ_uxn_c_l182_c16_728b_return_output;

     -- BIN_OP_AND[uxn_c_l191_c32_bbed] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c32_bbed_left <= VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_left;
     BIN_OP_AND_uxn_c_l191_c32_bbed_right <= VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_return_output := BIN_OP_AND_uxn_c_l191_c32_bbed_return_output;

     -- BIN_OP_AND[uxn_c_l184_c6_c51b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_c51b_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_left;
     BIN_OP_AND_uxn_c_l184_c6_c51b_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_return_output := BIN_OP_AND_uxn_c_l184_c6_c51b_return_output;

     -- UNARY_OP_NOT[uxn_c_l215_c71_229d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l215_c71_229d_expr <= VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output := UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output;

     -- BIN_OP_AND[uxn_c_l189_c28_1d02] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c28_1d02_left <= VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_left;
     BIN_OP_AND_uxn_c_l189_c28_1d02_right <= VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_return_output := BIN_OP_AND_uxn_c_l189_c28_1d02_return_output;

     -- CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x <= VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output := CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c39_be44] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_be44_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_left;
     BIN_OP_PLUS_uxn_c_l182_c39_be44_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output := BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l184_c6_257c_left := VAR_BIN_OP_AND_uxn_c_l184_c6_c51b_return_output;
     VAR_MUX_uxn_c_l189_c13_ae79_iftrue := VAR_BIN_OP_AND_uxn_c_l189_c28_1d02_return_output;
     VAR_MUX_uxn_c_l191_c13_1f53_iffalse := VAR_BIN_OP_AND_uxn_c_l191_c32_bbed_return_output;
     VAR_MUX_uxn_c_l182_c16_5605_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_728b_return_output;
     VAR_MUX_uxn_c_l182_c16_5605_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_be44_return_output, 2);
     VAR_MUX_uxn_c_l188_c13_fb10_iftrue := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output;
     VAR_MUX_uxn_c_l190_c13_9957_iffalse := VAR_CONST_SR_8_uint16_t_uxn_c_l188_l190_DUPLICATE_174b_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_right := VAR_UNARY_OP_NOT_uxn_c_l215_c71_229d_return_output;
     -- BIN_OP_AND[uxn_c_l184_c6_257c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l184_c6_257c_left <= VAR_BIN_OP_AND_uxn_c_l184_c6_257c_left;
     BIN_OP_AND_uxn_c_l184_c6_257c_right <= VAR_BIN_OP_AND_uxn_c_l184_c6_257c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output := BIN_OP_AND_uxn_c_l184_c6_257c_return_output;

     -- MUX[uxn_c_l188_c13_fb10] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_fb10_cond <= VAR_MUX_uxn_c_l188_c13_fb10_cond;
     MUX_uxn_c_l188_c13_fb10_iftrue <= VAR_MUX_uxn_c_l188_c13_fb10_iftrue;
     MUX_uxn_c_l188_c13_fb10_iffalse <= VAR_MUX_uxn_c_l188_c13_fb10_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_fb10_return_output := MUX_uxn_c_l188_c13_fb10_return_output;

     -- MUX[uxn_c_l189_c13_ae79] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_ae79_cond <= VAR_MUX_uxn_c_l189_c13_ae79_cond;
     MUX_uxn_c_l189_c13_ae79_iftrue <= VAR_MUX_uxn_c_l189_c13_ae79_iftrue;
     MUX_uxn_c_l189_c13_ae79_iffalse <= VAR_MUX_uxn_c_l189_c13_ae79_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_ae79_return_output := MUX_uxn_c_l189_c13_ae79_return_output;

     -- MUX[uxn_c_l182_c16_5605] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_5605_cond <= VAR_MUX_uxn_c_l182_c16_5605_cond;
     MUX_uxn_c_l182_c16_5605_iftrue <= VAR_MUX_uxn_c_l182_c16_5605_iftrue;
     MUX_uxn_c_l182_c16_5605_iffalse <= VAR_MUX_uxn_c_l182_c16_5605_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_5605_return_output := MUX_uxn_c_l182_c16_5605_return_output;

     -- MUX[uxn_c_l191_c13_1f53] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_1f53_cond <= VAR_MUX_uxn_c_l191_c13_1f53_cond;
     MUX_uxn_c_l191_c13_1f53_iftrue <= VAR_MUX_uxn_c_l191_c13_1f53_iftrue;
     MUX_uxn_c_l191_c13_1f53_iffalse <= VAR_MUX_uxn_c_l191_c13_1f53_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_1f53_return_output := MUX_uxn_c_l191_c13_1f53_return_output;

     -- MUX[uxn_c_l190_c13_9957] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_9957_cond <= VAR_MUX_uxn_c_l190_c13_9957_cond;
     MUX_uxn_c_l190_c13_9957_iftrue <= VAR_MUX_uxn_c_l190_c13_9957_iftrue;
     MUX_uxn_c_l190_c13_9957_iffalse <= VAR_MUX_uxn_c_l190_c13_9957_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_9957_return_output := MUX_uxn_c_l190_c13_9957_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_x_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     VAR_y_MUX_uxn_c_l184_c2_74e8_cond := VAR_BIN_OP_AND_uxn_c_l184_c6_257c_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_5605_return_output;
     VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l188_c13_fb10_return_output;
     VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l189_c13_ae79_return_output;
     VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l190_c13_9957_return_output;
     VAR_y_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l190_c13_9957_return_output;
     VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l191_c13_1f53_return_output;
     VAR_x_MUX_uxn_c_l184_c2_74e8_iftrue := VAR_MUX_uxn_c_l191_c13_1f53_return_output;
     -- is_fill_left_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l184_c2_74e8_cond <= VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_cond;
     is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iftrue;
     is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output := is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_x1_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_cond;
     fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_return_output := fill_x1_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_y0_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_cond;
     fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_return_output := fill_y0_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_color_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_color_MUX_uxn_c_l184_c2_74e8_cond;
     fill_color_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_color_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_color_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l184_c2_74e8_return_output := fill_color_MUX_uxn_c_l184_c2_74e8_return_output;

     -- y_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l184_c2_74e8_cond <= VAR_y_MUX_uxn_c_l184_c2_74e8_cond;
     y_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_y_MUX_uxn_c_l184_c2_74e8_iftrue;
     y_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_y_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l184_c2_74e8_return_output := y_MUX_uxn_c_l184_c2_74e8_return_output;

     -- is_fill_top_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l184_c2_74e8_cond <= VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_cond;
     is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iftrue;
     is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output := is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_x0_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_cond;
     fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_return_output := fill_x0_MUX_uxn_c_l184_c2_74e8_return_output;

     -- is_fill_active_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l184_c2_74e8_cond <= VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_cond;
     is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iftrue;
     is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output := is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_y1_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_cond;
     fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_return_output := fill_y1_MUX_uxn_c_l184_c2_74e8_return_output;

     -- fill_layer_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l184_c2_74e8_cond <= VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_cond;
     fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iftrue;
     fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_return_output := fill_layer_MUX_uxn_c_l184_c2_74e8_return_output;

     -- x_MUX[uxn_c_l184_c2_74e8] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l184_c2_74e8_cond <= VAR_x_MUX_uxn_c_l184_c2_74e8_cond;
     x_MUX_uxn_c_l184_c2_74e8_iftrue <= VAR_x_MUX_uxn_c_l184_c2_74e8_iftrue;
     x_MUX_uxn_c_l184_c2_74e8_iffalse <= VAR_x_MUX_uxn_c_l184_c2_74e8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l184_c2_74e8_return_output := x_MUX_uxn_c_l184_c2_74e8_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l214_c3_223d_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_MUX_uxn_c_l221_c3_2c48_iftrue := VAR_fill_color_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_right := VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr := VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_MUX_uxn_c_l206_c6_ad8c_iftrue := VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_right := VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_right := VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_left := VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_MUX_uxn_c_l201_c37_0504_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_MUX_uxn_c_l232_c19_f30f_cond := VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr := VAR_is_fill_active_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l184_c2_74e8_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_left := VAR_x_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_right := VAR_x_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_left := VAR_x_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_left := VAR_y_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left := VAR_y_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_CONST_SL_8_uxn_c_l201_c56_6a94_x := VAR_y_MUX_uxn_c_l184_c2_74e8_return_output;
     VAR_MUX_uxn_c_l205_c6_ef3b_iffalse := VAR_y_MUX_uxn_c_l184_c2_74e8_return_output;
     -- UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output;

     -- BIN_OP_EQ[uxn_c_l204_c22_a30f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l204_c22_a30f_left <= VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_left;
     BIN_OP_EQ_uxn_c_l204_c22_a30f_right <= VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output := BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output;

     -- BIN_OP_AND[uxn_c_l209_c27_0bbe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l209_c27_0bbe_left <= VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_left;
     BIN_OP_AND_uxn_c_l209_c27_0bbe_right <= VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output := BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output;

     -- CONST_SL_8[uxn_c_l201_c56_6a94] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l201_c56_6a94_x <= VAR_CONST_SL_8_uxn_c_l201_c56_6a94_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l201_c56_6a94_return_output := CONST_SL_8_uxn_c_l201_c56_6a94_return_output;

     -- BIN_OP_PLUS[uxn_c_l206_c34_a843] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l206_c34_a843_left <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_left;
     BIN_OP_PLUS_uxn_c_l206_c34_a843_right <= VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output := BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output;

     -- UNARY_OP_NOT[uxn_c_l208_c46_19f4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr <= VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output := UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output;

     -- BIN_OP_EQ[uxn_c_l203_c21_9376] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l203_c21_9376_left <= VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_left;
     BIN_OP_EQ_uxn_c_l203_c21_9376_right <= VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_return_output := BIN_OP_EQ_uxn_c_l203_c21_9376_return_output;

     -- BIN_OP_PLUS[uxn_c_l205_c25_3ea8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_left;
     BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right <= VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output := BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l222_c3_9458_left := VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output;
     VAR_MUX_uxn_c_l221_c3_2c48_cond := VAR_BIN_OP_AND_uxn_c_l209_c27_0bbe_return_output;
     VAR_MUX_uxn_c_l203_c21_602e_cond := VAR_BIN_OP_EQ_uxn_c_l203_c21_9376_return_output;
     VAR_MUX_uxn_c_l204_c22_dd39_cond := VAR_BIN_OP_EQ_uxn_c_l204_c22_a30f_return_output;
     VAR_MUX_uxn_c_l205_c6_ef3b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l205_c25_3ea8_return_output, 16);
     VAR_MUX_uxn_c_l206_c6_ad8c_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l206_c34_a843_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_left := VAR_CONST_SL_8_uxn_c_l201_c56_6a94_return_output;
     VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_right := VAR_UNARY_OP_NOT_uxn_c_l208_c46_19f4_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l222_l215_DUPLICATE_d963_return_output;
     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output;

     -- MUX[uxn_c_l203_c21_602e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l203_c21_602e_cond <= VAR_MUX_uxn_c_l203_c21_602e_cond;
     MUX_uxn_c_l203_c21_602e_iftrue <= VAR_MUX_uxn_c_l203_c21_602e_iftrue;
     MUX_uxn_c_l203_c21_602e_iffalse <= VAR_MUX_uxn_c_l203_c21_602e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l203_c21_602e_return_output := MUX_uxn_c_l203_c21_602e_return_output;

     -- BIN_OP_PLUS[uxn_c_l201_c56_4e37] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l201_c56_4e37_left <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_left;
     BIN_OP_PLUS_uxn_c_l201_c56_4e37_right <= VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output := BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output;

     -- MUX[uxn_c_l221_c3_2c48] LATENCY=0
     -- Inputs
     MUX_uxn_c_l221_c3_2c48_cond <= VAR_MUX_uxn_c_l221_c3_2c48_cond;
     MUX_uxn_c_l221_c3_2c48_iftrue <= VAR_MUX_uxn_c_l221_c3_2c48_iftrue;
     MUX_uxn_c_l221_c3_2c48_iffalse <= VAR_MUX_uxn_c_l221_c3_2c48_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l221_c3_2c48_return_output := MUX_uxn_c_l221_c3_2c48_return_output;

     -- MUX[uxn_c_l204_c22_dd39] LATENCY=0
     -- Inputs
     MUX_uxn_c_l204_c22_dd39_cond <= VAR_MUX_uxn_c_l204_c22_dd39_cond;
     MUX_uxn_c_l204_c22_dd39_iftrue <= VAR_MUX_uxn_c_l204_c22_dd39_iftrue;
     MUX_uxn_c_l204_c22_dd39_iffalse <= VAR_MUX_uxn_c_l204_c22_dd39_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l204_c22_dd39_return_output := MUX_uxn_c_l204_c22_dd39_return_output;

     -- BIN_OP_AND[uxn_c_l208_c27_5c72] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l208_c27_5c72_left <= VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_left;
     BIN_OP_AND_uxn_c_l208_c27_5c72_right <= VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_return_output := BIN_OP_AND_uxn_c_l208_c27_5c72_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_left := VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_return_output;
     VAR_MUX_uxn_c_l214_c3_223d_cond := VAR_BIN_OP_AND_uxn_c_l208_c27_5c72_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output;
     VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l215_l222_DUPLICATE_2af0_return_output;
     VAR_MUX_uxn_c_l201_c37_0504_iftrue := VAR_BIN_OP_PLUS_uxn_c_l201_c56_4e37_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_4789_left := VAR_MUX_uxn_c_l203_c21_602e_return_output;
     VAR_MUX_uxn_c_l205_c6_ef3b_cond := VAR_MUX_uxn_c_l203_c21_602e_return_output;
     VAR_MUX_uxn_c_l206_c6_ad8c_cond := VAR_MUX_uxn_c_l203_c21_602e_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l203_c21_602e_return_output;
     VAR_BIN_OP_AND_uxn_c_l232_c38_4789_right := VAR_MUX_uxn_c_l204_c22_dd39_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l204_c22_dd39_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_value := VAR_MUX_uxn_c_l221_c3_2c48_return_output;
     -- BIN_OP_AND[uxn_c_l222_c22_2b84] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l222_c22_2b84_left <= VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_left;
     BIN_OP_AND_uxn_c_l222_c22_2b84_right <= VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_return_output := BIN_OP_AND_uxn_c_l222_c22_2b84_return_output;

     -- MUX[uxn_c_l201_c37_0504] LATENCY=0
     -- Inputs
     MUX_uxn_c_l201_c37_0504_cond <= VAR_MUX_uxn_c_l201_c37_0504_cond;
     MUX_uxn_c_l201_c37_0504_iftrue <= VAR_MUX_uxn_c_l201_c37_0504_iftrue;
     MUX_uxn_c_l201_c37_0504_iffalse <= VAR_MUX_uxn_c_l201_c37_0504_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l201_c37_0504_return_output := MUX_uxn_c_l201_c37_0504_return_output;

     -- MUX[uxn_c_l206_c6_ad8c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l206_c6_ad8c_cond <= VAR_MUX_uxn_c_l206_c6_ad8c_cond;
     MUX_uxn_c_l206_c6_ad8c_iftrue <= VAR_MUX_uxn_c_l206_c6_ad8c_iftrue;
     MUX_uxn_c_l206_c6_ad8c_iffalse <= VAR_MUX_uxn_c_l206_c6_ad8c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l206_c6_ad8c_return_output := MUX_uxn_c_l206_c6_ad8c_return_output;

     -- BIN_OP_AND[uxn_c_l215_c22_dcc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c22_dcc0_left <= VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_left;
     BIN_OP_AND_uxn_c_l215_c22_dcc0_right <= VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output := BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output;

     -- BIN_OP_AND[uxn_c_l232_c38_4789] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l232_c38_4789_left <= VAR_BIN_OP_AND_uxn_c_l232_c38_4789_left;
     BIN_OP_AND_uxn_c_l232_c38_4789_right <= VAR_BIN_OP_AND_uxn_c_l232_c38_4789_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l232_c38_4789_return_output := BIN_OP_AND_uxn_c_l232_c38_4789_return_output;

     -- MUX[uxn_c_l214_c3_223d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l214_c3_223d_cond <= VAR_MUX_uxn_c_l214_c3_223d_cond;
     MUX_uxn_c_l214_c3_223d_iftrue <= VAR_MUX_uxn_c_l214_c3_223d_iftrue;
     MUX_uxn_c_l214_c3_223d_iffalse <= VAR_MUX_uxn_c_l214_c3_223d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l214_c3_223d_return_output := MUX_uxn_c_l214_c3_223d_return_output;

     -- MUX[uxn_c_l205_c6_ef3b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l205_c6_ef3b_cond <= VAR_MUX_uxn_c_l205_c6_ef3b_cond;
     MUX_uxn_c_l205_c6_ef3b_iftrue <= VAR_MUX_uxn_c_l205_c6_ef3b_iftrue;
     MUX_uxn_c_l205_c6_ef3b_iffalse <= VAR_MUX_uxn_c_l205_c6_ef3b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l205_c6_ef3b_return_output := MUX_uxn_c_l205_c6_ef3b_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_right := VAR_BIN_OP_AND_uxn_c_l215_c22_dcc0_return_output;
     VAR_BIN_OP_OR_uxn_c_l222_c3_9458_right := VAR_BIN_OP_AND_uxn_c_l222_c22_2b84_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr := VAR_BIN_OP_AND_uxn_c_l232_c38_4789_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_left := VAR_MUX_uxn_c_l201_c37_0504_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l205_c6_ef3b_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l206_c6_ad8c_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_value := VAR_MUX_uxn_c_l214_c3_223d_return_output;
     -- BIN_OP_OR[uxn_c_l215_c3_4f41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l215_c3_4f41_left <= VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_left;
     BIN_OP_OR_uxn_c_l215_c3_4f41_right <= VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_return_output := BIN_OP_OR_uxn_c_l215_c3_4f41_return_output;

     -- BIN_OP_OR[uxn_c_l222_c3_9458] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l222_c3_9458_left <= VAR_BIN_OP_OR_uxn_c_l222_c3_9458_left;
     BIN_OP_OR_uxn_c_l222_c3_9458_right <= VAR_BIN_OP_OR_uxn_c_l222_c3_9458_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l222_c3_9458_return_output := BIN_OP_OR_uxn_c_l222_c3_9458_return_output;

     -- BIN_OP_OR[uxn_c_l201_c37_e2b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l201_c37_e2b9_left <= VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_left;
     BIN_OP_OR_uxn_c_l201_c37_e2b9_right <= VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output := BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output;

     -- UNARY_OP_NOT[uxn_c_l232_c38_30dc] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr <= VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output := UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output;

     -- Submodule level 14
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_address := VAR_BIN_OP_OR_uxn_c_l201_c37_e2b9_return_output;
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_enable := VAR_BIN_OP_OR_uxn_c_l215_c3_4f41_return_output;
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_enable := VAR_BIN_OP_OR_uxn_c_l222_c3_9458_return_output;
     VAR_MUX_uxn_c_l232_c19_f30f_iftrue := VAR_UNARY_OP_NOT_uxn_c_l232_c38_30dc_return_output;
     -- fg_vram_update[uxn_c_l218_c27_47cf] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l218_c27_47cf_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l218_c27_47cf_read_address <= VAR_fg_vram_update_uxn_c_l218_c27_47cf_read_address;
     fg_vram_update_uxn_c_l218_c27_47cf_write_address <= VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_address;
     fg_vram_update_uxn_c_l218_c27_47cf_write_value <= VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_value;
     fg_vram_update_uxn_c_l218_c27_47cf_write_enable <= VAR_fg_vram_update_uxn_c_l218_c27_47cf_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l218_c27_47cf_return_output := fg_vram_update_uxn_c_l218_c27_47cf_return_output;

     -- MUX[uxn_c_l232_c19_f30f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l232_c19_f30f_cond <= VAR_MUX_uxn_c_l232_c19_f30f_cond;
     MUX_uxn_c_l232_c19_f30f_iftrue <= VAR_MUX_uxn_c_l232_c19_f30f_iftrue;
     MUX_uxn_c_l232_c19_f30f_iffalse <= VAR_MUX_uxn_c_l232_c19_f30f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l232_c19_f30f_return_output := MUX_uxn_c_l232_c19_f30f_return_output;

     -- bg_vram_update[uxn_c_l211_c27_7af7] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l211_c27_7af7_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l211_c27_7af7_read_address <= VAR_bg_vram_update_uxn_c_l211_c27_7af7_read_address;
     bg_vram_update_uxn_c_l211_c27_7af7_write_address <= VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_address;
     bg_vram_update_uxn_c_l211_c27_7af7_write_value <= VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_value;
     bg_vram_update_uxn_c_l211_c27_7af7_write_enable <= VAR_bg_vram_update_uxn_c_l211_c27_7af7_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l211_c27_7af7_return_output := bg_vram_update_uxn_c_l211_c27_7af7_return_output;

     -- Submodule level 15
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l232_c19_f30f_return_output;
     VAR_MUX_uxn_c_l236_c17_2ecf_iftrue := VAR_bg_vram_update_uxn_c_l211_c27_7af7_return_output;
     VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_left := VAR_fg_vram_update_uxn_c_l218_c27_47cf_return_output;
     VAR_MUX_uxn_c_l236_c17_2ecf_iffalse := VAR_fg_vram_update_uxn_c_l218_c27_47cf_return_output;
     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_ac58] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_ac58_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_5280_return_output,
     VAR_MUX_uxn_c_l232_c19_f30f_return_output);

     -- BIN_OP_EQ[uxn_c_l236_c17_7c52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l236_c17_7c52_left <= VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_left;
     BIN_OP_EQ_uxn_c_l236_c17_7c52_right <= VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output := BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output;

     -- Submodule level 16
     VAR_MUX_uxn_c_l236_c17_2ecf_cond := VAR_BIN_OP_EQ_uxn_c_l236_c17_7c52_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_ac58_return_output;
     -- MUX[uxn_c_l236_c17_2ecf] LATENCY=0
     -- Inputs
     MUX_uxn_c_l236_c17_2ecf_cond <= VAR_MUX_uxn_c_l236_c17_2ecf_cond;
     MUX_uxn_c_l236_c17_2ecf_iftrue <= VAR_MUX_uxn_c_l236_c17_2ecf_iftrue;
     MUX_uxn_c_l236_c17_2ecf_iffalse <= VAR_MUX_uxn_c_l236_c17_2ecf_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l236_c17_2ecf_return_output := MUX_uxn_c_l236_c17_2ecf_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_dbb3 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_dbb3_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l235_c25_219e_return_output,
     VAR_MUX_uxn_c_l236_c17_2ecf_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_dbb3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l238_l136_DUPLICATE_dbb3_return_output;
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
