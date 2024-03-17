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
-- Submodules: 99
entity step_gpu_0CLK_1c3fc61f is
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
end step_gpu_0CLK_1c3fc61f;
architecture arch of step_gpu_0CLK_1c3fc61f is
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
signal queue_read_ptr : unsigned(12 downto 0) := to_unsigned(0, 13);
signal queue_write_ptr : unsigned(12 downto 0) := to_unsigned(0, 13);
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
signal REG_COMB_queue_read_ptr : unsigned(12 downto 0);
signal REG_COMB_queue_write_ptr : unsigned(12 downto 0);
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
-- BIN_OP_XOR[uxn_c_l157_c2_a699]
signal BIN_OP_XOR_uxn_c_l157_c2_a699_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_a699_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_a699_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_58e3]
signal BIN_OP_EQ_uxn_c_l158_c17_58e3_left : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_58e3_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_dd7a]
signal MUX_uxn_c_l158_c17_dd7a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dd7a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dd7a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_dd7a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_3f5f]
signal BIN_OP_EQ_uxn_c_l159_c18_3f5f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_3f5f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_85c2]
signal MUX_uxn_c_l159_c18_85c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_85c2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_85c2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_85c2_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_5c58]
signal UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_ec46]
signal UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_73d3]
signal BIN_OP_AND_uxn_c_l161_c7_73d3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_73d3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_73d3_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_f512]
signal BIN_OP_AND_uxn_c_l161_c7_f512_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_f512_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_f512_return_output : unsigned(0 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_4103]
signal current_queue_item_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_4103_return_output : draw_command_t;

-- queue_read_ptr_MUX[uxn_c_l161_c2_4103]
signal queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue : unsigned(12 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse : unsigned(12 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output : unsigned(12 downto 0);

-- queue_phase_MUX[uxn_c_l161_c2_4103]
signal queue_phase_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4103_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4103_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4103_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_91a0]
signal BIN_OP_PLUS_uxn_c_l170_c3_91a0_left : unsigned(12 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_91a0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output : unsigned(13 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_e79a]
signal queue_phase_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(1 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_e79a]
signal queue_write_value_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(23 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_e79a]
signal queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(12 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(12 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(12 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_4648]
signal BIN_OP_PLUS_uxn_c_l178_c3_4648_left : unsigned(12 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_4648_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output : unsigned(13 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_e403]
signal BIN_OP_EQ_uxn_c_l182_c16_e403_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_e403_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_e403_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_8bf6]
signal BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_2c7a]
signal MUX_uxn_c_l182_c16_2c7a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_2c7a_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_2c7a_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_2c7a_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l185_c6_e3da]
signal BIN_OP_AND_uxn_c_l185_c6_e3da_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_e3da_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_e3da_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l185_c66_77ab]
signal UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l185_c6_d2db]
signal BIN_OP_AND_uxn_c_l185_c6_d2db_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_d2db_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_d2db_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l185_c2_1cc2]
signal fill_y0_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- fill_color_MUX[uxn_c_l185_c2_1cc2]
signal fill_color_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(1 downto 0);

-- is_fill_left_MUX[uxn_c_l185_c2_1cc2]
signal is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l185_c2_1cc2]
signal fill_y1_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- fill_x0_MUX[uxn_c_l185_c2_1cc2]
signal fill_x0_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- is_fill_top_MUX[uxn_c_l185_c2_1cc2]
signal is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);

-- fill_x1_MUX[uxn_c_l185_c2_1cc2]
signal fill_x1_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_c_l185_c2_1cc2]
signal y_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- is_fill_active_MUX[uxn_c_l185_c2_1cc2]
signal is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l185_c2_1cc2]
signal x_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);

-- fill_layer_MUX[uxn_c_l185_c2_1cc2]
signal fill_layer_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l188_c13_4835]
signal MUX_uxn_c_l188_c13_4835_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_4835_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_4835_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_4835_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l189_c13_bb40]
signal MUX_uxn_c_l189_c13_bb40_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_bb40_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_bb40_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_bb40_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l190_c13_9842]
signal MUX_uxn_c_l190_c13_9842_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_9842_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_9842_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_9842_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l191_c13_0953]
signal MUX_uxn_c_l191_c13_0953_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_0953_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l191_c13_0953_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l191_c13_0953_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l199_c44_80d1]
signal UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l199_c13_affa]
signal BIN_OP_AND_uxn_c_l199_c13_affa_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l199_c13_affa_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l199_c13_affa_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_c_l199_c9_d985]
signal y_MUX_uxn_c_l199_c9_d985_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l199_c9_d985_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l199_c9_d985_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l199_c9_d985_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_c_l199_c9_d985]
signal x_MUX_uxn_c_l199_c9_d985_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l199_c9_d985_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l199_c9_d985_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l199_c9_d985_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l204_c57_7da4]
signal BIN_OP_AND_uxn_c_l204_c57_7da4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c57_7da4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c57_7da4_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l207_c68_c109]
signal UNARY_OP_NOT_uxn_c_l207_c68_c109_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l207_c68_162f]
signal BIN_OP_AND_uxn_c_l207_c68_162f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l207_c68_162f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l207_c68_162f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l209_c21_76b3]
signal BIN_OP_EQ_uxn_c_l209_c21_76b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c21_76b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l209_c21_bcb5]
signal MUX_uxn_c_l209_c21_bcb5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_bcb5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_bcb5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_bcb5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l210_c22_0381]
signal BIN_OP_EQ_uxn_c_l210_c22_0381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c22_0381_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c22_0381_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l210_c22_49b4]
signal MUX_uxn_c_l210_c22_49b4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_49b4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_49b4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_49b4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l211_c25_58e7]
signal BIN_OP_PLUS_uxn_c_l211_c25_58e7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c25_58e7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l211_c6_faa7]
signal MUX_uxn_c_l211_c6_faa7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l211_c6_faa7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_faa7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_faa7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l212_c34_ae82]
signal BIN_OP_PLUS_uxn_c_l212_c34_ae82_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l212_c34_ae82_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l212_c6_076e]
signal MUX_uxn_c_l212_c6_076e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l212_c6_076e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l212_c6_076e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l212_c6_076e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l214_c38_6569]
signal UNARY_OP_NOT_uxn_c_l214_c38_6569_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l214_c19_d189]
signal BIN_OP_AND_uxn_c_l214_c19_d189_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_d189_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_d189_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l215_c19_32c7]
signal BIN_OP_AND_uxn_c_l215_c19_32c7_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c19_32c7_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c19_32c7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l220_c3_f052]
signal MUX_uxn_c_l220_c3_f052_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l220_c3_f052_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l220_c3_f052_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l220_c3_f052_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l221_c71_20df]
signal UNARY_OP_NOT_uxn_c_l221_c71_20df_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l221_c22_01d8]
signal BIN_OP_AND_uxn_c_l221_c22_01d8_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l221_c22_01d8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l221_c22_01d8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l221_c3_1b71]
signal BIN_OP_OR_uxn_c_l221_c3_1b71_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l221_c3_1b71_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l221_c3_1b71_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l217_c19_ca26]
signal bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l217_c19_ca26_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l217_c19_ca26_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l217_c19_ca26_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l217_c19_ca26_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l217_c19_ca26_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l227_c3_3166]
signal MUX_uxn_c_l227_c3_3166_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l227_c3_3166_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l227_c3_3166_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l227_c3_3166_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l228_c22_2563]
signal BIN_OP_AND_uxn_c_l228_c22_2563_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l228_c22_2563_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l228_c22_2563_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l228_c3_4ead]
signal BIN_OP_OR_uxn_c_l228_c3_4ead_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l228_c3_4ead_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l228_c3_4ead_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l224_c19_75f8]
signal fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l224_c19_75f8_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l224_c19_75f8_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l224_c19_75f8_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l224_c19_75f8_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l224_c19_75f8_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l231_c21_aa97]
signal draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l231_c21_aa97_read_address : unsigned(12 downto 0);
signal draw_queue_update_uxn_c_l231_c21_aa97_write_address : unsigned(12 downto 0);
signal draw_queue_update_uxn_c_l231_c21_aa97_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l231_c21_aa97_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l231_c21_aa97_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l238_c38_f074]
signal BIN_OP_AND_uxn_c_l238_c38_f074_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l238_c38_f074_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l238_c38_f074_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l238_c38_18e7]
signal UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l238_c19_0a86]
signal MUX_uxn_c_l238_c19_0a86_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_0a86_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_0a86_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_0a86_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c19_b368]
signal BIN_OP_EQ_uxn_c_l240_c19_b368_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c19_b368_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c19_b368_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l240_c76_8272]
signal BIN_OP_PLUS_uxn_c_l240_c76_8272_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_c_l240_c76_8272_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l240_c50_ccce]
signal MUX_uxn_c_l240_c50_ccce_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c50_ccce_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c50_ccce_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c50_ccce_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l240_c19_41c7]
signal MUX_uxn_c_l240_c19_41c7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c19_41c7_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c19_41c7_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c19_41c7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l241_c25_4dfc]
signal BIN_OP_EQ_uxn_c_l241_c25_4dfc_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c25_4dfc_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l241_c25_09fd]
signal MUX_uxn_c_l241_c25_09fd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_09fd_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_09fd_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_09fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l242_c17_3a7b]
signal BIN_OP_EQ_uxn_c_l242_c17_3a7b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c17_3a7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l242_c17_b96b]
signal MUX_uxn_c_l242_c17_b96b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l242_c17_b96b_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l242_c17_b96b_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l242_c17_b96b_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09
signal UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output : unsigned(0 downto 0);

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

function uint16_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint17_15_0( x : unsigned) return unsigned is
--variable x : unsigned(16 downto 0);
  variable return_output : unsigned(15 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 0)));
return return_output;
end function;

function uint16_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
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
-- BIN_OP_XOR_uxn_c_l157_c2_a699
BIN_OP_XOR_uxn_c_l157_c2_a699 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_a699_left,
BIN_OP_XOR_uxn_c_l157_c2_a699_right,
BIN_OP_XOR_uxn_c_l157_c2_a699_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_58e3
BIN_OP_EQ_uxn_c_l158_c17_58e3 : entity work.BIN_OP_EQ_uint13_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_58e3_left,
BIN_OP_EQ_uxn_c_l158_c17_58e3_right,
BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output);

-- MUX_uxn_c_l158_c17_dd7a
MUX_uxn_c_l158_c17_dd7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_dd7a_cond,
MUX_uxn_c_l158_c17_dd7a_iftrue,
MUX_uxn_c_l158_c17_dd7a_iffalse,
MUX_uxn_c_l158_c17_dd7a_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_3f5f
BIN_OP_EQ_uxn_c_l159_c18_3f5f : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_3f5f_left,
BIN_OP_EQ_uxn_c_l159_c18_3f5f_right,
BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output);

-- MUX_uxn_c_l159_c18_85c2
MUX_uxn_c_l159_c18_85c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_85c2_cond,
MUX_uxn_c_l159_c18_85c2_iftrue,
MUX_uxn_c_l159_c18_85c2_iffalse,
MUX_uxn_c_l159_c18_85c2_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_5c58
UNARY_OP_NOT_uxn_c_l161_c7_5c58 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr,
UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_ec46
UNARY_OP_NOT_uxn_c_l161_c38_ec46 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr,
UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_73d3
BIN_OP_AND_uxn_c_l161_c7_73d3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_73d3_left,
BIN_OP_AND_uxn_c_l161_c7_73d3_right,
BIN_OP_AND_uxn_c_l161_c7_73d3_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_f512
BIN_OP_AND_uxn_c_l161_c7_f512 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_f512_left,
BIN_OP_AND_uxn_c_l161_c7_f512_right,
BIN_OP_AND_uxn_c_l161_c7_f512_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_4103
current_queue_item_MUX_uxn_c_l161_c2_4103 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_4103_cond,
current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_4103_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_4103
queue_read_ptr_MUX_uxn_c_l161_c2_4103 : entity work.MUX_uint1_t_uint13_t_uint13_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_4103
queue_phase_MUX_uxn_c_l161_c2_4103 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_4103_cond,
queue_phase_MUX_uxn_c_l161_c2_4103_iftrue,
queue_phase_MUX_uxn_c_l161_c2_4103_iffalse,
queue_phase_MUX_uxn_c_l161_c2_4103_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_91a0
BIN_OP_PLUS_uxn_c_l170_c3_91a0 : entity work.BIN_OP_PLUS_uint13_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_91a0_left,
BIN_OP_PLUS_uxn_c_l170_c3_91a0_right,
BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_e79a
queue_phase_MUX_uxn_c_l173_c2_e79a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_e79a_cond,
queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue,
queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse,
queue_phase_MUX_uxn_c_l173_c2_e79a_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_e79a
queue_write_value_MUX_uxn_c_l173_c2_e79a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_e79a_cond,
queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_e79a
queue_write_ptr_MUX_uxn_c_l173_c2_e79a : entity work.MUX_uint1_t_uint13_t_uint13_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_4648
BIN_OP_PLUS_uxn_c_l178_c3_4648 : entity work.BIN_OP_PLUS_uint13_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_4648_left,
BIN_OP_PLUS_uxn_c_l178_c3_4648_right,
BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_e403
BIN_OP_EQ_uxn_c_l182_c16_e403 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_e403_left,
BIN_OP_EQ_uxn_c_l182_c16_e403_right,
BIN_OP_EQ_uxn_c_l182_c16_e403_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_8bf6
BIN_OP_PLUS_uxn_c_l182_c39_8bf6 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left,
BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right,
BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output);

-- MUX_uxn_c_l182_c16_2c7a
MUX_uxn_c_l182_c16_2c7a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_2c7a_cond,
MUX_uxn_c_l182_c16_2c7a_iftrue,
MUX_uxn_c_l182_c16_2c7a_iffalse,
MUX_uxn_c_l182_c16_2c7a_return_output);

-- BIN_OP_AND_uxn_c_l185_c6_e3da
BIN_OP_AND_uxn_c_l185_c6_e3da : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c6_e3da_left,
BIN_OP_AND_uxn_c_l185_c6_e3da_right,
BIN_OP_AND_uxn_c_l185_c6_e3da_return_output);

-- UNARY_OP_NOT_uxn_c_l185_c66_77ab
UNARY_OP_NOT_uxn_c_l185_c66_77ab : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr,
UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output);

-- BIN_OP_AND_uxn_c_l185_c6_d2db
BIN_OP_AND_uxn_c_l185_c6_d2db : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c6_d2db_left,
BIN_OP_AND_uxn_c_l185_c6_d2db_right,
BIN_OP_AND_uxn_c_l185_c6_d2db_return_output);

-- fill_y0_MUX_uxn_c_l185_c2_1cc2
fill_y0_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l185_c2_1cc2_cond,
fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output);

-- fill_color_MUX_uxn_c_l185_c2_1cc2
fill_color_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l185_c2_1cc2_cond,
fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_color_MUX_uxn_c_l185_c2_1cc2_return_output);

-- is_fill_left_MUX_uxn_c_l185_c2_1cc2
is_fill_left_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond,
is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue,
is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse,
is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output);

-- fill_y1_MUX_uxn_c_l185_c2_1cc2
fill_y1_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l185_c2_1cc2_cond,
fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output);

-- fill_x0_MUX_uxn_c_l185_c2_1cc2
fill_x0_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l185_c2_1cc2_cond,
fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output);

-- is_fill_top_MUX_uxn_c_l185_c2_1cc2
is_fill_top_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond,
is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue,
is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse,
is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output);

-- fill_x1_MUX_uxn_c_l185_c2_1cc2
fill_x1_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l185_c2_1cc2_cond,
fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output);

-- y_MUX_uxn_c_l185_c2_1cc2
y_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l185_c2_1cc2_cond,
y_MUX_uxn_c_l185_c2_1cc2_iftrue,
y_MUX_uxn_c_l185_c2_1cc2_iffalse,
y_MUX_uxn_c_l185_c2_1cc2_return_output);

-- is_fill_active_MUX_uxn_c_l185_c2_1cc2
is_fill_active_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond,
is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue,
is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse,
is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output);

-- x_MUX_uxn_c_l185_c2_1cc2
x_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l185_c2_1cc2_cond,
x_MUX_uxn_c_l185_c2_1cc2_iftrue,
x_MUX_uxn_c_l185_c2_1cc2_iffalse,
x_MUX_uxn_c_l185_c2_1cc2_return_output);

-- fill_layer_MUX_uxn_c_l185_c2_1cc2
fill_layer_MUX_uxn_c_l185_c2_1cc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l185_c2_1cc2_cond,
fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue,
fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse,
fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output);

-- MUX_uxn_c_l188_c13_4835
MUX_uxn_c_l188_c13_4835 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_4835_cond,
MUX_uxn_c_l188_c13_4835_iftrue,
MUX_uxn_c_l188_c13_4835_iffalse,
MUX_uxn_c_l188_c13_4835_return_output);

-- MUX_uxn_c_l189_c13_bb40
MUX_uxn_c_l189_c13_bb40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_bb40_cond,
MUX_uxn_c_l189_c13_bb40_iftrue,
MUX_uxn_c_l189_c13_bb40_iffalse,
MUX_uxn_c_l189_c13_bb40_return_output);

-- MUX_uxn_c_l190_c13_9842
MUX_uxn_c_l190_c13_9842 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_9842_cond,
MUX_uxn_c_l190_c13_9842_iftrue,
MUX_uxn_c_l190_c13_9842_iffalse,
MUX_uxn_c_l190_c13_9842_return_output);

-- MUX_uxn_c_l191_c13_0953
MUX_uxn_c_l191_c13_0953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_0953_cond,
MUX_uxn_c_l191_c13_0953_iftrue,
MUX_uxn_c_l191_c13_0953_iffalse,
MUX_uxn_c_l191_c13_0953_return_output);

-- UNARY_OP_NOT_uxn_c_l199_c44_80d1
UNARY_OP_NOT_uxn_c_l199_c44_80d1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr,
UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output);

-- BIN_OP_AND_uxn_c_l199_c13_affa
BIN_OP_AND_uxn_c_l199_c13_affa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l199_c13_affa_left,
BIN_OP_AND_uxn_c_l199_c13_affa_right,
BIN_OP_AND_uxn_c_l199_c13_affa_return_output);

-- y_MUX_uxn_c_l199_c9_d985
y_MUX_uxn_c_l199_c9_d985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l199_c9_d985_cond,
y_MUX_uxn_c_l199_c9_d985_iftrue,
y_MUX_uxn_c_l199_c9_d985_iffalse,
y_MUX_uxn_c_l199_c9_d985_return_output);

-- x_MUX_uxn_c_l199_c9_d985
x_MUX_uxn_c_l199_c9_d985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l199_c9_d985_cond,
x_MUX_uxn_c_l199_c9_d985_iftrue,
x_MUX_uxn_c_l199_c9_d985_iffalse,
x_MUX_uxn_c_l199_c9_d985_return_output);

-- BIN_OP_AND_uxn_c_l204_c57_7da4
BIN_OP_AND_uxn_c_l204_c57_7da4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l204_c57_7da4_left,
BIN_OP_AND_uxn_c_l204_c57_7da4_right,
BIN_OP_AND_uxn_c_l204_c57_7da4_return_output);

-- UNARY_OP_NOT_uxn_c_l207_c68_c109
UNARY_OP_NOT_uxn_c_l207_c68_c109 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l207_c68_c109_expr,
UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output);

-- BIN_OP_AND_uxn_c_l207_c68_162f
BIN_OP_AND_uxn_c_l207_c68_162f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l207_c68_162f_left,
BIN_OP_AND_uxn_c_l207_c68_162f_right,
BIN_OP_AND_uxn_c_l207_c68_162f_return_output);

-- BIN_OP_EQ_uxn_c_l209_c21_76b3
BIN_OP_EQ_uxn_c_l209_c21_76b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l209_c21_76b3_left,
BIN_OP_EQ_uxn_c_l209_c21_76b3_right,
BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output);

-- MUX_uxn_c_l209_c21_bcb5
MUX_uxn_c_l209_c21_bcb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l209_c21_bcb5_cond,
MUX_uxn_c_l209_c21_bcb5_iftrue,
MUX_uxn_c_l209_c21_bcb5_iffalse,
MUX_uxn_c_l209_c21_bcb5_return_output);

-- BIN_OP_EQ_uxn_c_l210_c22_0381
BIN_OP_EQ_uxn_c_l210_c22_0381 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l210_c22_0381_left,
BIN_OP_EQ_uxn_c_l210_c22_0381_right,
BIN_OP_EQ_uxn_c_l210_c22_0381_return_output);

-- MUX_uxn_c_l210_c22_49b4
MUX_uxn_c_l210_c22_49b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l210_c22_49b4_cond,
MUX_uxn_c_l210_c22_49b4_iftrue,
MUX_uxn_c_l210_c22_49b4_iffalse,
MUX_uxn_c_l210_c22_49b4_return_output);

-- BIN_OP_PLUS_uxn_c_l211_c25_58e7
BIN_OP_PLUS_uxn_c_l211_c25_58e7 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l211_c25_58e7_left,
BIN_OP_PLUS_uxn_c_l211_c25_58e7_right,
BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output);

-- MUX_uxn_c_l211_c6_faa7
MUX_uxn_c_l211_c6_faa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l211_c6_faa7_cond,
MUX_uxn_c_l211_c6_faa7_iftrue,
MUX_uxn_c_l211_c6_faa7_iffalse,
MUX_uxn_c_l211_c6_faa7_return_output);

-- BIN_OP_PLUS_uxn_c_l212_c34_ae82
BIN_OP_PLUS_uxn_c_l212_c34_ae82 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l212_c34_ae82_left,
BIN_OP_PLUS_uxn_c_l212_c34_ae82_right,
BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output);

-- MUX_uxn_c_l212_c6_076e
MUX_uxn_c_l212_c6_076e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l212_c6_076e_cond,
MUX_uxn_c_l212_c6_076e_iftrue,
MUX_uxn_c_l212_c6_076e_iffalse,
MUX_uxn_c_l212_c6_076e_return_output);

-- UNARY_OP_NOT_uxn_c_l214_c38_6569
UNARY_OP_NOT_uxn_c_l214_c38_6569 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l214_c38_6569_expr,
UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output);

-- BIN_OP_AND_uxn_c_l214_c19_d189
BIN_OP_AND_uxn_c_l214_c19_d189 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l214_c19_d189_left,
BIN_OP_AND_uxn_c_l214_c19_d189_right,
BIN_OP_AND_uxn_c_l214_c19_d189_return_output);

-- BIN_OP_AND_uxn_c_l215_c19_32c7
BIN_OP_AND_uxn_c_l215_c19_32c7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c19_32c7_left,
BIN_OP_AND_uxn_c_l215_c19_32c7_right,
BIN_OP_AND_uxn_c_l215_c19_32c7_return_output);

-- MUX_uxn_c_l220_c3_f052
MUX_uxn_c_l220_c3_f052 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l220_c3_f052_cond,
MUX_uxn_c_l220_c3_f052_iftrue,
MUX_uxn_c_l220_c3_f052_iffalse,
MUX_uxn_c_l220_c3_f052_return_output);

-- UNARY_OP_NOT_uxn_c_l221_c71_20df
UNARY_OP_NOT_uxn_c_l221_c71_20df : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l221_c71_20df_expr,
UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output);

-- BIN_OP_AND_uxn_c_l221_c22_01d8
BIN_OP_AND_uxn_c_l221_c22_01d8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l221_c22_01d8_left,
BIN_OP_AND_uxn_c_l221_c22_01d8_right,
BIN_OP_AND_uxn_c_l221_c22_01d8_return_output);

-- BIN_OP_OR_uxn_c_l221_c3_1b71
BIN_OP_OR_uxn_c_l221_c3_1b71 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l221_c3_1b71_left,
BIN_OP_OR_uxn_c_l221_c3_1b71_right,
BIN_OP_OR_uxn_c_l221_c3_1b71_return_output);

-- bg_vram_update_uxn_c_l217_c19_ca26
bg_vram_update_uxn_c_l217_c19_ca26 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE,
bg_vram_update_uxn_c_l217_c19_ca26_read_address,
bg_vram_update_uxn_c_l217_c19_ca26_write_address,
bg_vram_update_uxn_c_l217_c19_ca26_write_value,
bg_vram_update_uxn_c_l217_c19_ca26_write_enable,
bg_vram_update_uxn_c_l217_c19_ca26_return_output);

-- MUX_uxn_c_l227_c3_3166
MUX_uxn_c_l227_c3_3166 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l227_c3_3166_cond,
MUX_uxn_c_l227_c3_3166_iftrue,
MUX_uxn_c_l227_c3_3166_iffalse,
MUX_uxn_c_l227_c3_3166_return_output);

-- BIN_OP_AND_uxn_c_l228_c22_2563
BIN_OP_AND_uxn_c_l228_c22_2563 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c22_2563_left,
BIN_OP_AND_uxn_c_l228_c22_2563_right,
BIN_OP_AND_uxn_c_l228_c22_2563_return_output);

-- BIN_OP_OR_uxn_c_l228_c3_4ead
BIN_OP_OR_uxn_c_l228_c3_4ead : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l228_c3_4ead_left,
BIN_OP_OR_uxn_c_l228_c3_4ead_right,
BIN_OP_OR_uxn_c_l228_c3_4ead_return_output);

-- fg_vram_update_uxn_c_l224_c19_75f8
fg_vram_update_uxn_c_l224_c19_75f8 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE,
fg_vram_update_uxn_c_l224_c19_75f8_read_address,
fg_vram_update_uxn_c_l224_c19_75f8_write_address,
fg_vram_update_uxn_c_l224_c19_75f8_write_value,
fg_vram_update_uxn_c_l224_c19_75f8_write_enable,
fg_vram_update_uxn_c_l224_c19_75f8_return_output);

-- draw_queue_update_uxn_c_l231_c21_aa97
draw_queue_update_uxn_c_l231_c21_aa97 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE,
draw_queue_update_uxn_c_l231_c21_aa97_read_address,
draw_queue_update_uxn_c_l231_c21_aa97_write_address,
draw_queue_update_uxn_c_l231_c21_aa97_write_value,
draw_queue_update_uxn_c_l231_c21_aa97_write_enable,
draw_queue_update_uxn_c_l231_c21_aa97_return_output);

-- BIN_OP_AND_uxn_c_l238_c38_f074
BIN_OP_AND_uxn_c_l238_c38_f074 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l238_c38_f074_left,
BIN_OP_AND_uxn_c_l238_c38_f074_right,
BIN_OP_AND_uxn_c_l238_c38_f074_return_output);

-- UNARY_OP_NOT_uxn_c_l238_c38_18e7
UNARY_OP_NOT_uxn_c_l238_c38_18e7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr,
UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output);

-- MUX_uxn_c_l238_c19_0a86
MUX_uxn_c_l238_c19_0a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l238_c19_0a86_cond,
MUX_uxn_c_l238_c19_0a86_iftrue,
MUX_uxn_c_l238_c19_0a86_iffalse,
MUX_uxn_c_l238_c19_0a86_return_output);

-- BIN_OP_EQ_uxn_c_l240_c19_b368
BIN_OP_EQ_uxn_c_l240_c19_b368 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c19_b368_left,
BIN_OP_EQ_uxn_c_l240_c19_b368_right,
BIN_OP_EQ_uxn_c_l240_c19_b368_return_output);

-- BIN_OP_PLUS_uxn_c_l240_c76_8272
BIN_OP_PLUS_uxn_c_l240_c76_8272 : entity work.BIN_OP_PLUS_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l240_c76_8272_left,
BIN_OP_PLUS_uxn_c_l240_c76_8272_right,
BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output);

-- MUX_uxn_c_l240_c50_ccce
MUX_uxn_c_l240_c50_ccce : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l240_c50_ccce_cond,
MUX_uxn_c_l240_c50_ccce_iftrue,
MUX_uxn_c_l240_c50_ccce_iffalse,
MUX_uxn_c_l240_c50_ccce_return_output);

-- MUX_uxn_c_l240_c19_41c7
MUX_uxn_c_l240_c19_41c7 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l240_c19_41c7_cond,
MUX_uxn_c_l240_c19_41c7_iftrue,
MUX_uxn_c_l240_c19_41c7_iffalse,
MUX_uxn_c_l240_c19_41c7_return_output);

-- BIN_OP_EQ_uxn_c_l241_c25_4dfc
BIN_OP_EQ_uxn_c_l241_c25_4dfc : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l241_c25_4dfc_left,
BIN_OP_EQ_uxn_c_l241_c25_4dfc_right,
BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output);

-- MUX_uxn_c_l241_c25_09fd
MUX_uxn_c_l241_c25_09fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l241_c25_09fd_cond,
MUX_uxn_c_l241_c25_09fd_iftrue,
MUX_uxn_c_l241_c25_09fd_iffalse,
MUX_uxn_c_l241_c25_09fd_return_output);

-- BIN_OP_EQ_uxn_c_l242_c17_3a7b
BIN_OP_EQ_uxn_c_l242_c17_3a7b : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l242_c17_3a7b_left,
BIN_OP_EQ_uxn_c_l242_c17_3a7b_right,
BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output);

-- MUX_uxn_c_l242_c17_b96b
MUX_uxn_c_l242_c17_b96b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l242_c17_b96b_cond,
MUX_uxn_c_l242_c17_b96b_iftrue,
MUX_uxn_c_l242_c17_b96b_iffalse,
MUX_uxn_c_l242_c17_b96b_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output);



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
 BIN_OP_XOR_uxn_c_l157_c2_a699_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output,
 MUX_uxn_c_l158_c17_dd7a_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output,
 MUX_uxn_c_l159_c18_85c2_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output,
 BIN_OP_AND_uxn_c_l161_c7_73d3_return_output,
 BIN_OP_AND_uxn_c_l161_c7_f512_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_4103_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output,
 queue_phase_MUX_uxn_c_l161_c2_4103_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output,
 queue_phase_MUX_uxn_c_l173_c2_e79a_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_e403_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output,
 MUX_uxn_c_l182_c16_2c7a_return_output,
 BIN_OP_AND_uxn_c_l185_c6_e3da_return_output,
 UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output,
 BIN_OP_AND_uxn_c_l185_c6_d2db_return_output,
 fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output,
 fill_color_MUX_uxn_c_l185_c2_1cc2_return_output,
 is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output,
 fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output,
 fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output,
 is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output,
 fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output,
 y_MUX_uxn_c_l185_c2_1cc2_return_output,
 is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output,
 x_MUX_uxn_c_l185_c2_1cc2_return_output,
 fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output,
 MUX_uxn_c_l188_c13_4835_return_output,
 MUX_uxn_c_l189_c13_bb40_return_output,
 MUX_uxn_c_l190_c13_9842_return_output,
 MUX_uxn_c_l191_c13_0953_return_output,
 UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output,
 BIN_OP_AND_uxn_c_l199_c13_affa_return_output,
 y_MUX_uxn_c_l199_c9_d985_return_output,
 x_MUX_uxn_c_l199_c9_d985_return_output,
 BIN_OP_AND_uxn_c_l204_c57_7da4_return_output,
 UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output,
 BIN_OP_AND_uxn_c_l207_c68_162f_return_output,
 BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output,
 MUX_uxn_c_l209_c21_bcb5_return_output,
 BIN_OP_EQ_uxn_c_l210_c22_0381_return_output,
 MUX_uxn_c_l210_c22_49b4_return_output,
 BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output,
 MUX_uxn_c_l211_c6_faa7_return_output,
 BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output,
 MUX_uxn_c_l212_c6_076e_return_output,
 UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output,
 BIN_OP_AND_uxn_c_l214_c19_d189_return_output,
 BIN_OP_AND_uxn_c_l215_c19_32c7_return_output,
 MUX_uxn_c_l220_c3_f052_return_output,
 UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output,
 BIN_OP_AND_uxn_c_l221_c22_01d8_return_output,
 BIN_OP_OR_uxn_c_l221_c3_1b71_return_output,
 bg_vram_update_uxn_c_l217_c19_ca26_return_output,
 MUX_uxn_c_l227_c3_3166_return_output,
 BIN_OP_AND_uxn_c_l228_c22_2563_return_output,
 BIN_OP_OR_uxn_c_l228_c3_4ead_return_output,
 fg_vram_update_uxn_c_l224_c19_75f8_return_output,
 draw_queue_update_uxn_c_l231_c21_aa97_return_output,
 BIN_OP_AND_uxn_c_l238_c38_f074_return_output,
 UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output,
 MUX_uxn_c_l238_c19_0a86_return_output,
 BIN_OP_EQ_uxn_c_l240_c19_b368_return_output,
 BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output,
 MUX_uxn_c_l240_c50_ccce_return_output,
 MUX_uxn_c_l240_c19_41c7_return_output,
 BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output,
 MUX_uxn_c_l241_c25_09fd_return_output,
 BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output,
 MUX_uxn_c_l242_c17_b96b_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dd7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dd7a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dd7a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_dd7a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_85c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_85c2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_85c2_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_85c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_5b3b_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f512_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f512_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_f512_return_output : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4103_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_e540 : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_8b33 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4103_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4103_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_7556_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_7f48_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_05ba_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_3ac9_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_f8a4_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_d3e7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output : unsigned(13 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_4f87 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_dfb8 : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond : unsigned(0 downto 0);
 variable VAR_uint24_uint16_0_uxn_c_l174_c23_36c6_return_output : unsigned(23 downto 0);
 variable VAR_uint8_4_0_uxn_c_l175_c58_f239_return_output : unsigned(4 downto 0);
 variable VAR_uint24_uint5_16_uxn_c_l175_c23_0182_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_21_uxn_c_l176_c23_a7ca_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output : unsigned(13 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_2c7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_2c7a_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_2c7a_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_2c7a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_725e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_d985_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_d985_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_bcb6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4835_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4835_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4835_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4835_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_bb40_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_bb40_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_bb40_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_bb40_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9842_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9842_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9842_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_9842_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_0953_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_0953_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_0953_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_0953_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_affa_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_affa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_affa_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_d985_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_d985_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_d985_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_d985_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_d985_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_d985_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l204_c26_83ea_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address_uxn_c_l205_c2_7ad1 : unsigned(16 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l205_c27_c008_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_write_address_uxn_c_l206_c2_3a8b : unsigned(16 downto 0);
 variable VAR_uint17_15_0_uxn_c_l206_c42_2f61_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l206_c27_134d_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_162f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_162f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_162f_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l207_c27_ec27_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_bcb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_bcb5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_bcb5_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_bcb5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_49b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_49b4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_49b4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_49b4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_faa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_faa7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_faa7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_faa7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_076e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_076e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_076e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_076e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_d189_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_d189_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_d189_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_f052_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_f052_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_f052_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_f052_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_ca26_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_3166_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_3166_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_3166_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_3166_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_2563_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_2563_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_2563_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_75f8_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_read_address : unsigned(12 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_address : unsigned(12 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_aa97_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_0a86_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_0a86_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_0a86_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_f074_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_f074_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_f074_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_0a86_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_41c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_41c7_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_41c7_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_ccce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_ccce_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_ccce_iffalse : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_ccce_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_41c7_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_09fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_09fd_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_09fd_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_09fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_b96b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_b96b_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_b96b_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_b96b_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_20dc_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_ac53_return_output : unsigned(0 downto 0);
 variable VAR_uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_4a18_return_output : gpu_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : gpu_step_result_t;
variable REG_VAR_queue_read_ptr : unsigned(12 downto 0);
variable REG_VAR_queue_write_ptr : unsigned(12 downto 0);
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
     VAR_MUX_uxn_c_l190_c13_9842_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l209_c21_bcb5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l238_c19_0a86_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l158_c17_dd7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l191_c13_0953_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l159_c18_85c2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l158_c17_dd7a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_right := to_unsigned(61439, 16);
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l189_c13_bb40_iffalse := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l210_c22_49b4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l210_c22_49b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_right := to_unsigned(1, 1);
     VAR_queue_phase_uxn_c_l177_c3_4f87 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue := VAR_queue_phase_uxn_c_l177_c3_4f87;
     VAR_MUX_uxn_c_l240_c19_41c7_iftrue := resize(to_unsigned(0, 1), 17);
     VAR_queue_phase_uxn_c_l169_c3_8b33 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iftrue := VAR_queue_phase_uxn_c_l169_c3_8b33;
     VAR_MUX_uxn_c_l188_c13_4835_iffalse := to_unsigned(239, 8);
     VAR_MUX_uxn_c_l241_c25_09fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l182_c16_2c7a_iftrue := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l241_c25_09fd_iftrue := to_unsigned(1, 1);
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l209_c21_bcb5_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l159_c18_85c2_iftrue := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l207_c68_162f_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse := fill_y1;
     VAR_MUX_uxn_c_l240_c50_ccce_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_left := pixel_counter;
     VAR_MUX_uxn_c_l240_c50_ccce_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l199_c9_d985_iffalse := x;
     VAR_y_MUX_uxn_c_l199_c9_d985_iffalse := y;
     -- uint24_17_16[uxn_c_l163_c30_7f48] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_7f48_return_output := uint24_17_16(
     queue_read_value);

     -- uint24_18_18[uxn_c_l164_c33_05ba] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_05ba_return_output := uint24_18_18(
     queue_read_value);

     -- uint24_uint16_0[uxn_c_l174_c23_36c6] LATENCY=0
     VAR_uint24_uint16_0_uxn_c_l174_c23_36c6_return_output := uint24_uint16_0(
     resize(to_unsigned(0, 1), 24),
     VAR_vram_address);

     -- BIN_OP_PLUS[uxn_c_l170_c3_91a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_91a0_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_left;
     BIN_OP_PLUS_uxn_c_l170_c3_91a0_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output := BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_5b3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_5b3b_return_output := current_queue_item.is_valid;

     -- BIN_OP_EQ[uxn_c_l158_c17_58e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_58e3_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_left;
     BIN_OP_EQ_uxn_c_l158_c17_58e3_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output := BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output;

     -- BIN_OP_XOR[uxn_c_l157_c2_a699] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_a699_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_left;
     BIN_OP_XOR_uxn_c_l157_c2_a699_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_return_output := BIN_OP_XOR_uxn_c_l157_c2_a699_return_output;

     -- BIN_OP_PLUS[uxn_c_l178_c3_4648] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_4648_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_left;
     BIN_OP_PLUS_uxn_c_l178_c3_4648_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output := BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output;

     -- uint24_20_20[uxn_c_l166_c32_f8a4] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_f8a4_return_output := uint24_20_20(
     queue_read_value);

     -- UNARY_OP_NOT[uxn_c_l185_c66_77ab] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr <= VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output := UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output;

     -- uint24_21_21[uxn_c_l167_c30_d3e7] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_d3e7_return_output := uint24_21_21(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l159_c18_3f5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_3f5f_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_left;
     BIN_OP_EQ_uxn_c_l159_c18_3f5f_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output := BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output;

     -- BIN_OP_PLUS[uxn_c_l240_c76_8272] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l240_c76_8272_left <= VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_left;
     BIN_OP_PLUS_uxn_c_l240_c76_8272_right <= VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output := BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output;

     -- BIN_OP_EQ[uxn_c_l240_c19_b368] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c19_b368_left <= VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_left;
     BIN_OP_EQ_uxn_c_l240_c19_b368_right <= VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_return_output := BIN_OP_EQ_uxn_c_l240_c19_b368_return_output;

     -- uint24_15_0[uxn_c_l162_c37_7556] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_7556_return_output := uint24_15_0(
     queue_read_value);

     -- uint8_4_0[uxn_c_l175_c58_f239] LATENCY=0
     VAR_uint8_4_0_uxn_c_l175_c58_f239_return_output := uint8_4_0(
     VAR_vram_value);

     -- uint24_19_19[uxn_c_l165_c34_3ac9] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_3ac9_return_output := uint24_19_19(
     queue_read_value);

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_dd7a_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_58e3_return_output;
     VAR_MUX_uxn_c_l159_c18_85c2_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_3f5f_return_output;
     VAR_MUX_uxn_c_l240_c19_41c7_cond := VAR_BIN_OP_EQ_uxn_c_l240_c19_b368_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_e540 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_91a0_return_output, 13);
     VAR_queue_write_ptr_uxn_c_l178_c3_dfb8 := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_4648_return_output, 13);
     VAR_MUX_uxn_c_l240_c50_ccce_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l240_c76_8272_return_output, 17);
     VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_a699_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_5b3b_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_right := VAR_UNARY_OP_NOT_uxn_c_l185_c66_77ab_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_e540;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_dfb8;
     -- UNARY_OP_NOT[uxn_c_l161_c7_5c58] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output := UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output;

     -- MUX[uxn_c_l159_c18_85c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_85c2_cond <= VAR_MUX_uxn_c_l159_c18_85c2_cond;
     MUX_uxn_c_l159_c18_85c2_iftrue <= VAR_MUX_uxn_c_l159_c18_85c2_iftrue;
     MUX_uxn_c_l159_c18_85c2_iffalse <= VAR_MUX_uxn_c_l159_c18_85c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_85c2_return_output := MUX_uxn_c_l159_c18_85c2_return_output;

     -- UNARY_OP_NOT[uxn_c_l207_c68_c109] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l207_c68_c109_expr <= VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output := UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output;

     -- MUX[uxn_c_l240_c50_ccce] LATENCY=0
     -- Inputs
     MUX_uxn_c_l240_c50_ccce_cond <= VAR_MUX_uxn_c_l240_c50_ccce_cond;
     MUX_uxn_c_l240_c50_ccce_iftrue <= VAR_MUX_uxn_c_l240_c50_ccce_iftrue;
     MUX_uxn_c_l240_c50_ccce_iffalse <= VAR_MUX_uxn_c_l240_c50_ccce_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l240_c50_ccce_return_output := MUX_uxn_c_l240_c50_ccce_return_output;

     -- queue_write_ptr_MUX[uxn_c_l173_c2_e79a] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output;

     -- MUX[uxn_c_l158_c17_dd7a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_dd7a_cond <= VAR_MUX_uxn_c_l158_c17_dd7a_cond;
     MUX_uxn_c_l158_c17_dd7a_iftrue <= VAR_MUX_uxn_c_l158_c17_dd7a_iftrue;
     MUX_uxn_c_l158_c17_dd7a_iffalse <= VAR_MUX_uxn_c_l158_c17_dd7a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_dd7a_return_output := MUX_uxn_c_l158_c17_dd7a_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_4103] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4103_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_7556_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_7f48_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_05ba_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_3ac9_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_f8a4_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_d3e7_return_output,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_c_l204_c57_7da4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l204_c57_7da4_left <= VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_left;
     BIN_OP_AND_uxn_c_l204_c57_7da4_right <= VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_return_output := BIN_OP_AND_uxn_c_l204_c57_7da4_return_output;

     -- uint24_uint5_16[uxn_c_l175_c23_0182] LATENCY=0
     VAR_uint24_uint5_16_uxn_c_l175_c23_0182_return_output := uint24_uint5_16(
     VAR_uint24_uint16_0_uxn_c_l174_c23_36c6_return_output,
     VAR_uint8_4_0_uxn_c_l175_c58_f239_return_output);

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr := VAR_MUX_uxn_c_l158_c17_dd7a_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_dd7a_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_f512_right := VAR_MUX_uxn_c_l159_c18_85c2_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_85c2_return_output;
     VAR_MUX_uxn_c_l240_c19_41c7_iffalse := VAR_MUX_uxn_c_l240_c50_ccce_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_5c58_return_output;
     VAR_BIN_OP_AND_uxn_c_l207_c68_162f_left := VAR_UNARY_OP_NOT_uxn_c_l207_c68_c109_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4103_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_e79a_return_output;
     -- MUX[uxn_c_l240_c19_41c7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l240_c19_41c7_cond <= VAR_MUX_uxn_c_l240_c19_41c7_cond;
     MUX_uxn_c_l240_c19_41c7_iftrue <= VAR_MUX_uxn_c_l240_c19_41c7_iftrue;
     MUX_uxn_c_l240_c19_41c7_iffalse <= VAR_MUX_uxn_c_l240_c19_41c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l240_c19_41c7_return_output := MUX_uxn_c_l240_c19_41c7_return_output;

     -- uint17_uint1_16[uxn_c_l204_c26_83ea] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l204_c26_83ea_return_output := uint17_uint1_16(
     pixel_counter,
     VAR_BIN_OP_AND_uxn_c_l204_c57_7da4_return_output);

     -- UNARY_OP_NOT[uxn_c_l161_c38_ec46] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output := UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output;

     -- BIN_OP_AND[uxn_c_l207_c68_162f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l207_c68_162f_left <= VAR_BIN_OP_AND_uxn_c_l207_c68_162f_left;
     BIN_OP_AND_uxn_c_l207_c68_162f_right <= VAR_BIN_OP_AND_uxn_c_l207_c68_162f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l207_c68_162f_return_output := BIN_OP_AND_uxn_c_l207_c68_162f_return_output;

     -- uint24_uint1_21[uxn_c_l176_c23_a7ca] LATENCY=0
     VAR_uint24_uint1_21_uxn_c_l176_c23_a7ca_return_output := uint24_uint1_21(
     VAR_uint24_uint5_16_uxn_c_l175_c23_0182_return_output,
     VAR_vram_write_layer);

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_left := VAR_MUX_uxn_c_l240_c19_41c7_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l240_c19_41c7_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_ec46_return_output;
     REG_VAR_adjusted_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_83ea_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_83ea_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_83ea_return_output;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue := VAR_uint24_uint1_21_uxn_c_l176_c23_a7ca_return_output;
     -- BIN_OP_EQ[uxn_c_l241_c25_4dfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l241_c25_4dfc_left <= VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_left;
     BIN_OP_EQ_uxn_c_l241_c25_4dfc_right <= VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output := BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_73d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_73d3_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_left;
     BIN_OP_AND_uxn_c_l161_c7_73d3_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_return_output := BIN_OP_AND_uxn_c_l161_c7_73d3_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_e79a] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_e79a_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_cond;
     queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output := queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_f512_left := VAR_BIN_OP_AND_uxn_c_l161_c7_73d3_return_output;
     VAR_MUX_uxn_c_l241_c25_09fd_cond := VAR_BIN_OP_EQ_uxn_c_l241_c25_4dfc_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_e79a_return_output;
     -- BIN_OP_AND[uxn_c_l161_c7_f512] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_f512_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_f512_left;
     BIN_OP_AND_uxn_c_l161_c7_f512_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_f512_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_f512_return_output := BIN_OP_AND_uxn_c_l161_c7_f512_return_output;

     -- MUX[uxn_c_l241_c25_09fd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l241_c25_09fd_cond <= VAR_MUX_uxn_c_l241_c25_09fd_cond;
     MUX_uxn_c_l241_c25_09fd_iftrue <= VAR_MUX_uxn_c_l241_c25_09fd_iftrue;
     MUX_uxn_c_l241_c25_09fd_iffalse <= VAR_MUX_uxn_c_l241_c25_09fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l241_c25_09fd_return_output := MUX_uxn_c_l241_c25_09fd_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f512_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_4103_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f512_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_f512_return_output;
     -- current_queue_item_MUX[uxn_c_l161_c2_4103] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_4103_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_cond;
     current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output := current_queue_item_MUX_uxn_c_l161_c2_4103_return_output;

     -- queue_phase_MUX[uxn_c_l161_c2_4103] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_4103_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_4103_cond;
     queue_phase_MUX_uxn_c_l161_c2_4103_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_4103_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_4103_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_4103_return_output := queue_phase_MUX_uxn_c_l161_c2_4103_return_output;

     -- queue_read_ptr_MUX[uxn_c_l161_c2_4103] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_4103_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4103_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_ac53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_ac53_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.is_fill;

     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.layer;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d[uxn_c_l183_c10_725e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_725e_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_bcb6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_bcb6_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.fill_top;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.color;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.is_valid;

     -- draw_queue_update[uxn_c_l231_c21_aa97] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l231_c21_aa97_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l231_c21_aa97_read_address <= VAR_draw_queue_update_uxn_c_l231_c21_aa97_read_address;
     draw_queue_update_uxn_c_l231_c21_aa97_write_address <= VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_address;
     draw_queue_update_uxn_c_l231_c21_aa97_write_value <= VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_value;
     draw_queue_update_uxn_c_l231_c21_aa97_write_enable <= VAR_draw_queue_update_uxn_c_l231_c21_aa97_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l231_c21_aa97_return_output := draw_queue_update_uxn_c_l231_c21_aa97_return_output;

     -- queue_phase_MUX[uxn_c_l173_c2_e79a] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_e79a_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_cond;
     queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_return_output := queue_phase_MUX_uxn_c_l173_c2_e79a_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_aaa2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_aaa2_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output.fill_left;

     -- Submodule level 7
     REG_VAR_tmp16 := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_725e_return_output;
     VAR_MUX_uxn_c_l189_c13_bb40_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_aaa2_return_output;
     VAR_MUX_uxn_c_l191_c13_0953_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_aaa2_return_output;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_aaa2_return_output;
     VAR_MUX_uxn_c_l188_c13_4835_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_bcb6_return_output;
     VAR_MUX_uxn_c_l190_c13_9842_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_bcb6_return_output;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_bcb6_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_ac53_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_ac53_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5_return_output;
     VAR_BIN_OP_AND_uxn_c_l199_c13_affa_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_2ba5_return_output;
     VAR_BIN_OP_AND_uxn_c_l228_c22_2563_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111_return_output;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_a111_return_output;
     VAR_MUX_uxn_c_l220_c3_f052_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66_return_output;
     VAR_MUX_uxn_c_l227_c3_3166_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66_return_output;
     VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l193_l220_l227_DUPLICATE_1e66_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l231_c21_aa97_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_left := VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left := VAR_queue_phase_MUX_uxn_c_l173_c2_e79a_return_output;
     -- BIN_OP_AND[uxn_c_l185_c6_e3da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c6_e3da_left <= VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_left;
     BIN_OP_AND_uxn_c_l185_c6_e3da_right <= VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_return_output := BIN_OP_AND_uxn_c_l185_c6_e3da_return_output;

     -- UNARY_OP_NOT[uxn_c_l199_c44_80d1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr <= VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output := UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output;

     -- UNARY_OP_NOT[uxn_c_l221_c71_20df] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l221_c71_20df_expr <= VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output := UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output;

     -- uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e LATENCY=0
     VAR_uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_725e_return_output);

     -- uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c LATENCY=0
     VAR_uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c_return_output := uint16_7_0(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_725e_return_output);

     -- BIN_OP_EQ[uxn_c_l182_c16_e403] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_e403_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_left;
     BIN_OP_EQ_uxn_c_l182_c16_e403_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_return_output := BIN_OP_EQ_uxn_c_l182_c16_e403_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c39_8bf6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_left;
     BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output := BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output;

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_left := VAR_BIN_OP_AND_uxn_c_l185_c6_e3da_return_output;
     VAR_MUX_uxn_c_l182_c16_2c7a_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_e403_return_output;
     VAR_MUX_uxn_c_l182_c16_2c7a_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_8bf6_return_output, 2);
     VAR_BIN_OP_AND_uxn_c_l199_c13_affa_right := VAR_UNARY_OP_NOT_uxn_c_l199_c44_80d1_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_right := VAR_UNARY_OP_NOT_uxn_c_l221_c71_20df_return_output;
     VAR_MUX_uxn_c_l188_c13_4835_iftrue := VAR_uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e_return_output;
     VAR_MUX_uxn_c_l190_c13_9842_iffalse := VAR_uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e_return_output;
     VAR_y_MUX_uxn_c_l199_c9_d985_iftrue := VAR_uint16_15_8_uxn_c_l188_l200_l190_DUPLICATE_902e_return_output;
     VAR_MUX_uxn_c_l189_c13_bb40_iftrue := VAR_uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c_return_output;
     VAR_MUX_uxn_c_l191_c13_0953_iffalse := VAR_uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c_return_output;
     VAR_x_MUX_uxn_c_l199_c9_d985_iftrue := VAR_uint16_7_0_uxn_c_l191_l189_l201_DUPLICATE_f04c_return_output;
     -- BIN_OP_AND[uxn_c_l199_c13_affa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l199_c13_affa_left <= VAR_BIN_OP_AND_uxn_c_l199_c13_affa_left;
     BIN_OP_AND_uxn_c_l199_c13_affa_right <= VAR_BIN_OP_AND_uxn_c_l199_c13_affa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l199_c13_affa_return_output := BIN_OP_AND_uxn_c_l199_c13_affa_return_output;

     -- MUX[uxn_c_l182_c16_2c7a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_2c7a_cond <= VAR_MUX_uxn_c_l182_c16_2c7a_cond;
     MUX_uxn_c_l182_c16_2c7a_iftrue <= VAR_MUX_uxn_c_l182_c16_2c7a_iftrue;
     MUX_uxn_c_l182_c16_2c7a_iffalse <= VAR_MUX_uxn_c_l182_c16_2c7a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_2c7a_return_output := MUX_uxn_c_l182_c16_2c7a_return_output;

     -- MUX[uxn_c_l190_c13_9842] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_9842_cond <= VAR_MUX_uxn_c_l190_c13_9842_cond;
     MUX_uxn_c_l190_c13_9842_iftrue <= VAR_MUX_uxn_c_l190_c13_9842_iftrue;
     MUX_uxn_c_l190_c13_9842_iffalse <= VAR_MUX_uxn_c_l190_c13_9842_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_9842_return_output := MUX_uxn_c_l190_c13_9842_return_output;

     -- MUX[uxn_c_l188_c13_4835] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_4835_cond <= VAR_MUX_uxn_c_l188_c13_4835_cond;
     MUX_uxn_c_l188_c13_4835_iftrue <= VAR_MUX_uxn_c_l188_c13_4835_iftrue;
     MUX_uxn_c_l188_c13_4835_iffalse <= VAR_MUX_uxn_c_l188_c13_4835_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_4835_return_output := MUX_uxn_c_l188_c13_4835_return_output;

     -- MUX[uxn_c_l191_c13_0953] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_0953_cond <= VAR_MUX_uxn_c_l191_c13_0953_cond;
     MUX_uxn_c_l191_c13_0953_iftrue <= VAR_MUX_uxn_c_l191_c13_0953_iftrue;
     MUX_uxn_c_l191_c13_0953_iffalse <= VAR_MUX_uxn_c_l191_c13_0953_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_0953_return_output := MUX_uxn_c_l191_c13_0953_return_output;

     -- MUX[uxn_c_l189_c13_bb40] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_bb40_cond <= VAR_MUX_uxn_c_l189_c13_bb40_cond;
     MUX_uxn_c_l189_c13_bb40_iftrue <= VAR_MUX_uxn_c_l189_c13_bb40_iftrue;
     MUX_uxn_c_l189_c13_bb40_iffalse <= VAR_MUX_uxn_c_l189_c13_bb40_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_bb40_return_output := MUX_uxn_c_l189_c13_bb40_return_output;

     -- BIN_OP_AND[uxn_c_l185_c6_d2db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c6_d2db_left <= VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_left;
     BIN_OP_AND_uxn_c_l185_c6_d2db_right <= VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output := BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1cc2_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_d2db_return_output;
     VAR_x_MUX_uxn_c_l199_c9_d985_cond := VAR_BIN_OP_AND_uxn_c_l199_c13_affa_return_output;
     VAR_y_MUX_uxn_c_l199_c9_d985_cond := VAR_BIN_OP_AND_uxn_c_l199_c13_affa_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_2c7a_return_output;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l188_c13_4835_return_output;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l189_c13_bb40_return_output;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l190_c13_9842_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l190_c13_9842_return_output;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l191_c13_0953_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1cc2_iftrue := VAR_MUX_uxn_c_l191_c13_0953_return_output;
     -- is_fill_left_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_cond;
     is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iftrue;
     is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output := is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- fill_x0_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output := fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- fill_y1_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output := fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- fill_x1_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output := fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- fill_y0_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output := fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- x_MUX[uxn_c_l199_c9_d985] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l199_c9_d985_cond <= VAR_x_MUX_uxn_c_l199_c9_d985_cond;
     x_MUX_uxn_c_l199_c9_d985_iftrue <= VAR_x_MUX_uxn_c_l199_c9_d985_iftrue;
     x_MUX_uxn_c_l199_c9_d985_iffalse <= VAR_x_MUX_uxn_c_l199_c9_d985_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l199_c9_d985_return_output := x_MUX_uxn_c_l199_c9_d985_return_output;

     -- is_fill_active_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_cond;
     is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iftrue;
     is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output := is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- y_MUX[uxn_c_l199_c9_d985] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l199_c9_d985_cond <= VAR_y_MUX_uxn_c_l199_c9_d985_cond;
     y_MUX_uxn_c_l199_c9_d985_iftrue <= VAR_y_MUX_uxn_c_l199_c9_d985_iftrue;
     y_MUX_uxn_c_l199_c9_d985_iffalse <= VAR_y_MUX_uxn_c_l199_c9_d985_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l199_c9_d985_return_output := y_MUX_uxn_c_l199_c9_d985_return_output;

     -- fill_color_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_return_output := fill_color_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- is_fill_top_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_cond;
     is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iftrue;
     is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output := is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- fill_layer_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_cond;
     fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iftrue;
     fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output := fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l220_c3_f052_iftrue := VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_MUX_uxn_c_l227_c3_3166_iftrue := VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_right := VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_expr := VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_MUX_uxn_c_l212_c6_076e_iftrue := VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_right := VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_right := VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_d189_left := VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_left := VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_MUX_uxn_c_l238_c19_0a86_cond := VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr := VAR_is_fill_active_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l185_c2_1cc2_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1cc2_iffalse := VAR_x_MUX_uxn_c_l199_c9_d985_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1cc2_iffalse := VAR_y_MUX_uxn_c_l199_c9_d985_return_output;
     -- y_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_y_MUX_uxn_c_l185_c2_1cc2_cond;
     y_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_y_MUX_uxn_c_l185_c2_1cc2_iftrue;
     y_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_y_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output := y_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- BIN_OP_AND[uxn_c_l215_c19_32c7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c19_32c7_left <= VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_left;
     BIN_OP_AND_uxn_c_l215_c19_32c7_right <= VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_return_output := BIN_OP_AND_uxn_c_l215_c19_32c7_return_output;

     -- x_MUX[uxn_c_l185_c2_1cc2] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l185_c2_1cc2_cond <= VAR_x_MUX_uxn_c_l185_c2_1cc2_cond;
     x_MUX_uxn_c_l185_c2_1cc2_iftrue <= VAR_x_MUX_uxn_c_l185_c2_1cc2_iftrue;
     x_MUX_uxn_c_l185_c2_1cc2_iffalse <= VAR_x_MUX_uxn_c_l185_c2_1cc2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l185_c2_1cc2_return_output := x_MUX_uxn_c_l185_c2_1cc2_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09 LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output;

     -- UNARY_OP_NOT[uxn_c_l214_c38_6569] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l214_c38_6569_expr <= VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output := UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_left := VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_return_output;
     VAR_MUX_uxn_c_l227_c3_3166_cond := VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l215_c19_32c7_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_d189_right := VAR_UNARY_OP_NOT_uxn_c_l214_c38_6569_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_cc09_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_left := VAR_x_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_left := VAR_x_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_left := VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_left := VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output;
     VAR_MUX_uxn_c_l211_c6_faa7_iffalse := VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output;
     -- uint16_uint8_8[uxn_c_l205_c27_c008] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l205_c27_c008_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_y_MUX_uxn_c_l185_c2_1cc2_return_output);

     -- BIN_OP_EQ[uxn_c_l210_c22_0381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l210_c22_0381_left <= VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_left;
     BIN_OP_EQ_uxn_c_l210_c22_0381_right <= VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_return_output := BIN_OP_EQ_uxn_c_l210_c22_0381_return_output;

     -- BIN_OP_PLUS[uxn_c_l211_c25_58e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l211_c25_58e7_left <= VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_left;
     BIN_OP_PLUS_uxn_c_l211_c25_58e7_right <= VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output := BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output;

     -- BIN_OP_AND[uxn_c_l214_c19_d189] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l214_c19_d189_left <= VAR_BIN_OP_AND_uxn_c_l214_c19_d189_left;
     BIN_OP_AND_uxn_c_l214_c19_d189_right <= VAR_BIN_OP_AND_uxn_c_l214_c19_d189_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l214_c19_d189_return_output := BIN_OP_AND_uxn_c_l214_c19_d189_return_output;

     -- BIN_OP_PLUS[uxn_c_l212_c34_ae82] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l212_c34_ae82_left <= VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_left;
     BIN_OP_PLUS_uxn_c_l212_c34_ae82_right <= VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output := BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output;

     -- MUX[uxn_c_l227_c3_3166] LATENCY=0
     -- Inputs
     MUX_uxn_c_l227_c3_3166_cond <= VAR_MUX_uxn_c_l227_c3_3166_cond;
     MUX_uxn_c_l227_c3_3166_iftrue <= VAR_MUX_uxn_c_l227_c3_3166_iftrue;
     MUX_uxn_c_l227_c3_3166_iffalse <= VAR_MUX_uxn_c_l227_c3_3166_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l227_c3_3166_return_output := MUX_uxn_c_l227_c3_3166_return_output;

     -- BIN_OP_EQ[uxn_c_l209_c21_76b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l209_c21_76b3_left <= VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_left;
     BIN_OP_EQ_uxn_c_l209_c21_76b3_right <= VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output := BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_left := VAR_BIN_OP_AND_uxn_c_l214_c19_d189_return_output;
     VAR_MUX_uxn_c_l220_c3_f052_cond := VAR_BIN_OP_AND_uxn_c_l214_c19_d189_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l214_c19_d189_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output;
     VAR_BIN_OP_AND_uxn_c_l228_c22_2563_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_4980_return_output;
     VAR_MUX_uxn_c_l209_c21_bcb5_cond := VAR_BIN_OP_EQ_uxn_c_l209_c21_76b3_return_output;
     VAR_MUX_uxn_c_l210_c22_49b4_cond := VAR_BIN_OP_EQ_uxn_c_l210_c22_0381_return_output;
     VAR_MUX_uxn_c_l211_c6_faa7_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l211_c25_58e7_return_output, 8);
     VAR_MUX_uxn_c_l212_c6_076e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l212_c34_ae82_return_output, 8);
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_value := VAR_MUX_uxn_c_l227_c3_3166_return_output;
     VAR_adjusted_write_address_uxn_c_l205_c2_7ad1 := resize(VAR_uint16_uint8_8_uxn_c_l205_c27_c008_return_output, 17);
     -- BIN_OP_AND[uxn_c_l221_c22_01d8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l221_c22_01d8_left <= VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_left;
     BIN_OP_AND_uxn_c_l221_c22_01d8_right <= VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_return_output := BIN_OP_AND_uxn_c_l221_c22_01d8_return_output;

     -- MUX[uxn_c_l220_c3_f052] LATENCY=0
     -- Inputs
     MUX_uxn_c_l220_c3_f052_cond <= VAR_MUX_uxn_c_l220_c3_f052_cond;
     MUX_uxn_c_l220_c3_f052_iftrue <= VAR_MUX_uxn_c_l220_c3_f052_iftrue;
     MUX_uxn_c_l220_c3_f052_iffalse <= VAR_MUX_uxn_c_l220_c3_f052_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l220_c3_f052_return_output := MUX_uxn_c_l220_c3_f052_return_output;

     -- uint17_15_0[uxn_c_l206_c42_2f61] LATENCY=0
     VAR_uint17_15_0_uxn_c_l206_c42_2f61_return_output := uint17_15_0(
     VAR_adjusted_write_address_uxn_c_l205_c2_7ad1);

     -- MUX[uxn_c_l210_c22_49b4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l210_c22_49b4_cond <= VAR_MUX_uxn_c_l210_c22_49b4_cond;
     MUX_uxn_c_l210_c22_49b4_iftrue <= VAR_MUX_uxn_c_l210_c22_49b4_iftrue;
     MUX_uxn_c_l210_c22_49b4_iffalse <= VAR_MUX_uxn_c_l210_c22_49b4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l210_c22_49b4_return_output := MUX_uxn_c_l210_c22_49b4_return_output;

     -- MUX[uxn_c_l209_c21_bcb5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l209_c21_bcb5_cond <= VAR_MUX_uxn_c_l209_c21_bcb5_cond;
     MUX_uxn_c_l209_c21_bcb5_iftrue <= VAR_MUX_uxn_c_l209_c21_bcb5_iftrue;
     MUX_uxn_c_l209_c21_bcb5_iffalse <= VAR_MUX_uxn_c_l209_c21_bcb5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l209_c21_bcb5_return_output := MUX_uxn_c_l209_c21_bcb5_return_output;

     -- BIN_OP_AND[uxn_c_l228_c22_2563] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c22_2563_left <= VAR_BIN_OP_AND_uxn_c_l228_c22_2563_left;
     BIN_OP_AND_uxn_c_l228_c22_2563_right <= VAR_BIN_OP_AND_uxn_c_l228_c22_2563_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c22_2563_return_output := BIN_OP_AND_uxn_c_l228_c22_2563_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_right := VAR_BIN_OP_AND_uxn_c_l221_c22_01d8_return_output;
     VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_right := VAR_BIN_OP_AND_uxn_c_l228_c22_2563_return_output;
     VAR_BIN_OP_AND_uxn_c_l238_c38_f074_left := VAR_MUX_uxn_c_l209_c21_bcb5_return_output;
     VAR_MUX_uxn_c_l211_c6_faa7_cond := VAR_MUX_uxn_c_l209_c21_bcb5_return_output;
     VAR_MUX_uxn_c_l212_c6_076e_cond := VAR_MUX_uxn_c_l209_c21_bcb5_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l209_c21_bcb5_return_output;
     VAR_BIN_OP_AND_uxn_c_l238_c38_f074_right := VAR_MUX_uxn_c_l210_c22_49b4_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l210_c22_49b4_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_value := VAR_MUX_uxn_c_l220_c3_f052_return_output;
     -- BIN_OP_AND[uxn_c_l238_c38_f074] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l238_c38_f074_left <= VAR_BIN_OP_AND_uxn_c_l238_c38_f074_left;
     BIN_OP_AND_uxn_c_l238_c38_f074_right <= VAR_BIN_OP_AND_uxn_c_l238_c38_f074_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l238_c38_f074_return_output := BIN_OP_AND_uxn_c_l238_c38_f074_return_output;

     -- BIN_OP_OR[uxn_c_l221_c3_1b71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l221_c3_1b71_left <= VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_left;
     BIN_OP_OR_uxn_c_l221_c3_1b71_right <= VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_return_output := BIN_OP_OR_uxn_c_l221_c3_1b71_return_output;

     -- MUX[uxn_c_l211_c6_faa7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l211_c6_faa7_cond <= VAR_MUX_uxn_c_l211_c6_faa7_cond;
     MUX_uxn_c_l211_c6_faa7_iftrue <= VAR_MUX_uxn_c_l211_c6_faa7_iftrue;
     MUX_uxn_c_l211_c6_faa7_iffalse <= VAR_MUX_uxn_c_l211_c6_faa7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l211_c6_faa7_return_output := MUX_uxn_c_l211_c6_faa7_return_output;

     -- MUX[uxn_c_l212_c6_076e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l212_c6_076e_cond <= VAR_MUX_uxn_c_l212_c6_076e_cond;
     MUX_uxn_c_l212_c6_076e_iftrue <= VAR_MUX_uxn_c_l212_c6_076e_iftrue;
     MUX_uxn_c_l212_c6_076e_iffalse <= VAR_MUX_uxn_c_l212_c6_076e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l212_c6_076e_return_output := MUX_uxn_c_l212_c6_076e_return_output;

     -- uint16_uint8_0[uxn_c_l206_c27_134d] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l206_c27_134d_return_output := uint16_uint8_0(
     VAR_uint17_15_0_uxn_c_l206_c42_2f61_return_output,
     VAR_x_MUX_uxn_c_l185_c2_1cc2_return_output);

     -- BIN_OP_OR[uxn_c_l228_c3_4ead] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l228_c3_4ead_left <= VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_left;
     BIN_OP_OR_uxn_c_l228_c3_4ead_right <= VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_return_output := BIN_OP_OR_uxn_c_l228_c3_4ead_return_output;

     -- Submodule level 14
     VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr := VAR_BIN_OP_AND_uxn_c_l238_c38_f074_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_enable := VAR_BIN_OP_OR_uxn_c_l221_c3_1b71_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_enable := VAR_BIN_OP_OR_uxn_c_l228_c3_4ead_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l211_c6_faa7_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l212_c6_076e_return_output;
     VAR_adjusted_write_address_uxn_c_l206_c2_3a8b := resize(VAR_uint16_uint8_0_uxn_c_l206_c27_134d_return_output, 17);
     -- uint17_uint1_16[uxn_c_l207_c27_ec27] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l207_c27_ec27_return_output := uint17_uint1_16(
     VAR_adjusted_write_address_uxn_c_l206_c2_3a8b,
     VAR_BIN_OP_AND_uxn_c_l207_c68_162f_return_output);

     -- UNARY_OP_NOT[uxn_c_l238_c38_18e7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr <= VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output := UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_c_l238_c19_0a86_iftrue := VAR_UNARY_OP_NOT_uxn_c_l238_c38_18e7_return_output;
     REG_VAR_adjusted_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_ec27_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_ec27_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_ec27_return_output;
     -- fg_vram_update[uxn_c_l224_c19_75f8] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l224_c19_75f8_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l224_c19_75f8_read_address <= VAR_fg_vram_update_uxn_c_l224_c19_75f8_read_address;
     fg_vram_update_uxn_c_l224_c19_75f8_write_address <= VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_address;
     fg_vram_update_uxn_c_l224_c19_75f8_write_value <= VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_value;
     fg_vram_update_uxn_c_l224_c19_75f8_write_enable <= VAR_fg_vram_update_uxn_c_l224_c19_75f8_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l224_c19_75f8_return_output := fg_vram_update_uxn_c_l224_c19_75f8_return_output;

     -- bg_vram_update[uxn_c_l217_c19_ca26] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l217_c19_ca26_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l217_c19_ca26_read_address <= VAR_bg_vram_update_uxn_c_l217_c19_ca26_read_address;
     bg_vram_update_uxn_c_l217_c19_ca26_write_address <= VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_address;
     bg_vram_update_uxn_c_l217_c19_ca26_write_value <= VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_value;
     bg_vram_update_uxn_c_l217_c19_ca26_write_enable <= VAR_bg_vram_update_uxn_c_l217_c19_ca26_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l217_c19_ca26_return_output := bg_vram_update_uxn_c_l217_c19_ca26_return_output;

     -- MUX[uxn_c_l238_c19_0a86] LATENCY=0
     -- Inputs
     MUX_uxn_c_l238_c19_0a86_cond <= VAR_MUX_uxn_c_l238_c19_0a86_cond;
     MUX_uxn_c_l238_c19_0a86_iftrue <= VAR_MUX_uxn_c_l238_c19_0a86_iftrue;
     MUX_uxn_c_l238_c19_0a86_iffalse <= VAR_MUX_uxn_c_l238_c19_0a86_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l238_c19_0a86_return_output := MUX_uxn_c_l238_c19_0a86_return_output;

     -- Submodule level 16
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l238_c19_0a86_return_output;
     VAR_MUX_uxn_c_l242_c17_b96b_iftrue := VAR_bg_vram_update_uxn_c_l217_c19_ca26_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l217_c19_ca26_return_output;
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_left := VAR_fg_vram_update_uxn_c_l224_c19_75f8_return_output;
     VAR_MUX_uxn_c_l242_c17_b96b_iffalse := VAR_fg_vram_update_uxn_c_l224_c19_75f8_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l224_c19_75f8_return_output;
     -- BIN_OP_EQ[uxn_c_l242_c17_3a7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l242_c17_3a7b_left <= VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_left;
     BIN_OP_EQ_uxn_c_l242_c17_3a7b_right <= VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output := BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output;

     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_20dc] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_20dc_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4103_return_output,
     VAR_MUX_uxn_c_l238_c19_0a86_return_output);

     -- Submodule level 17
     VAR_MUX_uxn_c_l242_c17_b96b_cond := VAR_BIN_OP_EQ_uxn_c_l242_c17_3a7b_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_20dc_return_output;
     -- MUX[uxn_c_l242_c17_b96b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l242_c17_b96b_cond <= VAR_MUX_uxn_c_l242_c17_b96b_cond;
     MUX_uxn_c_l242_c17_b96b_iftrue <= VAR_MUX_uxn_c_l242_c17_b96b_iftrue;
     MUX_uxn_c_l242_c17_b96b_iffalse <= VAR_MUX_uxn_c_l242_c17_b96b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l242_c17_b96b_return_output := MUX_uxn_c_l242_c17_b96b_return_output;

     -- Submodule level 18
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_4a18 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_4a18_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l241_c25_09fd_return_output,
     VAR_MUX_uxn_c_l242_c17_b96b_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_4a18_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_4a18_return_output;
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
