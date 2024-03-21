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
-- BIN_OP_XOR[uxn_c_l157_c2_fe62]
signal BIN_OP_XOR_uxn_c_l157_c2_fe62_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_fe62_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c17_ec1d]
signal BIN_OP_EQ_uxn_c_l158_c17_ec1d_left : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_ec1d_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l158_c17_ed20]
signal MUX_uxn_c_l158_c17_ed20_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_ed20_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_ed20_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l158_c17_ed20_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c18_92e5]
signal BIN_OP_EQ_uxn_c_l159_c18_92e5_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_92e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l159_c18_c63b]
signal MUX_uxn_c_l159_c18_c63b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_c63b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_c63b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l159_c18_c63b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c7_890c]
signal UNARY_OP_NOT_uxn_c_l161_c7_890c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l161_c38_c97e]
signal UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_29b9]
signal BIN_OP_AND_uxn_c_l161_c7_29b9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_29b9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_29b9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l161_c7_c403]
signal BIN_OP_AND_uxn_c_l161_c7_c403_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_c403_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l161_c7_c403_return_output : unsigned(0 downto 0);

-- queue_read_ptr_MUX[uxn_c_l161_c2_4df2]
signal queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue : unsigned(12 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse : unsigned(12 downto 0);
signal queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output : unsigned(12 downto 0);

-- current_queue_item_MUX[uxn_c_l161_c2_4df2]
signal current_queue_item_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
signal current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse : draw_command_t;
signal current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output : draw_command_t;

-- queue_phase_MUX[uxn_c_l161_c2_4df2]
signal queue_phase_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l161_c2_4df2_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[uxn_c_l170_c3_f099]
signal BIN_OP_PLUS_uxn_c_l170_c3_f099_left : unsigned(12 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_f099_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output : unsigned(13 downto 0);

-- queue_write_value_MUX[uxn_c_l173_c2_ccde]
signal queue_write_value_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(23 downto 0);
signal queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(23 downto 0);

-- queue_phase_MUX[uxn_c_l173_c2_ccde]
signal queue_phase_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(1 downto 0);
signal queue_phase_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(1 downto 0);

-- queue_write_ptr_MUX[uxn_c_l173_c2_ccde]
signal queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(12 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(12 downto 0);
signal queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(12 downto 0);

-- BIN_OP_PLUS[uxn_c_l178_c3_6db3]
signal BIN_OP_PLUS_uxn_c_l178_c3_6db3_left : unsigned(12 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_6db3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output : unsigned(13 downto 0);

-- BIN_OP_EQ[uxn_c_l182_c16_e168]
signal BIN_OP_EQ_uxn_c_l182_c16_e168_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_e168_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l182_c16_e168_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l182_c39_7d93]
signal BIN_OP_PLUS_uxn_c_l182_c39_7d93_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_7d93_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output : unsigned(2 downto 0);

-- MUX[uxn_c_l182_c16_dcbd]
signal MUX_uxn_c_l182_c16_dcbd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l182_c16_dcbd_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_dcbd_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l182_c16_dcbd_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l185_c6_8fff]
signal BIN_OP_AND_uxn_c_l185_c6_8fff_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_8fff_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_8fff_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l185_c66_4957]
signal UNARY_OP_NOT_uxn_c_l185_c66_4957_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l185_c6_a46f]
signal BIN_OP_AND_uxn_c_l185_c6_a46f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_a46f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l185_c6_a46f_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l185_c2_1957]
signal x_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- is_fill_left_MUX[uxn_c_l185_c2_1957]
signal is_fill_left_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
signal is_fill_left_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);

-- fill_y0_MUX[uxn_c_l185_c2_1957]
signal fill_y0_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal fill_y0_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- fill_layer_MUX[uxn_c_l185_c2_1957]
signal fill_layer_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
signal fill_layer_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);

-- fill_y1_MUX[uxn_c_l185_c2_1957]
signal fill_y1_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal fill_y1_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_c_l185_c2_1957]
signal y_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- is_fill_top_MUX[uxn_c_l185_c2_1957]
signal is_fill_top_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
signal is_fill_top_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);

-- fill_x0_MUX[uxn_c_l185_c2_1957]
signal fill_x0_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal fill_x0_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- fill_x1_MUX[uxn_c_l185_c2_1957]
signal fill_x1_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
signal fill_x1_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);

-- fill_color_MUX[uxn_c_l185_c2_1957]
signal fill_color_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(1 downto 0);
signal fill_color_MUX_uxn_c_l185_c2_1957_return_output : unsigned(1 downto 0);

-- is_fill_active_MUX[uxn_c_l185_c2_1957]
signal is_fill_active_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
signal is_fill_active_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l188_c13_4b07]
signal MUX_uxn_c_l188_c13_4b07_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l188_c13_4b07_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_4b07_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l188_c13_4b07_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l189_c13_0f73]
signal MUX_uxn_c_l189_c13_0f73_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l189_c13_0f73_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_0f73_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l189_c13_0f73_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l190_c13_2fbe]
signal MUX_uxn_c_l190_c13_2fbe_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l190_c13_2fbe_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_2fbe_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l190_c13_2fbe_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l191_c13_d781]
signal MUX_uxn_c_l191_c13_d781_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l191_c13_d781_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l191_c13_d781_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l191_c13_d781_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l199_c44_5788]
signal UNARY_OP_NOT_uxn_c_l199_c44_5788_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l199_c13_b42a]
signal BIN_OP_AND_uxn_c_l199_c13_b42a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l199_c13_b42a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l199_c13_b42a_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_c_l199_c9_38d1]
signal x_MUX_uxn_c_l199_c9_38d1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_c_l199_c9_38d1_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_c_l199_c9_38d1_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_c_l199_c9_38d1_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_c_l199_c9_38d1]
signal y_MUX_uxn_c_l199_c9_38d1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_c_l199_c9_38d1_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_c_l199_c9_38d1_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_c_l199_c9_38d1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l204_c57_237c]
signal BIN_OP_AND_uxn_c_l204_c57_237c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c57_237c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l204_c57_237c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l207_c68_f56e]
signal UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l207_c68_f850]
signal BIN_OP_AND_uxn_c_l207_c68_f850_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l207_c68_f850_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l207_c68_f850_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l209_c21_2206]
signal BIN_OP_EQ_uxn_c_l209_c21_2206_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c21_2206_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l209_c21_2206_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l209_c21_9c22]
signal MUX_uxn_c_l209_c21_9c22_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_9c22_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_9c22_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l209_c21_9c22_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l210_c22_be50]
signal BIN_OP_EQ_uxn_c_l210_c22_be50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c22_be50_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l210_c22_be50_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l210_c22_cfd1]
signal MUX_uxn_c_l210_c22_cfd1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_cfd1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_cfd1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l210_c22_cfd1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l211_c25_1a1b]
signal BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l211_c6_3d4d]
signal MUX_uxn_c_l211_c6_3d4d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l211_c6_3d4d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_3d4d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l211_c6_3d4d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l212_c34_3326]
signal BIN_OP_PLUS_uxn_c_l212_c34_3326_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l212_c34_3326_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l212_c6_0c43]
signal MUX_uxn_c_l212_c6_0c43_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l212_c6_0c43_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l212_c6_0c43_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l212_c6_0c43_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l214_c38_6f78]
signal UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l214_c19_47bc]
signal BIN_OP_AND_uxn_c_l214_c19_47bc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_47bc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l214_c19_47bc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l215_c19_e6b2]
signal BIN_OP_AND_uxn_c_l215_c19_e6b2_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c19_e6b2_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l220_c3_de44]
signal MUX_uxn_c_l220_c3_de44_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l220_c3_de44_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l220_c3_de44_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l220_c3_de44_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[uxn_c_l221_c71_f164]
signal UNARY_OP_NOT_uxn_c_l221_c71_f164_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l221_c22_029a]
signal BIN_OP_AND_uxn_c_l221_c22_029a_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l221_c22_029a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l221_c22_029a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l221_c3_f47c]
signal BIN_OP_OR_uxn_c_l221_c3_f47c_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l221_c3_f47c_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l221_c3_f47c_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l217_c19_3275]
signal bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l217_c19_3275_read_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l217_c19_3275_write_address : unsigned(16 downto 0);
signal bg_vram_update_uxn_c_l217_c19_3275_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l217_c19_3275_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l217_c19_3275_return_output : unsigned(1 downto 0);

-- MUX[uxn_c_l227_c3_5051]
signal MUX_uxn_c_l227_c3_5051_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l227_c3_5051_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l227_c3_5051_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l227_c3_5051_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l228_c22_637f]
signal BIN_OP_AND_uxn_c_l228_c22_637f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l228_c22_637f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l228_c22_637f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_c_l228_c3_2380]
signal BIN_OP_OR_uxn_c_l228_c3_2380_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l228_c3_2380_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_c_l228_c3_2380_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l224_c19_c287]
signal fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l224_c19_c287_read_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l224_c19_c287_write_address : unsigned(16 downto 0);
signal fg_vram_update_uxn_c_l224_c19_c287_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l224_c19_c287_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l224_c19_c287_return_output : unsigned(1 downto 0);

-- draw_queue_update[uxn_c_l231_c21_9a08]
signal draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l231_c21_9a08_read_address : unsigned(12 downto 0);
signal draw_queue_update_uxn_c_l231_c21_9a08_write_address : unsigned(12 downto 0);
signal draw_queue_update_uxn_c_l231_c21_9a08_write_value : unsigned(23 downto 0);
signal draw_queue_update_uxn_c_l231_c21_9a08_write_enable : unsigned(0 downto 0);
signal draw_queue_update_uxn_c_l231_c21_9a08_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_c_l238_c38_24ce]
signal BIN_OP_AND_uxn_c_l238_c38_24ce_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l238_c38_24ce_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l238_c38_24ce_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l238_c38_75fa]
signal UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l238_c19_d7dc]
signal MUX_uxn_c_l238_c19_d7dc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_d7dc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_d7dc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l238_c19_d7dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l240_c19_09cd]
signal BIN_OP_EQ_uxn_c_l240_c19_09cd_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c19_09cd_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l240_c76_c201]
signal BIN_OP_PLUS_uxn_c_l240_c76_c201_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_c_l240_c76_c201_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output : unsigned(17 downto 0);

-- MUX[uxn_c_l240_c50_9901]
signal MUX_uxn_c_l240_c50_9901_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c50_9901_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c50_9901_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c50_9901_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l240_c19_1ac0]
signal MUX_uxn_c_l240_c19_1ac0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l240_c19_1ac0_iftrue : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c19_1ac0_iffalse : unsigned(16 downto 0);
signal MUX_uxn_c_l240_c19_1ac0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l241_c25_d793]
signal BIN_OP_EQ_uxn_c_l241_c25_d793_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c25_d793_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l241_c25_d793_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l241_c25_1717]
signal MUX_uxn_c_l241_c25_1717_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_1717_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_1717_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l241_c25_1717_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l242_c17_3458]
signal BIN_OP_EQ_uxn_c_l242_c17_3458_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c17_3458_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l242_c17_3458_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l242_c17_74b4]
signal MUX_uxn_c_l242_c17_74b4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l242_c17_74b4_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l242_c17_74b4_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l242_c17_74b4_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e
signal UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output : unsigned(0 downto 0);

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
-- BIN_OP_XOR_uxn_c_l157_c2_fe62
BIN_OP_XOR_uxn_c_l157_c2_fe62 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l157_c2_fe62_left,
BIN_OP_XOR_uxn_c_l157_c2_fe62_right,
BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output);

-- BIN_OP_EQ_uxn_c_l158_c17_ec1d
BIN_OP_EQ_uxn_c_l158_c17_ec1d : entity work.BIN_OP_EQ_uint13_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c17_ec1d_left,
BIN_OP_EQ_uxn_c_l158_c17_ec1d_right,
BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output);

-- MUX_uxn_c_l158_c17_ed20
MUX_uxn_c_l158_c17_ed20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l158_c17_ed20_cond,
MUX_uxn_c_l158_c17_ed20_iftrue,
MUX_uxn_c_l158_c17_ed20_iffalse,
MUX_uxn_c_l158_c17_ed20_return_output);

-- BIN_OP_EQ_uxn_c_l159_c18_92e5
BIN_OP_EQ_uxn_c_l159_c18_92e5 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c18_92e5_left,
BIN_OP_EQ_uxn_c_l159_c18_92e5_right,
BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output);

-- MUX_uxn_c_l159_c18_c63b
MUX_uxn_c_l159_c18_c63b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l159_c18_c63b_cond,
MUX_uxn_c_l159_c18_c63b_iftrue,
MUX_uxn_c_l159_c18_c63b_iffalse,
MUX_uxn_c_l159_c18_c63b_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c7_890c
UNARY_OP_NOT_uxn_c_l161_c7_890c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c7_890c_expr,
UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output);

-- UNARY_OP_NOT_uxn_c_l161_c38_c97e
UNARY_OP_NOT_uxn_c_l161_c38_c97e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr,
UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_29b9
BIN_OP_AND_uxn_c_l161_c7_29b9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_29b9_left,
BIN_OP_AND_uxn_c_l161_c7_29b9_right,
BIN_OP_AND_uxn_c_l161_c7_29b9_return_output);

-- BIN_OP_AND_uxn_c_l161_c7_c403
BIN_OP_AND_uxn_c_l161_c7_c403 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l161_c7_c403_left,
BIN_OP_AND_uxn_c_l161_c7_c403_right,
BIN_OP_AND_uxn_c_l161_c7_c403_return_output);

-- queue_read_ptr_MUX_uxn_c_l161_c2_4df2
queue_read_ptr_MUX_uxn_c_l161_c2_4df2 : entity work.MUX_uint1_t_uint13_t_uint13_t_0CLK_de264c78 port map (
queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond,
queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue,
queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse,
queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output);

-- current_queue_item_MUX_uxn_c_l161_c2_4df2
current_queue_item_MUX_uxn_c_l161_c2_4df2 : entity work.MUX_uint1_t_draw_command_t_draw_command_t_0CLK_de264c78 port map (
current_queue_item_MUX_uxn_c_l161_c2_4df2_cond,
current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue,
current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse,
current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output);

-- queue_phase_MUX_uxn_c_l161_c2_4df2
queue_phase_MUX_uxn_c_l161_c2_4df2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l161_c2_4df2_cond,
queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue,
queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse,
queue_phase_MUX_uxn_c_l161_c2_4df2_return_output);

-- BIN_OP_PLUS_uxn_c_l170_c3_f099
BIN_OP_PLUS_uxn_c_l170_c3_f099 : entity work.BIN_OP_PLUS_uint13_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l170_c3_f099_left,
BIN_OP_PLUS_uxn_c_l170_c3_f099_right,
BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output);

-- queue_write_value_MUX_uxn_c_l173_c2_ccde
queue_write_value_MUX_uxn_c_l173_c2_ccde : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
queue_write_value_MUX_uxn_c_l173_c2_ccde_cond,
queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue,
queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse,
queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output);

-- queue_phase_MUX_uxn_c_l173_c2_ccde
queue_phase_MUX_uxn_c_l173_c2_ccde : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
queue_phase_MUX_uxn_c_l173_c2_ccde_cond,
queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue,
queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse,
queue_phase_MUX_uxn_c_l173_c2_ccde_return_output);

-- queue_write_ptr_MUX_uxn_c_l173_c2_ccde
queue_write_ptr_MUX_uxn_c_l173_c2_ccde : entity work.MUX_uint1_t_uint13_t_uint13_t_0CLK_de264c78 port map (
queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond,
queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue,
queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse,
queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output);

-- BIN_OP_PLUS_uxn_c_l178_c3_6db3
BIN_OP_PLUS_uxn_c_l178_c3_6db3 : entity work.BIN_OP_PLUS_uint13_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l178_c3_6db3_left,
BIN_OP_PLUS_uxn_c_l178_c3_6db3_right,
BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output);

-- BIN_OP_EQ_uxn_c_l182_c16_e168
BIN_OP_EQ_uxn_c_l182_c16_e168 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l182_c16_e168_left,
BIN_OP_EQ_uxn_c_l182_c16_e168_right,
BIN_OP_EQ_uxn_c_l182_c16_e168_return_output);

-- BIN_OP_PLUS_uxn_c_l182_c39_7d93
BIN_OP_PLUS_uxn_c_l182_c39_7d93 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l182_c39_7d93_left,
BIN_OP_PLUS_uxn_c_l182_c39_7d93_right,
BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output);

-- MUX_uxn_c_l182_c16_dcbd
MUX_uxn_c_l182_c16_dcbd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l182_c16_dcbd_cond,
MUX_uxn_c_l182_c16_dcbd_iftrue,
MUX_uxn_c_l182_c16_dcbd_iffalse,
MUX_uxn_c_l182_c16_dcbd_return_output);

-- BIN_OP_AND_uxn_c_l185_c6_8fff
BIN_OP_AND_uxn_c_l185_c6_8fff : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c6_8fff_left,
BIN_OP_AND_uxn_c_l185_c6_8fff_right,
BIN_OP_AND_uxn_c_l185_c6_8fff_return_output);

-- UNARY_OP_NOT_uxn_c_l185_c66_4957
UNARY_OP_NOT_uxn_c_l185_c66_4957 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l185_c66_4957_expr,
UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output);

-- BIN_OP_AND_uxn_c_l185_c6_a46f
BIN_OP_AND_uxn_c_l185_c6_a46f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c6_a46f_left,
BIN_OP_AND_uxn_c_l185_c6_a46f_right,
BIN_OP_AND_uxn_c_l185_c6_a46f_return_output);

-- x_MUX_uxn_c_l185_c2_1957
x_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l185_c2_1957_cond,
x_MUX_uxn_c_l185_c2_1957_iftrue,
x_MUX_uxn_c_l185_c2_1957_iffalse,
x_MUX_uxn_c_l185_c2_1957_return_output);

-- is_fill_left_MUX_uxn_c_l185_c2_1957
is_fill_left_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_left_MUX_uxn_c_l185_c2_1957_cond,
is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue,
is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse,
is_fill_left_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_y0_MUX_uxn_c_l185_c2_1957
fill_y0_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y0_MUX_uxn_c_l185_c2_1957_cond,
fill_y0_MUX_uxn_c_l185_c2_1957_iftrue,
fill_y0_MUX_uxn_c_l185_c2_1957_iffalse,
fill_y0_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_layer_MUX_uxn_c_l185_c2_1957
fill_layer_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
fill_layer_MUX_uxn_c_l185_c2_1957_cond,
fill_layer_MUX_uxn_c_l185_c2_1957_iftrue,
fill_layer_MUX_uxn_c_l185_c2_1957_iffalse,
fill_layer_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_y1_MUX_uxn_c_l185_c2_1957
fill_y1_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_y1_MUX_uxn_c_l185_c2_1957_cond,
fill_y1_MUX_uxn_c_l185_c2_1957_iftrue,
fill_y1_MUX_uxn_c_l185_c2_1957_iffalse,
fill_y1_MUX_uxn_c_l185_c2_1957_return_output);

-- y_MUX_uxn_c_l185_c2_1957
y_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l185_c2_1957_cond,
y_MUX_uxn_c_l185_c2_1957_iftrue,
y_MUX_uxn_c_l185_c2_1957_iffalse,
y_MUX_uxn_c_l185_c2_1957_return_output);

-- is_fill_top_MUX_uxn_c_l185_c2_1957
is_fill_top_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_top_MUX_uxn_c_l185_c2_1957_cond,
is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue,
is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse,
is_fill_top_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_x0_MUX_uxn_c_l185_c2_1957
fill_x0_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x0_MUX_uxn_c_l185_c2_1957_cond,
fill_x0_MUX_uxn_c_l185_c2_1957_iftrue,
fill_x0_MUX_uxn_c_l185_c2_1957_iffalse,
fill_x0_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_x1_MUX_uxn_c_l185_c2_1957
fill_x1_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
fill_x1_MUX_uxn_c_l185_c2_1957_cond,
fill_x1_MUX_uxn_c_l185_c2_1957_iftrue,
fill_x1_MUX_uxn_c_l185_c2_1957_iffalse,
fill_x1_MUX_uxn_c_l185_c2_1957_return_output);

-- fill_color_MUX_uxn_c_l185_c2_1957
fill_color_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
fill_color_MUX_uxn_c_l185_c2_1957_cond,
fill_color_MUX_uxn_c_l185_c2_1957_iftrue,
fill_color_MUX_uxn_c_l185_c2_1957_iffalse,
fill_color_MUX_uxn_c_l185_c2_1957_return_output);

-- is_fill_active_MUX_uxn_c_l185_c2_1957
is_fill_active_MUX_uxn_c_l185_c2_1957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_active_MUX_uxn_c_l185_c2_1957_cond,
is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue,
is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse,
is_fill_active_MUX_uxn_c_l185_c2_1957_return_output);

-- MUX_uxn_c_l188_c13_4b07
MUX_uxn_c_l188_c13_4b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l188_c13_4b07_cond,
MUX_uxn_c_l188_c13_4b07_iftrue,
MUX_uxn_c_l188_c13_4b07_iffalse,
MUX_uxn_c_l188_c13_4b07_return_output);

-- MUX_uxn_c_l189_c13_0f73
MUX_uxn_c_l189_c13_0f73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l189_c13_0f73_cond,
MUX_uxn_c_l189_c13_0f73_iftrue,
MUX_uxn_c_l189_c13_0f73_iffalse,
MUX_uxn_c_l189_c13_0f73_return_output);

-- MUX_uxn_c_l190_c13_2fbe
MUX_uxn_c_l190_c13_2fbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l190_c13_2fbe_cond,
MUX_uxn_c_l190_c13_2fbe_iftrue,
MUX_uxn_c_l190_c13_2fbe_iffalse,
MUX_uxn_c_l190_c13_2fbe_return_output);

-- MUX_uxn_c_l191_c13_d781
MUX_uxn_c_l191_c13_d781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l191_c13_d781_cond,
MUX_uxn_c_l191_c13_d781_iftrue,
MUX_uxn_c_l191_c13_d781_iffalse,
MUX_uxn_c_l191_c13_d781_return_output);

-- UNARY_OP_NOT_uxn_c_l199_c44_5788
UNARY_OP_NOT_uxn_c_l199_c44_5788 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l199_c44_5788_expr,
UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output);

-- BIN_OP_AND_uxn_c_l199_c13_b42a
BIN_OP_AND_uxn_c_l199_c13_b42a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l199_c13_b42a_left,
BIN_OP_AND_uxn_c_l199_c13_b42a_right,
BIN_OP_AND_uxn_c_l199_c13_b42a_return_output);

-- x_MUX_uxn_c_l199_c9_38d1
x_MUX_uxn_c_l199_c9_38d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_c_l199_c9_38d1_cond,
x_MUX_uxn_c_l199_c9_38d1_iftrue,
x_MUX_uxn_c_l199_c9_38d1_iffalse,
x_MUX_uxn_c_l199_c9_38d1_return_output);

-- y_MUX_uxn_c_l199_c9_38d1
y_MUX_uxn_c_l199_c9_38d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_c_l199_c9_38d1_cond,
y_MUX_uxn_c_l199_c9_38d1_iftrue,
y_MUX_uxn_c_l199_c9_38d1_iffalse,
y_MUX_uxn_c_l199_c9_38d1_return_output);

-- BIN_OP_AND_uxn_c_l204_c57_237c
BIN_OP_AND_uxn_c_l204_c57_237c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l204_c57_237c_left,
BIN_OP_AND_uxn_c_l204_c57_237c_right,
BIN_OP_AND_uxn_c_l204_c57_237c_return_output);

-- UNARY_OP_NOT_uxn_c_l207_c68_f56e
UNARY_OP_NOT_uxn_c_l207_c68_f56e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr,
UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output);

-- BIN_OP_AND_uxn_c_l207_c68_f850
BIN_OP_AND_uxn_c_l207_c68_f850 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l207_c68_f850_left,
BIN_OP_AND_uxn_c_l207_c68_f850_right,
BIN_OP_AND_uxn_c_l207_c68_f850_return_output);

-- BIN_OP_EQ_uxn_c_l209_c21_2206
BIN_OP_EQ_uxn_c_l209_c21_2206 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l209_c21_2206_left,
BIN_OP_EQ_uxn_c_l209_c21_2206_right,
BIN_OP_EQ_uxn_c_l209_c21_2206_return_output);

-- MUX_uxn_c_l209_c21_9c22
MUX_uxn_c_l209_c21_9c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l209_c21_9c22_cond,
MUX_uxn_c_l209_c21_9c22_iftrue,
MUX_uxn_c_l209_c21_9c22_iffalse,
MUX_uxn_c_l209_c21_9c22_return_output);

-- BIN_OP_EQ_uxn_c_l210_c22_be50
BIN_OP_EQ_uxn_c_l210_c22_be50 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l210_c22_be50_left,
BIN_OP_EQ_uxn_c_l210_c22_be50_right,
BIN_OP_EQ_uxn_c_l210_c22_be50_return_output);

-- MUX_uxn_c_l210_c22_cfd1
MUX_uxn_c_l210_c22_cfd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l210_c22_cfd1_cond,
MUX_uxn_c_l210_c22_cfd1_iftrue,
MUX_uxn_c_l210_c22_cfd1_iffalse,
MUX_uxn_c_l210_c22_cfd1_return_output);

-- BIN_OP_PLUS_uxn_c_l211_c25_1a1b
BIN_OP_PLUS_uxn_c_l211_c25_1a1b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left,
BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right,
BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output);

-- MUX_uxn_c_l211_c6_3d4d
MUX_uxn_c_l211_c6_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l211_c6_3d4d_cond,
MUX_uxn_c_l211_c6_3d4d_iftrue,
MUX_uxn_c_l211_c6_3d4d_iffalse,
MUX_uxn_c_l211_c6_3d4d_return_output);

-- BIN_OP_PLUS_uxn_c_l212_c34_3326
BIN_OP_PLUS_uxn_c_l212_c34_3326 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l212_c34_3326_left,
BIN_OP_PLUS_uxn_c_l212_c34_3326_right,
BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output);

-- MUX_uxn_c_l212_c6_0c43
MUX_uxn_c_l212_c6_0c43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l212_c6_0c43_cond,
MUX_uxn_c_l212_c6_0c43_iftrue,
MUX_uxn_c_l212_c6_0c43_iffalse,
MUX_uxn_c_l212_c6_0c43_return_output);

-- UNARY_OP_NOT_uxn_c_l214_c38_6f78
UNARY_OP_NOT_uxn_c_l214_c38_6f78 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr,
UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output);

-- BIN_OP_AND_uxn_c_l214_c19_47bc
BIN_OP_AND_uxn_c_l214_c19_47bc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l214_c19_47bc_left,
BIN_OP_AND_uxn_c_l214_c19_47bc_right,
BIN_OP_AND_uxn_c_l214_c19_47bc_return_output);

-- BIN_OP_AND_uxn_c_l215_c19_e6b2
BIN_OP_AND_uxn_c_l215_c19_e6b2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l215_c19_e6b2_left,
BIN_OP_AND_uxn_c_l215_c19_e6b2_right,
BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output);

-- MUX_uxn_c_l220_c3_de44
MUX_uxn_c_l220_c3_de44 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l220_c3_de44_cond,
MUX_uxn_c_l220_c3_de44_iftrue,
MUX_uxn_c_l220_c3_de44_iffalse,
MUX_uxn_c_l220_c3_de44_return_output);

-- UNARY_OP_NOT_uxn_c_l221_c71_f164
UNARY_OP_NOT_uxn_c_l221_c71_f164 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l221_c71_f164_expr,
UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output);

-- BIN_OP_AND_uxn_c_l221_c22_029a
BIN_OP_AND_uxn_c_l221_c22_029a : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l221_c22_029a_left,
BIN_OP_AND_uxn_c_l221_c22_029a_right,
BIN_OP_AND_uxn_c_l221_c22_029a_return_output);

-- BIN_OP_OR_uxn_c_l221_c3_f47c
BIN_OP_OR_uxn_c_l221_c3_f47c : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l221_c3_f47c_left,
BIN_OP_OR_uxn_c_l221_c3_f47c_right,
BIN_OP_OR_uxn_c_l221_c3_f47c_return_output);

-- bg_vram_update_uxn_c_l217_c19_3275
bg_vram_update_uxn_c_l217_c19_3275 : entity work.bg_vram_update_0CLK_6f2c5aad port map (
clk,
bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE,
bg_vram_update_uxn_c_l217_c19_3275_read_address,
bg_vram_update_uxn_c_l217_c19_3275_write_address,
bg_vram_update_uxn_c_l217_c19_3275_write_value,
bg_vram_update_uxn_c_l217_c19_3275_write_enable,
bg_vram_update_uxn_c_l217_c19_3275_return_output);

-- MUX_uxn_c_l227_c3_5051
MUX_uxn_c_l227_c3_5051 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l227_c3_5051_cond,
MUX_uxn_c_l227_c3_5051_iftrue,
MUX_uxn_c_l227_c3_5051_iffalse,
MUX_uxn_c_l227_c3_5051_return_output);

-- BIN_OP_AND_uxn_c_l228_c22_637f
BIN_OP_AND_uxn_c_l228_c22_637f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l228_c22_637f_left,
BIN_OP_AND_uxn_c_l228_c22_637f_right,
BIN_OP_AND_uxn_c_l228_c22_637f_return_output);

-- BIN_OP_OR_uxn_c_l228_c3_2380
BIN_OP_OR_uxn_c_l228_c3_2380 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l228_c3_2380_left,
BIN_OP_OR_uxn_c_l228_c3_2380_right,
BIN_OP_OR_uxn_c_l228_c3_2380_return_output);

-- fg_vram_update_uxn_c_l224_c19_c287
fg_vram_update_uxn_c_l224_c19_c287 : entity work.fg_vram_update_0CLK_6f2c5aad port map (
clk,
fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE,
fg_vram_update_uxn_c_l224_c19_c287_read_address,
fg_vram_update_uxn_c_l224_c19_c287_write_address,
fg_vram_update_uxn_c_l224_c19_c287_write_value,
fg_vram_update_uxn_c_l224_c19_c287_write_enable,
fg_vram_update_uxn_c_l224_c19_c287_return_output);

-- draw_queue_update_uxn_c_l231_c21_9a08
draw_queue_update_uxn_c_l231_c21_9a08 : entity work.draw_queue_update_0CLK_380ecc95 port map (
clk,
draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE,
draw_queue_update_uxn_c_l231_c21_9a08_read_address,
draw_queue_update_uxn_c_l231_c21_9a08_write_address,
draw_queue_update_uxn_c_l231_c21_9a08_write_value,
draw_queue_update_uxn_c_l231_c21_9a08_write_enable,
draw_queue_update_uxn_c_l231_c21_9a08_return_output);

-- BIN_OP_AND_uxn_c_l238_c38_24ce
BIN_OP_AND_uxn_c_l238_c38_24ce : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l238_c38_24ce_left,
BIN_OP_AND_uxn_c_l238_c38_24ce_right,
BIN_OP_AND_uxn_c_l238_c38_24ce_return_output);

-- UNARY_OP_NOT_uxn_c_l238_c38_75fa
UNARY_OP_NOT_uxn_c_l238_c38_75fa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr,
UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output);

-- MUX_uxn_c_l238_c19_d7dc
MUX_uxn_c_l238_c19_d7dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l238_c19_d7dc_cond,
MUX_uxn_c_l238_c19_d7dc_iftrue,
MUX_uxn_c_l238_c19_d7dc_iffalse,
MUX_uxn_c_l238_c19_d7dc_return_output);

-- BIN_OP_EQ_uxn_c_l240_c19_09cd
BIN_OP_EQ_uxn_c_l240_c19_09cd : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l240_c19_09cd_left,
BIN_OP_EQ_uxn_c_l240_c19_09cd_right,
BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output);

-- BIN_OP_PLUS_uxn_c_l240_c76_c201
BIN_OP_PLUS_uxn_c_l240_c76_c201 : entity work.BIN_OP_PLUS_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l240_c76_c201_left,
BIN_OP_PLUS_uxn_c_l240_c76_c201_right,
BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output);

-- MUX_uxn_c_l240_c50_9901
MUX_uxn_c_l240_c50_9901 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l240_c50_9901_cond,
MUX_uxn_c_l240_c50_9901_iftrue,
MUX_uxn_c_l240_c50_9901_iffalse,
MUX_uxn_c_l240_c50_9901_return_output);

-- MUX_uxn_c_l240_c19_1ac0
MUX_uxn_c_l240_c19_1ac0 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_c_l240_c19_1ac0_cond,
MUX_uxn_c_l240_c19_1ac0_iftrue,
MUX_uxn_c_l240_c19_1ac0_iffalse,
MUX_uxn_c_l240_c19_1ac0_return_output);

-- BIN_OP_EQ_uxn_c_l241_c25_d793
BIN_OP_EQ_uxn_c_l241_c25_d793 : entity work.BIN_OP_EQ_uint17_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l241_c25_d793_left,
BIN_OP_EQ_uxn_c_l241_c25_d793_right,
BIN_OP_EQ_uxn_c_l241_c25_d793_return_output);

-- MUX_uxn_c_l241_c25_1717
MUX_uxn_c_l241_c25_1717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l241_c25_1717_cond,
MUX_uxn_c_l241_c25_1717_iftrue,
MUX_uxn_c_l241_c25_1717_iffalse,
MUX_uxn_c_l241_c25_1717_return_output);

-- BIN_OP_EQ_uxn_c_l242_c17_3458
BIN_OP_EQ_uxn_c_l242_c17_3458 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l242_c17_3458_left,
BIN_OP_EQ_uxn_c_l242_c17_3458_right,
BIN_OP_EQ_uxn_c_l242_c17_3458_return_output);

-- MUX_uxn_c_l242_c17_74b4
MUX_uxn_c_l242_c17_74b4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l242_c17_74b4_cond,
MUX_uxn_c_l242_c17_74b4_iftrue,
MUX_uxn_c_l242_c17_74b4_iffalse,
MUX_uxn_c_l242_c17_74b4_return_output);

-- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr,
UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output);



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
 BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output,
 BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output,
 MUX_uxn_c_l158_c17_ed20_return_output,
 BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output,
 MUX_uxn_c_l159_c18_c63b_return_output,
 UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output,
 UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output,
 BIN_OP_AND_uxn_c_l161_c7_29b9_return_output,
 BIN_OP_AND_uxn_c_l161_c7_c403_return_output,
 queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output,
 current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output,
 queue_phase_MUX_uxn_c_l161_c2_4df2_return_output,
 BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output,
 queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output,
 queue_phase_MUX_uxn_c_l173_c2_ccde_return_output,
 queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output,
 BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output,
 BIN_OP_EQ_uxn_c_l182_c16_e168_return_output,
 BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output,
 MUX_uxn_c_l182_c16_dcbd_return_output,
 BIN_OP_AND_uxn_c_l185_c6_8fff_return_output,
 UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output,
 BIN_OP_AND_uxn_c_l185_c6_a46f_return_output,
 x_MUX_uxn_c_l185_c2_1957_return_output,
 is_fill_left_MUX_uxn_c_l185_c2_1957_return_output,
 fill_y0_MUX_uxn_c_l185_c2_1957_return_output,
 fill_layer_MUX_uxn_c_l185_c2_1957_return_output,
 fill_y1_MUX_uxn_c_l185_c2_1957_return_output,
 y_MUX_uxn_c_l185_c2_1957_return_output,
 is_fill_top_MUX_uxn_c_l185_c2_1957_return_output,
 fill_x0_MUX_uxn_c_l185_c2_1957_return_output,
 fill_x1_MUX_uxn_c_l185_c2_1957_return_output,
 fill_color_MUX_uxn_c_l185_c2_1957_return_output,
 is_fill_active_MUX_uxn_c_l185_c2_1957_return_output,
 MUX_uxn_c_l188_c13_4b07_return_output,
 MUX_uxn_c_l189_c13_0f73_return_output,
 MUX_uxn_c_l190_c13_2fbe_return_output,
 MUX_uxn_c_l191_c13_d781_return_output,
 UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output,
 BIN_OP_AND_uxn_c_l199_c13_b42a_return_output,
 x_MUX_uxn_c_l199_c9_38d1_return_output,
 y_MUX_uxn_c_l199_c9_38d1_return_output,
 BIN_OP_AND_uxn_c_l204_c57_237c_return_output,
 UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output,
 BIN_OP_AND_uxn_c_l207_c68_f850_return_output,
 BIN_OP_EQ_uxn_c_l209_c21_2206_return_output,
 MUX_uxn_c_l209_c21_9c22_return_output,
 BIN_OP_EQ_uxn_c_l210_c22_be50_return_output,
 MUX_uxn_c_l210_c22_cfd1_return_output,
 BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output,
 MUX_uxn_c_l211_c6_3d4d_return_output,
 BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output,
 MUX_uxn_c_l212_c6_0c43_return_output,
 UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output,
 BIN_OP_AND_uxn_c_l214_c19_47bc_return_output,
 BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output,
 MUX_uxn_c_l220_c3_de44_return_output,
 UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output,
 BIN_OP_AND_uxn_c_l221_c22_029a_return_output,
 BIN_OP_OR_uxn_c_l221_c3_f47c_return_output,
 bg_vram_update_uxn_c_l217_c19_3275_return_output,
 MUX_uxn_c_l227_c3_5051_return_output,
 BIN_OP_AND_uxn_c_l228_c22_637f_return_output,
 BIN_OP_OR_uxn_c_l228_c3_2380_return_output,
 fg_vram_update_uxn_c_l224_c19_c287_return_output,
 draw_queue_update_uxn_c_l231_c21_9a08_return_output,
 BIN_OP_AND_uxn_c_l238_c38_24ce_return_output,
 UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output,
 MUX_uxn_c_l238_c19_d7dc_return_output,
 BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output,
 BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output,
 MUX_uxn_c_l240_c50_9901_return_output,
 MUX_uxn_c_l240_c19_1ac0_return_output,
 BIN_OP_EQ_uxn_c_l241_c25_d793_return_output,
 MUX_uxn_c_l241_c25_1717_return_output,
 BIN_OP_EQ_uxn_c_l242_c17_3458_return_output,
 MUX_uxn_c_l242_c17_74b4_return_output,
 UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output)
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
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_ed20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_ed20_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_ed20_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l158_c17_ed20_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_c63b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_c63b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_c63b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l159_c18_c63b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_12ed_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_c403_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_c403_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l161_c7_c403_return_output : unsigned(0 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_uxn_c_l170_c3_d988 : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output : unsigned(12 downto 0);
 variable VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue : draw_command_t;
 variable VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4df2_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output : draw_command_t;
 variable VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l169_c3_219c : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_cond : unsigned(0 downto 0);
 variable VAR_uint24_15_0_uxn_c_l162_c37_39db_return_output : unsigned(15 downto 0);
 variable VAR_uint24_17_16_uxn_c_l163_c30_2215_return_output : unsigned(1 downto 0);
 variable VAR_uint24_18_18_uxn_c_l164_c33_6c44_return_output : unsigned(0 downto 0);
 variable VAR_uint24_19_19_uxn_c_l165_c34_7abb_return_output : unsigned(0 downto 0);
 variable VAR_uint24_20_20_uxn_c_l166_c32_9e99_return_output : unsigned(0 downto 0);
 variable VAR_uint24_21_21_uxn_c_l167_c30_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output : unsigned(13 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(23 downto 0);
 variable VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(1 downto 0);
 variable VAR_queue_phase_uxn_c_l177_c3_9807 : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(1 downto 0);
 variable VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_uxn_c_l178_c3_a55e : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output : unsigned(12 downto 0);
 variable VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond : unsigned(0 downto 0);
 variable VAR_uint24_uint16_0_uxn_c_l174_c23_9e5d_return_output : unsigned(23 downto 0);
 variable VAR_uint8_4_0_uxn_c_l175_c58_e621_return_output : unsigned(4 downto 0);
 variable VAR_uint24_uint5_16_uxn_c_l175_c23_e3e0_return_output : unsigned(23 downto 0);
 variable VAR_uint24_uint1_21_uxn_c_l176_c23_5be8_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output : unsigned(13 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_dcbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_dcbd_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_dcbd_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output : unsigned(2 downto 0);
 variable VAR_MUX_uxn_c_l182_c16_dcbd_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_7261_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_38d1_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_fill_y0_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);
 variable VAR_fill_layer_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_fill_y1_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_38d1_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_fill_x0_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1957_return_output : unsigned(7 downto 0);
 variable VAR_fill_x1_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1957_return_output : unsigned(1 downto 0);
 variable VAR_fill_color_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_21e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_0b73_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4b07_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4b07_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4b07_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l188_c13_4b07_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_0f73_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_0f73_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_0f73_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l189_c13_0f73_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_2fbe_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_2fbe_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_2fbe_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l190_c13_2fbe_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_d781_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_d781_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_d781_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l191_c13_d781_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_38d1_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_38d1_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_c_l199_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_38d1_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_38d1_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_c_l199_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_237c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_237c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l204_c57_237c_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l204_c26_461e_return_output : unsigned(16 downto 0);
 variable VAR_adjusted_write_address_uxn_c_l205_c2_5138 : unsigned(16 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l205_c27_b44d_return_output : unsigned(15 downto 0);
 variable VAR_adjusted_write_address_uxn_c_l206_c2_f0bf : unsigned(16 downto 0);
 variable VAR_uint17_15_0_uxn_c_l206_c42_9429_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l206_c27_2595_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_f850_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_f850_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l207_c68_f850_return_output : unsigned(0 downto 0);
 variable VAR_uint17_uint1_16_uxn_c_l207_c27_2a00_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_9c22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_9c22_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_9c22_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l209_c21_9c22_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_cfd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_cfd1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_cfd1_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l210_c22_cfd1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_3d4d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l211_c6_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_0c43_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_0c43_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_0c43_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l212_c6_0c43_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_read_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_write_address : unsigned(16 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_de44_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_de44_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_de44_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l220_c3_de44_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_029a_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_029a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l221_c22_029a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l217_c19_3275_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_read_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_write_address : unsigned(16 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_write_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_5051_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_5051_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_5051_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l227_c3_5051_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_2380_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_637f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_637f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l228_c22_637f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_2380_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l228_c3_2380_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l224_c19_c287_return_output : unsigned(1 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_read_address : unsigned(12 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_address : unsigned(12 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_value : unsigned(23 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_uxn_c_l231_c21_9a08_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_d7dc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_d7dc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_d7dc_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l238_c19_d7dc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_1ac0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_1ac0_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_1ac0_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_9901_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_9901_iftrue : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_9901_iffalse : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_c_l240_c50_9901_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l240_c19_1ac0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_1717_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_1717_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_1717_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l241_c25_1717_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_74b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_74b4_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_74b4_iffalse : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l242_c17_74b4_return_output : unsigned(1 downto 0);
 variable VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_9364_return_output : draw_command_t;
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_31a9_return_output : unsigned(0 downto 0);
 variable VAR_uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372_return_output : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8_return_output : unsigned(1 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_9e41_return_output : gpu_step_result_t;
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
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l159_c18_c63b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l241_c25_1717_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l159_c18_c63b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l182_c16_dcbd_iftrue := to_unsigned(2, 2);
     VAR_queue_phase_uxn_c_l169_c3_219c := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue := VAR_queue_phase_uxn_c_l169_c3_219c;
     VAR_queue_phase_uxn_c_l177_c3_9807 := resize(to_unsigned(0, 1), 2);
     VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue := VAR_queue_phase_uxn_c_l177_c3_9807;
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l240_c19_1ac0_iftrue := resize(to_unsigned(0, 1), 17);
     VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_right := to_unsigned(61439, 16);
     VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_right := to_unsigned(2, 2);
     VAR_MUX_uxn_c_l158_c17_ed20_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l188_c13_4b07_iffalse := to_unsigned(239, 8);
     VAR_MUX_uxn_c_l191_c13_d781_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l210_c22_cfd1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_right := to_unsigned(61439, 16);
     VAR_MUX_uxn_c_l209_c21_9c22_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l189_c13_0f73_iffalse := to_unsigned(255, 8);
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_right := to_unsigned(1, 1);
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l209_c21_9c22_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l210_c22_cfd1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l238_c19_d7dc_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l241_c25_1717_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l190_c13_2fbe_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l158_c17_ed20_iftrue := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse := current_queue_item;
     VAR_BIN_OP_AND_uxn_c_l204_c57_237c_right := VAR_enable_buffer_swap;
     VAR_BIN_OP_AND_uxn_c_l207_c68_f850_right := VAR_enable_buffer_swap;
     VAR_fill_color_MUX_uxn_c_l185_c2_1957_iffalse := fill_color;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iffalse := fill_layer;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iffalse := fill_x0;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iffalse := fill_x1;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iffalse := fill_y0;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iffalse := fill_y1;
     VAR_MUX_uxn_c_l240_c50_9901_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_left := is_buffer_swapped;
     VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_expr := is_fill_active;
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse := is_fill_active;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse := is_fill_left;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse := is_fill_top;
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_enable := VAR_is_vram_write;
     VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_cond := VAR_is_vram_write;
     REG_VAR_queue_write_enable := VAR_is_vram_write;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond := VAR_is_vram_write;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_cond := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_left := pixel_counter;
     VAR_MUX_uxn_c_l240_c50_9901_iffalse := pixel_counter;
     VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_left := queue_phase;
     VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse := queue_phase;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_left := queue_read_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_left := queue_read_ptr;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse := queue_read_ptr;
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_right := queue_write_ptr;
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_left := queue_write_ptr;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse := queue_write_ptr;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse := queue_write_value;
     VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_right := VAR_swap_buffers;
     VAR_x_MUX_uxn_c_l199_c9_38d1_iffalse := x;
     VAR_y_MUX_uxn_c_l199_c9_38d1_iffalse := y;
     -- BIN_OP_EQ[uxn_c_l158_c17_ec1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c17_ec1d_left <= VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_left;
     BIN_OP_EQ_uxn_c_l158_c17_ec1d_right <= VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output := BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output;

     -- uint24_18_18[uxn_c_l164_c33_6c44] LATENCY=0
     VAR_uint24_18_18_uxn_c_l164_c33_6c44_return_output := uint24_18_18(
     queue_read_value);

     -- uint24_uint16_0[uxn_c_l174_c23_9e5d] LATENCY=0
     VAR_uint24_uint16_0_uxn_c_l174_c23_9e5d_return_output := uint24_uint16_0(
     resize(to_unsigned(0, 1), 24),
     VAR_vram_address);

     -- uint24_20_20[uxn_c_l166_c32_9e99] LATENCY=0
     VAR_uint24_20_20_uxn_c_l166_c32_9e99_return_output := uint24_20_20(
     queue_read_value);

     -- uint24_15_0[uxn_c_l162_c37_39db] LATENCY=0
     VAR_uint24_15_0_uxn_c_l162_c37_39db_return_output := uint24_15_0(
     queue_read_value);

     -- uint24_17_16[uxn_c_l163_c30_2215] LATENCY=0
     VAR_uint24_17_16_uxn_c_l163_c30_2215_return_output := uint24_17_16(
     queue_read_value);

     -- BIN_OP_PLUS[uxn_c_l178_c3_6db3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l178_c3_6db3_left <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_left;
     BIN_OP_PLUS_uxn_c_l178_c3_6db3_right <= VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output := BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output;

     -- BIN_OP_PLUS[uxn_c_l240_c76_c201] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l240_c76_c201_left <= VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_left;
     BIN_OP_PLUS_uxn_c_l240_c76_c201_right <= VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output := BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output;

     -- uint8_4_0[uxn_c_l175_c58_e621] LATENCY=0
     VAR_uint8_4_0_uxn_c_l175_c58_e621_return_output := uint8_4_0(
     VAR_vram_value);

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d[uxn_c_l161_c7_12ed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_12ed_return_output := current_queue_item.is_valid;

     -- BIN_OP_PLUS[uxn_c_l170_c3_f099] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l170_c3_f099_left <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_left;
     BIN_OP_PLUS_uxn_c_l170_c3_f099_right <= VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output := BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output;

     -- uint24_19_19[uxn_c_l165_c34_7abb] LATENCY=0
     VAR_uint24_19_19_uxn_c_l165_c34_7abb_return_output := uint24_19_19(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l159_c18_92e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c18_92e5_left <= VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_left;
     BIN_OP_EQ_uxn_c_l159_c18_92e5_right <= VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output := BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output;

     -- BIN_OP_XOR[uxn_c_l157_c2_fe62] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l157_c2_fe62_left <= VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_left;
     BIN_OP_XOR_uxn_c_l157_c2_fe62_right <= VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output := BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output;

     -- UNARY_OP_NOT[uxn_c_l185_c66_4957] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l185_c66_4957_expr <= VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output := UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output;

     -- uint24_21_21[uxn_c_l167_c30_3ec1] LATENCY=0
     VAR_uint24_21_21_uxn_c_l167_c30_3ec1_return_output := uint24_21_21(
     queue_read_value);

     -- BIN_OP_EQ[uxn_c_l240_c19_09cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l240_c19_09cd_left <= VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_left;
     BIN_OP_EQ_uxn_c_l240_c19_09cd_right <= VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output := BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l158_c17_ed20_cond := VAR_BIN_OP_EQ_uxn_c_l158_c17_ec1d_return_output;
     VAR_MUX_uxn_c_l159_c18_c63b_cond := VAR_BIN_OP_EQ_uxn_c_l159_c18_92e5_return_output;
     VAR_MUX_uxn_c_l240_c19_1ac0_cond := VAR_BIN_OP_EQ_uxn_c_l240_c19_09cd_return_output;
     VAR_queue_read_ptr_uxn_c_l170_c3_d988 := resize(VAR_BIN_OP_PLUS_uxn_c_l170_c3_f099_return_output, 13);
     VAR_queue_write_ptr_uxn_c_l178_c3_a55e := resize(VAR_BIN_OP_PLUS_uxn_c_l178_c3_6db3_return_output, 13);
     VAR_MUX_uxn_c_l240_c50_9901_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l240_c76_c201_return_output, 17);
     VAR_BIN_OP_AND_uxn_c_l204_c57_237c_left := VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr := VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output;
     REG_VAR_is_buffer_swapped := VAR_BIN_OP_XOR_uxn_c_l157_c2_fe62_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l161_c7_12ed_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_right := VAR_UNARY_OP_NOT_uxn_c_l185_c66_4957_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue := VAR_queue_read_ptr_uxn_c_l170_c3_d988;
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue := VAR_queue_write_ptr_uxn_c_l178_c3_a55e;
     -- BIN_OP_AND[uxn_c_l204_c57_237c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l204_c57_237c_left <= VAR_BIN_OP_AND_uxn_c_l204_c57_237c_left;
     BIN_OP_AND_uxn_c_l204_c57_237c_right <= VAR_BIN_OP_AND_uxn_c_l204_c57_237c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l204_c57_237c_return_output := BIN_OP_AND_uxn_c_l204_c57_237c_return_output;

     -- queue_write_ptr_MUX[uxn_c_l173_c2_ccde] LATENCY=0
     -- Inputs
     queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_cond;
     queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iftrue;
     queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse <= VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_iffalse;
     -- Outputs
     VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output := queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output;

     -- uint24_uint5_16[uxn_c_l175_c23_e3e0] LATENCY=0
     VAR_uint24_uint5_16_uxn_c_l175_c23_e3e0_return_output := uint24_uint5_16(
     VAR_uint24_uint16_0_uxn_c_l174_c23_9e5d_return_output,
     VAR_uint8_4_0_uxn_c_l175_c58_e621_return_output);

     -- MUX[uxn_c_l240_c50_9901] LATENCY=0
     -- Inputs
     MUX_uxn_c_l240_c50_9901_cond <= VAR_MUX_uxn_c_l240_c50_9901_cond;
     MUX_uxn_c_l240_c50_9901_iftrue <= VAR_MUX_uxn_c_l240_c50_9901_iftrue;
     MUX_uxn_c_l240_c50_9901_iffalse <= VAR_MUX_uxn_c_l240_c50_9901_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l240_c50_9901_return_output := MUX_uxn_c_l240_c50_9901_return_output;

     -- MUX[uxn_c_l158_c17_ed20] LATENCY=0
     -- Inputs
     MUX_uxn_c_l158_c17_ed20_cond <= VAR_MUX_uxn_c_l158_c17_ed20_cond;
     MUX_uxn_c_l158_c17_ed20_iftrue <= VAR_MUX_uxn_c_l158_c17_ed20_iftrue;
     MUX_uxn_c_l158_c17_ed20_iffalse <= VAR_MUX_uxn_c_l158_c17_ed20_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l158_c17_ed20_return_output := MUX_uxn_c_l158_c17_ed20_return_output;

     -- UNARY_OP_NOT[uxn_c_l207_c68_f56e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr <= VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output := UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output;

     -- MUX[uxn_c_l159_c18_c63b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l159_c18_c63b_cond <= VAR_MUX_uxn_c_l159_c18_c63b_cond;
     MUX_uxn_c_l159_c18_c63b_iftrue <= VAR_MUX_uxn_c_l159_c18_c63b_iftrue;
     MUX_uxn_c_l159_c18_c63b_iffalse <= VAR_MUX_uxn_c_l159_c18_c63b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l159_c18_c63b_return_output := MUX_uxn_c_l159_c18_c63b_return_output;

     -- current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099[uxn_c_l161_c2_4df2] LATENCY=0
     VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4df2_return_output := CONST_REF_RD_draw_command_t_draw_command_t_e099(
     VAR_uint24_15_0_uxn_c_l162_c37_39db_return_output,
     VAR_uint24_17_16_uxn_c_l163_c30_2215_return_output,
     VAR_uint24_18_18_uxn_c_l164_c33_6c44_return_output,
     VAR_uint24_19_19_uxn_c_l165_c34_7abb_return_output,
     VAR_uint24_20_20_uxn_c_l166_c32_9e99_return_output,
     VAR_uint24_21_21_uxn_c_l167_c30_3ec1_return_output,
     to_unsigned(1, 1));

     -- UNARY_OP_NOT[uxn_c_l161_c7_890c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c7_890c_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output := UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr := VAR_MUX_uxn_c_l158_c17_ed20_return_output;
     REG_VAR_is_caught_up := VAR_MUX_uxn_c_l158_c17_ed20_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_c403_right := VAR_MUX_uxn_c_l159_c18_c63b_return_output;
     REG_VAR_is_read_ready := VAR_MUX_uxn_c_l159_c18_c63b_return_output;
     VAR_MUX_uxn_c_l240_c19_1ac0_iffalse := VAR_MUX_uxn_c_l240_c50_9901_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_left := VAR_UNARY_OP_NOT_uxn_c_l161_c7_890c_return_output;
     VAR_BIN_OP_AND_uxn_c_l207_c68_f850_left := VAR_UNARY_OP_NOT_uxn_c_l207_c68_f56e_return_output;
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue := VAR_current_queue_item_TRUE_INPUT_MUX_CONST_REF_RD_draw_command_t_draw_command_t_e099_uxn_c_l161_c2_4df2_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_address := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output;
     REG_VAR_queue_write_ptr := VAR_queue_write_ptr_MUX_uxn_c_l173_c2_ccde_return_output;
     -- BIN_OP_AND[uxn_c_l207_c68_f850] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l207_c68_f850_left <= VAR_BIN_OP_AND_uxn_c_l207_c68_f850_left;
     BIN_OP_AND_uxn_c_l207_c68_f850_right <= VAR_BIN_OP_AND_uxn_c_l207_c68_f850_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l207_c68_f850_return_output := BIN_OP_AND_uxn_c_l207_c68_f850_return_output;

     -- MUX[uxn_c_l240_c19_1ac0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l240_c19_1ac0_cond <= VAR_MUX_uxn_c_l240_c19_1ac0_cond;
     MUX_uxn_c_l240_c19_1ac0_iftrue <= VAR_MUX_uxn_c_l240_c19_1ac0_iftrue;
     MUX_uxn_c_l240_c19_1ac0_iffalse <= VAR_MUX_uxn_c_l240_c19_1ac0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l240_c19_1ac0_return_output := MUX_uxn_c_l240_c19_1ac0_return_output;

     -- uint17_uint1_16[uxn_c_l204_c26_461e] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l204_c26_461e_return_output := uint17_uint1_16(
     pixel_counter,
     VAR_BIN_OP_AND_uxn_c_l204_c57_237c_return_output);

     -- UNARY_OP_NOT[uxn_c_l161_c38_c97e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr <= VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output := UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output;

     -- uint24_uint1_21[uxn_c_l176_c23_5be8] LATENCY=0
     VAR_uint24_uint1_21_uxn_c_l176_c23_5be8_return_output := uint24_uint1_21(
     VAR_uint24_uint5_16_uxn_c_l175_c23_e3e0_return_output,
     VAR_vram_write_layer);

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_left := VAR_MUX_uxn_c_l240_c19_1ac0_return_output;
     REG_VAR_pixel_counter := VAR_MUX_uxn_c_l240_c19_1ac0_return_output;
     VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_right := VAR_UNARY_OP_NOT_uxn_c_l161_c38_c97e_return_output;
     REG_VAR_adjusted_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_461e_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_3275_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_461e_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_c287_read_address := VAR_uint17_uint1_16_uxn_c_l204_c26_461e_return_output;
     VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue := VAR_uint24_uint1_21_uxn_c_l176_c23_5be8_return_output;
     -- BIN_OP_EQ[uxn_c_l241_c25_d793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l241_c25_d793_left <= VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_left;
     BIN_OP_EQ_uxn_c_l241_c25_d793_right <= VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_return_output := BIN_OP_EQ_uxn_c_l241_c25_d793_return_output;

     -- queue_write_value_MUX[uxn_c_l173_c2_ccde] LATENCY=0
     -- Inputs
     queue_write_value_MUX_uxn_c_l173_c2_ccde_cond <= VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_cond;
     queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue <= VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iftrue;
     queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse <= VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_iffalse;
     -- Outputs
     VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output := queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_29b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_29b9_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_left;
     BIN_OP_AND_uxn_c_l161_c7_29b9_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_return_output := BIN_OP_AND_uxn_c_l161_c7_29b9_return_output;

     -- Submodule level 4
     VAR_BIN_OP_AND_uxn_c_l161_c7_c403_left := VAR_BIN_OP_AND_uxn_c_l161_c7_29b9_return_output;
     VAR_MUX_uxn_c_l241_c25_1717_cond := VAR_BIN_OP_EQ_uxn_c_l241_c25_d793_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output;
     REG_VAR_queue_write_value := VAR_queue_write_value_MUX_uxn_c_l173_c2_ccde_return_output;
     -- MUX[uxn_c_l241_c25_1717] LATENCY=0
     -- Inputs
     MUX_uxn_c_l241_c25_1717_cond <= VAR_MUX_uxn_c_l241_c25_1717_cond;
     MUX_uxn_c_l241_c25_1717_iftrue <= VAR_MUX_uxn_c_l241_c25_1717_iftrue;
     MUX_uxn_c_l241_c25_1717_iffalse <= VAR_MUX_uxn_c_l241_c25_1717_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l241_c25_1717_return_output := MUX_uxn_c_l241_c25_1717_return_output;

     -- BIN_OP_AND[uxn_c_l161_c7_c403] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l161_c7_c403_left <= VAR_BIN_OP_AND_uxn_c_l161_c7_c403_left;
     BIN_OP_AND_uxn_c_l161_c7_c403_right <= VAR_BIN_OP_AND_uxn_c_l161_c7_c403_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l161_c7_c403_return_output := BIN_OP_AND_uxn_c_l161_c7_c403_return_output;

     -- Submodule level 5
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_c403_return_output;
     VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_c403_return_output;
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond := VAR_BIN_OP_AND_uxn_c_l161_c7_c403_return_output;
     -- queue_phase_MUX[uxn_c_l161_c2_4df2] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l161_c2_4df2_cond <= VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_cond;
     queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue <= VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iftrue;
     queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse <= VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_return_output := queue_phase_MUX_uxn_c_l161_c2_4df2_return_output;

     -- queue_read_ptr_MUX[uxn_c_l161_c2_4df2] LATENCY=0
     -- Inputs
     queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_cond;
     queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iftrue;
     queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse <= VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_iffalse;
     -- Outputs
     VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output := queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output;

     -- current_queue_item_MUX[uxn_c_l161_c2_4df2] LATENCY=0
     -- Inputs
     current_queue_item_MUX_uxn_c_l161_c2_4df2_cond <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_cond;
     current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iftrue;
     current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse <= VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_iffalse;
     -- Outputs
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output := current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output;

     -- Submodule level 6
     VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse := VAR_queue_phase_MUX_uxn_c_l161_c2_4df2_return_output;
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_read_address := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output;
     REG_VAR_queue_read_ptr := VAR_queue_read_ptr_MUX_uxn_c_l161_c2_4df2_return_output;
     -- CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.layer;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d[uxn_c_l186_c17_21e5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_21e5_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.fill_top;

     -- CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.color;

     -- draw_queue_update[uxn_c_l231_c21_9a08] LATENCY=0
     -- Clock enable
     draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE <= VAR_draw_queue_update_uxn_c_l231_c21_9a08_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_uxn_c_l231_c21_9a08_read_address <= VAR_draw_queue_update_uxn_c_l231_c21_9a08_read_address;
     draw_queue_update_uxn_c_l231_c21_9a08_write_address <= VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_address;
     draw_queue_update_uxn_c_l231_c21_9a08_write_value <= VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_value;
     draw_queue_update_uxn_c_l231_c21_9a08_write_enable <= VAR_draw_queue_update_uxn_c_l231_c21_9a08_write_enable;
     -- Outputs
     VAR_draw_queue_update_uxn_c_l231_c21_9a08_return_output := draw_queue_update_uxn_c_l231_c21_9a08_return_output;

     -- CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d[uxn_c_l187_c18_0b73] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_0b73_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.fill_left;

     -- queue_phase_MUX[uxn_c_l173_c2_ccde] LATENCY=0
     -- Inputs
     queue_phase_MUX_uxn_c_l173_c2_ccde_cond <= VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_cond;
     queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue <= VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iftrue;
     queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse <= VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_iffalse;
     -- Outputs
     VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_return_output := queue_phase_MUX_uxn_c_l173_c2_ccde_return_output;

     -- CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d[uxn_c_l183_c10_7261] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_7261_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_31a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_31a9_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.is_fill;

     -- CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c_return_output := VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output.is_valid;

     -- Submodule level 7
     REG_VAR_tmp16 := VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_7261_return_output;
     VAR_MUX_uxn_c_l189_c13_0f73_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_0b73_return_output;
     VAR_MUX_uxn_c_l191_c13_d781_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_0b73_return_output;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_left_d41d_uxn_c_l187_c18_0b73_return_output;
     VAR_MUX_uxn_c_l188_c13_4b07_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_21e5_return_output;
     VAR_MUX_uxn_c_l190_c13_2fbe_cond := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_21e5_return_output;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_fill_top_d41d_uxn_c_l186_c17_21e5_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_31a9_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_fill_d41d_uxn_c_l185_l199_DUPLICATE_31a9_return_output;
     VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c_return_output;
     VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_left := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_is_valid_d41d_uxn_c_l185_l199_l221_l228_DUPLICATE_bf2c_return_output;
     VAR_BIN_OP_AND_uxn_c_l228_c22_637f_right := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_expr := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8_return_output;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iftrue := VAR_CONST_REF_RD_uint1_t_draw_command_t_layer_d41d_uxn_c_l221_l228_l192_DUPLICATE_b9f8_return_output;
     VAR_MUX_uxn_c_l220_c3_de44_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8_return_output;
     VAR_MUX_uxn_c_l227_c3_5051_iffalse := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8_return_output;
     VAR_fill_color_MUX_uxn_c_l185_c2_1957_iftrue := VAR_CONST_REF_RD_uint2_t_draw_command_t_color_d41d_uxn_c_l227_l193_l220_DUPLICATE_7fc8_return_output;
     REG_VAR_queue_read_value := VAR_draw_queue_update_uxn_c_l231_c21_9a08_return_output;
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_left := VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_left := VAR_queue_phase_MUX_uxn_c_l173_c2_ccde_return_output;
     -- BIN_OP_AND[uxn_c_l185_c6_8fff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c6_8fff_left <= VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_left;
     BIN_OP_AND_uxn_c_l185_c6_8fff_right <= VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_return_output := BIN_OP_AND_uxn_c_l185_c6_8fff_return_output;

     -- uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372 LATENCY=0
     VAR_uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_7261_return_output);

     -- UNARY_OP_NOT[uxn_c_l199_c44_5788] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l199_c44_5788_expr <= VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output := UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output;

     -- UNARY_OP_NOT[uxn_c_l221_c71_f164] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l221_c71_f164_expr <= VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output := UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output;

     -- BIN_OP_EQ[uxn_c_l182_c16_e168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l182_c16_e168_left <= VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_left;
     BIN_OP_EQ_uxn_c_l182_c16_e168_right <= VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_return_output := BIN_OP_EQ_uxn_c_l182_c16_e168_return_output;

     -- BIN_OP_PLUS[uxn_c_l182_c39_7d93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l182_c39_7d93_left <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_left;
     BIN_OP_PLUS_uxn_c_l182_c39_7d93_right <= VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output := BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output;

     -- uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc LATENCY=0
     VAR_uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc_return_output := uint16_7_0(
     VAR_CONST_REF_RD_uint16_t_draw_command_t_vram_address_d41d_uxn_c_l183_c10_7261_return_output);

     -- Submodule level 8
     VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_left := VAR_BIN_OP_AND_uxn_c_l185_c6_8fff_return_output;
     VAR_MUX_uxn_c_l182_c16_dcbd_cond := VAR_BIN_OP_EQ_uxn_c_l182_c16_e168_return_output;
     VAR_MUX_uxn_c_l182_c16_dcbd_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l182_c39_7d93_return_output, 2);
     VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_right := VAR_UNARY_OP_NOT_uxn_c_l199_c44_5788_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c22_029a_right := VAR_UNARY_OP_NOT_uxn_c_l221_c71_f164_return_output;
     VAR_MUX_uxn_c_l188_c13_4b07_iftrue := VAR_uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372_return_output;
     VAR_MUX_uxn_c_l190_c13_2fbe_iffalse := VAR_uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372_return_output;
     VAR_y_MUX_uxn_c_l199_c9_38d1_iftrue := VAR_uint16_15_8_uxn_c_l188_l190_l200_DUPLICATE_0372_return_output;
     VAR_MUX_uxn_c_l189_c13_0f73_iftrue := VAR_uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc_return_output;
     VAR_MUX_uxn_c_l191_c13_d781_iffalse := VAR_uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc_return_output;
     VAR_x_MUX_uxn_c_l199_c9_38d1_iftrue := VAR_uint16_7_0_uxn_c_l191_l201_l189_DUPLICATE_aebc_return_output;
     -- MUX[uxn_c_l188_c13_4b07] LATENCY=0
     -- Inputs
     MUX_uxn_c_l188_c13_4b07_cond <= VAR_MUX_uxn_c_l188_c13_4b07_cond;
     MUX_uxn_c_l188_c13_4b07_iftrue <= VAR_MUX_uxn_c_l188_c13_4b07_iftrue;
     MUX_uxn_c_l188_c13_4b07_iffalse <= VAR_MUX_uxn_c_l188_c13_4b07_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l188_c13_4b07_return_output := MUX_uxn_c_l188_c13_4b07_return_output;

     -- MUX[uxn_c_l182_c16_dcbd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l182_c16_dcbd_cond <= VAR_MUX_uxn_c_l182_c16_dcbd_cond;
     MUX_uxn_c_l182_c16_dcbd_iftrue <= VAR_MUX_uxn_c_l182_c16_dcbd_iftrue;
     MUX_uxn_c_l182_c16_dcbd_iffalse <= VAR_MUX_uxn_c_l182_c16_dcbd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l182_c16_dcbd_return_output := MUX_uxn_c_l182_c16_dcbd_return_output;

     -- MUX[uxn_c_l190_c13_2fbe] LATENCY=0
     -- Inputs
     MUX_uxn_c_l190_c13_2fbe_cond <= VAR_MUX_uxn_c_l190_c13_2fbe_cond;
     MUX_uxn_c_l190_c13_2fbe_iftrue <= VAR_MUX_uxn_c_l190_c13_2fbe_iftrue;
     MUX_uxn_c_l190_c13_2fbe_iffalse <= VAR_MUX_uxn_c_l190_c13_2fbe_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l190_c13_2fbe_return_output := MUX_uxn_c_l190_c13_2fbe_return_output;

     -- BIN_OP_AND[uxn_c_l185_c6_a46f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c6_a46f_left <= VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_left;
     BIN_OP_AND_uxn_c_l185_c6_a46f_right <= VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output := BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;

     -- MUX[uxn_c_l189_c13_0f73] LATENCY=0
     -- Inputs
     MUX_uxn_c_l189_c13_0f73_cond <= VAR_MUX_uxn_c_l189_c13_0f73_cond;
     MUX_uxn_c_l189_c13_0f73_iftrue <= VAR_MUX_uxn_c_l189_c13_0f73_iftrue;
     MUX_uxn_c_l189_c13_0f73_iffalse <= VAR_MUX_uxn_c_l189_c13_0f73_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l189_c13_0f73_return_output := MUX_uxn_c_l189_c13_0f73_return_output;

     -- BIN_OP_AND[uxn_c_l199_c13_b42a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l199_c13_b42a_left <= VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_left;
     BIN_OP_AND_uxn_c_l199_c13_b42a_right <= VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_return_output := BIN_OP_AND_uxn_c_l199_c13_b42a_return_output;

     -- MUX[uxn_c_l191_c13_d781] LATENCY=0
     -- Inputs
     MUX_uxn_c_l191_c13_d781_cond <= VAR_MUX_uxn_c_l191_c13_d781_cond;
     MUX_uxn_c_l191_c13_d781_iftrue <= VAR_MUX_uxn_c_l191_c13_d781_iftrue;
     MUX_uxn_c_l191_c13_d781_iffalse <= VAR_MUX_uxn_c_l191_c13_d781_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l191_c13_d781_return_output := MUX_uxn_c_l191_c13_d781_return_output;

     -- Submodule level 9
     VAR_fill_color_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_fill_layer_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1957_cond := VAR_BIN_OP_AND_uxn_c_l185_c6_a46f_return_output;
     VAR_x_MUX_uxn_c_l199_c9_38d1_cond := VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_return_output;
     VAR_y_MUX_uxn_c_l199_c9_38d1_cond := VAR_BIN_OP_AND_uxn_c_l199_c13_b42a_return_output;
     REG_VAR_queue_phase := VAR_MUX_uxn_c_l182_c16_dcbd_return_output;
     VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l188_c13_4b07_return_output;
     VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l189_c13_0f73_return_output;
     VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l190_c13_2fbe_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l190_c13_2fbe_return_output;
     VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l191_c13_d781_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1957_iftrue := VAR_MUX_uxn_c_l191_c13_d781_return_output;
     -- fill_layer_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_layer_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_layer_MUX_uxn_c_l185_c2_1957_cond;
     fill_layer_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_layer_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_layer_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_layer_MUX_uxn_c_l185_c2_1957_return_output := fill_layer_MUX_uxn_c_l185_c2_1957_return_output;

     -- fill_y0_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_y0_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_y0_MUX_uxn_c_l185_c2_1957_cond;
     fill_y0_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_y0_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_y0_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_y0_MUX_uxn_c_l185_c2_1957_return_output := fill_y0_MUX_uxn_c_l185_c2_1957_return_output;

     -- is_fill_active_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     is_fill_active_MUX_uxn_c_l185_c2_1957_cond <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_cond;
     is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iftrue;
     is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output := is_fill_active_MUX_uxn_c_l185_c2_1957_return_output;

     -- is_fill_top_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     is_fill_top_MUX_uxn_c_l185_c2_1957_cond <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_cond;
     is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iftrue;
     is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_return_output := is_fill_top_MUX_uxn_c_l185_c2_1957_return_output;

     -- fill_x1_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_x1_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_x1_MUX_uxn_c_l185_c2_1957_cond;
     fill_x1_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_x1_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_x1_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_x1_MUX_uxn_c_l185_c2_1957_return_output := fill_x1_MUX_uxn_c_l185_c2_1957_return_output;

     -- fill_y1_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_y1_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_y1_MUX_uxn_c_l185_c2_1957_cond;
     fill_y1_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_y1_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_y1_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_y1_MUX_uxn_c_l185_c2_1957_return_output := fill_y1_MUX_uxn_c_l185_c2_1957_return_output;

     -- is_fill_left_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     is_fill_left_MUX_uxn_c_l185_c2_1957_cond <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_cond;
     is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iftrue;
     is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_return_output := is_fill_left_MUX_uxn_c_l185_c2_1957_return_output;

     -- y_MUX[uxn_c_l199_c9_38d1] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l199_c9_38d1_cond <= VAR_y_MUX_uxn_c_l199_c9_38d1_cond;
     y_MUX_uxn_c_l199_c9_38d1_iftrue <= VAR_y_MUX_uxn_c_l199_c9_38d1_iftrue;
     y_MUX_uxn_c_l199_c9_38d1_iffalse <= VAR_y_MUX_uxn_c_l199_c9_38d1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l199_c9_38d1_return_output := y_MUX_uxn_c_l199_c9_38d1_return_output;

     -- fill_color_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_color_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_color_MUX_uxn_c_l185_c2_1957_cond;
     fill_color_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_color_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_color_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_color_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_color_MUX_uxn_c_l185_c2_1957_return_output := fill_color_MUX_uxn_c_l185_c2_1957_return_output;

     -- x_MUX[uxn_c_l199_c9_38d1] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l199_c9_38d1_cond <= VAR_x_MUX_uxn_c_l199_c9_38d1_cond;
     x_MUX_uxn_c_l199_c9_38d1_iftrue <= VAR_x_MUX_uxn_c_l199_c9_38d1_iftrue;
     x_MUX_uxn_c_l199_c9_38d1_iffalse <= VAR_x_MUX_uxn_c_l199_c9_38d1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l199_c9_38d1_return_output := x_MUX_uxn_c_l199_c9_38d1_return_output;

     -- fill_x0_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     fill_x0_MUX_uxn_c_l185_c2_1957_cond <= VAR_fill_x0_MUX_uxn_c_l185_c2_1957_cond;
     fill_x0_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iftrue;
     fill_x0_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_fill_x0_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_fill_x0_MUX_uxn_c_l185_c2_1957_return_output := fill_x0_MUX_uxn_c_l185_c2_1957_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l220_c3_de44_iftrue := VAR_fill_color_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_MUX_uxn_c_l227_c3_5051_iftrue := VAR_fill_color_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_color := VAR_fill_color_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_right := VAR_fill_layer_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr := VAR_fill_layer_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_layer := VAR_fill_layer_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_MUX_uxn_c_l212_c6_0c43_iftrue := VAR_fill_x0_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_x0 := VAR_fill_x0_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_right := VAR_fill_x1_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_x1 := VAR_fill_x1_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_y0 := VAR_fill_y0_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_right := VAR_fill_y1_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_fill_y1 := VAR_fill_y1_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_left := VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_left := VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_MUX_uxn_c_l238_c19_d7dc_cond := VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr := VAR_is_fill_active_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_is_fill_left := VAR_is_fill_left_MUX_uxn_c_l185_c2_1957_return_output;
     REG_VAR_is_fill_top := VAR_is_fill_top_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_x_MUX_uxn_c_l185_c2_1957_iffalse := VAR_x_MUX_uxn_c_l199_c9_38d1_return_output;
     VAR_y_MUX_uxn_c_l185_c2_1957_iffalse := VAR_y_MUX_uxn_c_l199_c9_38d1_return_output;
     -- x_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     x_MUX_uxn_c_l185_c2_1957_cond <= VAR_x_MUX_uxn_c_l185_c2_1957_cond;
     x_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_x_MUX_uxn_c_l185_c2_1957_iftrue;
     x_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_x_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_c_l185_c2_1957_return_output := x_MUX_uxn_c_l185_c2_1957_return_output;

     -- UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr <= VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output := UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output;

     -- UNARY_OP_NOT[uxn_c_l214_c38_6f78] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr <= VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output := UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output;

     -- y_MUX[uxn_c_l185_c2_1957] LATENCY=0
     -- Inputs
     y_MUX_uxn_c_l185_c2_1957_cond <= VAR_y_MUX_uxn_c_l185_c2_1957_cond;
     y_MUX_uxn_c_l185_c2_1957_iftrue <= VAR_y_MUX_uxn_c_l185_c2_1957_iftrue;
     y_MUX_uxn_c_l185_c2_1957_iffalse <= VAR_y_MUX_uxn_c_l185_c2_1957_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_c_l185_c2_1957_return_output := y_MUX_uxn_c_l185_c2_1957_return_output;

     -- BIN_OP_AND[uxn_c_l215_c19_e6b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l215_c19_e6b2_left <= VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_left;
     BIN_OP_AND_uxn_c_l215_c19_e6b2_right <= VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output := BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output;

     -- Submodule level 11
     VAR_BIN_OP_OR_uxn_c_l228_c3_2380_left := VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output;
     VAR_MUX_uxn_c_l227_c3_5051_cond := VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output;
     REG_VAR_is_fill_pixel1 := VAR_BIN_OP_AND_uxn_c_l215_c19_e6b2_return_output;
     VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_right := VAR_UNARY_OP_NOT_uxn_c_l214_c38_6f78_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left := VAR_UNARY_OP_NOT_uint1_t_uxn_c_l228_l221_DUPLICATE_719e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_left := VAR_x_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_left := VAR_x_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_left := VAR_y_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left := VAR_y_MUX_uxn_c_l185_c2_1957_return_output;
     VAR_MUX_uxn_c_l211_c6_3d4d_iffalse := VAR_y_MUX_uxn_c_l185_c2_1957_return_output;
     -- BIN_OP_AND[uxn_c_l214_c19_47bc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l214_c19_47bc_left <= VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_left;
     BIN_OP_AND_uxn_c_l214_c19_47bc_right <= VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_return_output := BIN_OP_AND_uxn_c_l214_c19_47bc_return_output;

     -- BIN_OP_EQ[uxn_c_l210_c22_be50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l210_c22_be50_left <= VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_left;
     BIN_OP_EQ_uxn_c_l210_c22_be50_right <= VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_return_output := BIN_OP_EQ_uxn_c_l210_c22_be50_return_output;

     -- BIN_OP_PLUS[uxn_c_l212_c34_3326] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l212_c34_3326_left <= VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_left;
     BIN_OP_PLUS_uxn_c_l212_c34_3326_right <= VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output := BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output;

     -- BIN_OP_EQ[uxn_c_l209_c21_2206] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l209_c21_2206_left <= VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_left;
     BIN_OP_EQ_uxn_c_l209_c21_2206_right <= VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_return_output := BIN_OP_EQ_uxn_c_l209_c21_2206_return_output;

     -- BIN_OP_PLUS[uxn_c_l211_c25_1a1b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left <= VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_left;
     BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right <= VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output := BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output;

     -- uint16_uint8_8[uxn_c_l205_c27_b44d] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l205_c27_b44d_return_output := uint16_uint8_8(
     resize(to_unsigned(0, 1), 16),
     VAR_y_MUX_uxn_c_l185_c2_1957_return_output);

     -- MUX[uxn_c_l227_c3_5051] LATENCY=0
     -- Inputs
     MUX_uxn_c_l227_c3_5051_cond <= VAR_MUX_uxn_c_l227_c3_5051_cond;
     MUX_uxn_c_l227_c3_5051_iftrue <= VAR_MUX_uxn_c_l227_c3_5051_iftrue;
     MUX_uxn_c_l227_c3_5051_iffalse <= VAR_MUX_uxn_c_l227_c3_5051_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l227_c3_5051_return_output := MUX_uxn_c_l227_c3_5051_return_output;

     -- Submodule level 12
     VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_left := VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_return_output;
     VAR_MUX_uxn_c_l220_c3_de44_cond := VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_return_output;
     REG_VAR_is_fill_pixel0 := VAR_BIN_OP_AND_uxn_c_l214_c19_47bc_return_output;
     VAR_BIN_OP_AND_uxn_c_l221_c22_029a_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output;
     VAR_BIN_OP_AND_uxn_c_l228_c22_637f_left := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_c_l221_l228_DUPLICATE_1f64_return_output;
     VAR_MUX_uxn_c_l209_c21_9c22_cond := VAR_BIN_OP_EQ_uxn_c_l209_c21_2206_return_output;
     VAR_MUX_uxn_c_l210_c22_cfd1_cond := VAR_BIN_OP_EQ_uxn_c_l210_c22_be50_return_output;
     VAR_MUX_uxn_c_l211_c6_3d4d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l211_c25_1a1b_return_output, 8);
     VAR_MUX_uxn_c_l212_c6_0c43_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l212_c34_3326_return_output, 8);
     VAR_fg_vram_update_uxn_c_l224_c19_c287_write_value := VAR_MUX_uxn_c_l227_c3_5051_return_output;
     VAR_adjusted_write_address_uxn_c_l205_c2_5138 := resize(VAR_uint16_uint8_8_uxn_c_l205_c27_b44d_return_output, 17);
     -- MUX[uxn_c_l220_c3_de44] LATENCY=0
     -- Inputs
     MUX_uxn_c_l220_c3_de44_cond <= VAR_MUX_uxn_c_l220_c3_de44_cond;
     MUX_uxn_c_l220_c3_de44_iftrue <= VAR_MUX_uxn_c_l220_c3_de44_iftrue;
     MUX_uxn_c_l220_c3_de44_iffalse <= VAR_MUX_uxn_c_l220_c3_de44_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l220_c3_de44_return_output := MUX_uxn_c_l220_c3_de44_return_output;

     -- BIN_OP_AND[uxn_c_l228_c22_637f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l228_c22_637f_left <= VAR_BIN_OP_AND_uxn_c_l228_c22_637f_left;
     BIN_OP_AND_uxn_c_l228_c22_637f_right <= VAR_BIN_OP_AND_uxn_c_l228_c22_637f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l228_c22_637f_return_output := BIN_OP_AND_uxn_c_l228_c22_637f_return_output;

     -- MUX[uxn_c_l210_c22_cfd1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l210_c22_cfd1_cond <= VAR_MUX_uxn_c_l210_c22_cfd1_cond;
     MUX_uxn_c_l210_c22_cfd1_iftrue <= VAR_MUX_uxn_c_l210_c22_cfd1_iftrue;
     MUX_uxn_c_l210_c22_cfd1_iffalse <= VAR_MUX_uxn_c_l210_c22_cfd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l210_c22_cfd1_return_output := MUX_uxn_c_l210_c22_cfd1_return_output;

     -- uint17_15_0[uxn_c_l206_c42_9429] LATENCY=0
     VAR_uint17_15_0_uxn_c_l206_c42_9429_return_output := uint17_15_0(
     VAR_adjusted_write_address_uxn_c_l205_c2_5138);

     -- MUX[uxn_c_l209_c21_9c22] LATENCY=0
     -- Inputs
     MUX_uxn_c_l209_c21_9c22_cond <= VAR_MUX_uxn_c_l209_c21_9c22_cond;
     MUX_uxn_c_l209_c21_9c22_iftrue <= VAR_MUX_uxn_c_l209_c21_9c22_iftrue;
     MUX_uxn_c_l209_c21_9c22_iffalse <= VAR_MUX_uxn_c_l209_c21_9c22_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l209_c21_9c22_return_output := MUX_uxn_c_l209_c21_9c22_return_output;

     -- BIN_OP_AND[uxn_c_l221_c22_029a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l221_c22_029a_left <= VAR_BIN_OP_AND_uxn_c_l221_c22_029a_left;
     BIN_OP_AND_uxn_c_l221_c22_029a_right <= VAR_BIN_OP_AND_uxn_c_l221_c22_029a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l221_c22_029a_return_output := BIN_OP_AND_uxn_c_l221_c22_029a_return_output;

     -- Submodule level 13
     VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_right := VAR_BIN_OP_AND_uxn_c_l221_c22_029a_return_output;
     VAR_BIN_OP_OR_uxn_c_l228_c3_2380_right := VAR_BIN_OP_AND_uxn_c_l228_c22_637f_return_output;
     VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_left := VAR_MUX_uxn_c_l209_c21_9c22_return_output;
     VAR_MUX_uxn_c_l211_c6_3d4d_cond := VAR_MUX_uxn_c_l209_c21_9c22_return_output;
     VAR_MUX_uxn_c_l212_c6_0c43_cond := VAR_MUX_uxn_c_l209_c21_9c22_return_output;
     REG_VAR_is_new_fill_row := VAR_MUX_uxn_c_l209_c21_9c22_return_output;
     VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_right := VAR_MUX_uxn_c_l210_c22_cfd1_return_output;
     REG_VAR_is_last_fill_col := VAR_MUX_uxn_c_l210_c22_cfd1_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_3275_write_value := VAR_MUX_uxn_c_l220_c3_de44_return_output;
     -- MUX[uxn_c_l212_c6_0c43] LATENCY=0
     -- Inputs
     MUX_uxn_c_l212_c6_0c43_cond <= VAR_MUX_uxn_c_l212_c6_0c43_cond;
     MUX_uxn_c_l212_c6_0c43_iftrue <= VAR_MUX_uxn_c_l212_c6_0c43_iftrue;
     MUX_uxn_c_l212_c6_0c43_iffalse <= VAR_MUX_uxn_c_l212_c6_0c43_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l212_c6_0c43_return_output := MUX_uxn_c_l212_c6_0c43_return_output;

     -- BIN_OP_OR[uxn_c_l221_c3_f47c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l221_c3_f47c_left <= VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_left;
     BIN_OP_OR_uxn_c_l221_c3_f47c_right <= VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_return_output := BIN_OP_OR_uxn_c_l221_c3_f47c_return_output;

     -- BIN_OP_AND[uxn_c_l238_c38_24ce] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l238_c38_24ce_left <= VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_left;
     BIN_OP_AND_uxn_c_l238_c38_24ce_right <= VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_return_output := BIN_OP_AND_uxn_c_l238_c38_24ce_return_output;

     -- MUX[uxn_c_l211_c6_3d4d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l211_c6_3d4d_cond <= VAR_MUX_uxn_c_l211_c6_3d4d_cond;
     MUX_uxn_c_l211_c6_3d4d_iftrue <= VAR_MUX_uxn_c_l211_c6_3d4d_iftrue;
     MUX_uxn_c_l211_c6_3d4d_iffalse <= VAR_MUX_uxn_c_l211_c6_3d4d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l211_c6_3d4d_return_output := MUX_uxn_c_l211_c6_3d4d_return_output;

     -- uint16_uint8_0[uxn_c_l206_c27_2595] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l206_c27_2595_return_output := uint16_uint8_0(
     VAR_uint17_15_0_uxn_c_l206_c42_9429_return_output,
     VAR_x_MUX_uxn_c_l185_c2_1957_return_output);

     -- BIN_OP_OR[uxn_c_l228_c3_2380] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l228_c3_2380_left <= VAR_BIN_OP_OR_uxn_c_l228_c3_2380_left;
     BIN_OP_OR_uxn_c_l228_c3_2380_right <= VAR_BIN_OP_OR_uxn_c_l228_c3_2380_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l228_c3_2380_return_output := BIN_OP_OR_uxn_c_l228_c3_2380_return_output;

     -- Submodule level 14
     VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr := VAR_BIN_OP_AND_uxn_c_l238_c38_24ce_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_3275_write_enable := VAR_BIN_OP_OR_uxn_c_l221_c3_f47c_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_c287_write_enable := VAR_BIN_OP_OR_uxn_c_l228_c3_2380_return_output;
     REG_VAR_y := VAR_MUX_uxn_c_l211_c6_3d4d_return_output;
     REG_VAR_x := VAR_MUX_uxn_c_l212_c6_0c43_return_output;
     VAR_adjusted_write_address_uxn_c_l206_c2_f0bf := resize(VAR_uint16_uint8_0_uxn_c_l206_c27_2595_return_output, 17);
     -- UNARY_OP_NOT[uxn_c_l238_c38_75fa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr <= VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output := UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output;

     -- uint17_uint1_16[uxn_c_l207_c27_2a00] LATENCY=0
     VAR_uint17_uint1_16_uxn_c_l207_c27_2a00_return_output := uint17_uint1_16(
     VAR_adjusted_write_address_uxn_c_l206_c2_f0bf,
     VAR_BIN_OP_AND_uxn_c_l207_c68_f850_return_output);

     -- Submodule level 15
     VAR_MUX_uxn_c_l238_c19_d7dc_iftrue := VAR_UNARY_OP_NOT_uxn_c_l238_c38_75fa_return_output;
     REG_VAR_adjusted_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_2a00_return_output;
     VAR_bg_vram_update_uxn_c_l217_c19_3275_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_2a00_return_output;
     VAR_fg_vram_update_uxn_c_l224_c19_c287_write_address := VAR_uint17_uint1_16_uxn_c_l207_c27_2a00_return_output;
     -- fg_vram_update[uxn_c_l224_c19_c287] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l224_c19_c287_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l224_c19_c287_read_address <= VAR_fg_vram_update_uxn_c_l224_c19_c287_read_address;
     fg_vram_update_uxn_c_l224_c19_c287_write_address <= VAR_fg_vram_update_uxn_c_l224_c19_c287_write_address;
     fg_vram_update_uxn_c_l224_c19_c287_write_value <= VAR_fg_vram_update_uxn_c_l224_c19_c287_write_value;
     fg_vram_update_uxn_c_l224_c19_c287_write_enable <= VAR_fg_vram_update_uxn_c_l224_c19_c287_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l224_c19_c287_return_output := fg_vram_update_uxn_c_l224_c19_c287_return_output;

     -- MUX[uxn_c_l238_c19_d7dc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l238_c19_d7dc_cond <= VAR_MUX_uxn_c_l238_c19_d7dc_cond;
     MUX_uxn_c_l238_c19_d7dc_iftrue <= VAR_MUX_uxn_c_l238_c19_d7dc_iftrue;
     MUX_uxn_c_l238_c19_d7dc_iffalse <= VAR_MUX_uxn_c_l238_c19_d7dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l238_c19_d7dc_return_output := MUX_uxn_c_l238_c19_d7dc_return_output;

     -- bg_vram_update[uxn_c_l217_c19_3275] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l217_c19_3275_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l217_c19_3275_read_address <= VAR_bg_vram_update_uxn_c_l217_c19_3275_read_address;
     bg_vram_update_uxn_c_l217_c19_3275_write_address <= VAR_bg_vram_update_uxn_c_l217_c19_3275_write_address;
     bg_vram_update_uxn_c_l217_c19_3275_write_value <= VAR_bg_vram_update_uxn_c_l217_c19_3275_write_value;
     bg_vram_update_uxn_c_l217_c19_3275_write_enable <= VAR_bg_vram_update_uxn_c_l217_c19_3275_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l217_c19_3275_return_output := bg_vram_update_uxn_c_l217_c19_3275_return_output;

     -- Submodule level 16
     REG_VAR_is_fill_active := VAR_MUX_uxn_c_l238_c19_d7dc_return_output;
     VAR_MUX_uxn_c_l242_c17_74b4_iftrue := VAR_bg_vram_update_uxn_c_l217_c19_3275_return_output;
     REG_VAR_bg_pixel_color := VAR_bg_vram_update_uxn_c_l217_c19_3275_return_output;
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_left := VAR_fg_vram_update_uxn_c_l224_c19_c287_return_output;
     VAR_MUX_uxn_c_l242_c17_74b4_iffalse := VAR_fg_vram_update_uxn_c_l224_c19_c287_return_output;
     REG_VAR_fg_pixel_color := VAR_fg_vram_update_uxn_c_l224_c19_c287_return_output;
     -- BIN_OP_EQ[uxn_c_l242_c17_3458] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l242_c17_3458_left <= VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_left;
     BIN_OP_EQ_uxn_c_l242_c17_3458_right <= VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_return_output := BIN_OP_EQ_uxn_c_l242_c17_3458_return_output;

     -- current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf[uxn_c_l136_c19_9364] LATENCY=0
     VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_9364_return_output := CONST_REF_RD_draw_command_t_draw_command_t_11bf(
     VAR_current_queue_item_MUX_uxn_c_l161_c2_4df2_return_output,
     VAR_MUX_uxn_c_l238_c19_d7dc_return_output);

     -- Submodule level 17
     VAR_MUX_uxn_c_l242_c17_74b4_cond := VAR_BIN_OP_EQ_uxn_c_l242_c17_3458_return_output;
     REG_VAR_current_queue_item := VAR_current_queue_item_CONST_REF_RD_draw_command_t_draw_command_t_11bf_uxn_c_l136_c19_9364_return_output;
     -- MUX[uxn_c_l242_c17_74b4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l242_c17_74b4_cond <= VAR_MUX_uxn_c_l242_c17_74b4_cond;
     MUX_uxn_c_l242_c17_74b4_iftrue <= VAR_MUX_uxn_c_l242_c17_74b4_iftrue;
     MUX_uxn_c_l242_c17_74b4_iffalse <= VAR_MUX_uxn_c_l242_c17_74b4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l242_c17_74b4_return_output := MUX_uxn_c_l242_c17_74b4_return_output;

     -- Submodule level 18
     -- CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_9e41 LATENCY=0
     VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_9e41_return_output := CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b(
     VAR_MUX_uxn_c_l241_c25_1717_return_output,
     VAR_MUX_uxn_c_l242_c17_74b4_return_output);

     -- Submodule level 19
     REG_VAR_result := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_9e41_return_output;
     VAR_return_output := VAR_CONST_REF_RD_gpu_step_result_t_gpu_step_result_t_db8b_uxn_c_l136_l244_DUPLICATE_9e41_return_output;
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
