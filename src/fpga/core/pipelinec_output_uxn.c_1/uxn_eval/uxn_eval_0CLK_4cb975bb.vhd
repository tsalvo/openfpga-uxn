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
-- Submodules: 33
entity uxn_eval_0CLK_4cb975bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_4cb975bb;
architecture arch of uxn_eval_0CLK_4cb975bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal main_clock_cycle : unsigned(31 downto 0) := to_unsigned(0, 32);
signal input_code : unsigned(3 downto 0) := to_unsigned(0, 4);
signal palette_color_values : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal current_pixel_palette_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_active_drawing_area : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_vram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_write_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_address : unsigned(31 downto 0) := to_unsigned(0, 32);
signal vram_value : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_main_clock_cycle : unsigned(31 downto 0);
signal REG_COMB_input_code : unsigned(3 downto 0);
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
signal REG_COMB_is_active_drawing_area : unsigned(0 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_address : unsigned(31 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l196_c15_f26f]
signal CONST_SR_12_uxn_c_l196_c15_f26f_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l196_c15_f26f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l198_c6_4bd9]
signal BIN_OP_EQ_uxn_c_l198_c6_4bd9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l198_c6_4bd9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l198_c2_250a]
signal is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l199_c28_7d2a]
signal CONST_SR_2_uxn_c_l199_c28_7d2a_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l199_c28_7d2a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l199_c28_f165]
signal BIN_OP_AND_uxn_c_l199_c28_f165_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l199_c28_f165_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l199_c28_f165_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l202_c7_1f28]
signal UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l202_c1_7f7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l208_c9_77fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l202_c2_890d]
signal is_booted_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l202_c2_890d]
signal vram_address_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l202_c2_890d_return_output : unsigned(31 downto 0);

-- is_ram_write_MUX[uxn_c_l202_c2_890d]
signal is_ram_write_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l202_c2_890d]
signal vram_value_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l202_c2_890d_return_output : unsigned(1 downto 0);

-- ram_write_value_MUX[uxn_c_l202_c2_890d]
signal ram_write_value_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l202_c2_890d_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l202_c2_890d]
signal is_vram_write_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l202_c2_890d]
signal vram_write_layer_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l202_c2_890d]
signal ram_address_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l202_c2_890d_return_output : unsigned(15 downto 0);

-- step_boot[uxn_c_l203_c41_f4f6]
signal step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l203_c41_f4f6_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l208_c14_d838]
signal UNARY_OP_NOT_uxn_c_l208_c14_d838_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l208_c1_5a21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l208_c9_77fd]
signal vram_address_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(31 downto 0);

-- is_ram_write_MUX[uxn_c_l208_c9_77fd]
signal is_ram_write_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l208_c9_77fd]
signal vram_value_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(1 downto 0);

-- ram_write_value_MUX[uxn_c_l208_c9_77fd]
signal ram_write_value_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l208_c9_77fd]
signal is_vram_write_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l208_c9_77fd]
signal vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l208_c9_77fd]
signal ram_address_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(15 downto 0);

-- step_cpu[uxn_c_l209_c39_a6bf]
signal step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l209_c39_a6bf_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l209_c39_a6bf_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l219_c19_5b3f]
signal main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l219_c19_5b3f_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l219_c19_5b3f_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l219_c19_5b3f_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l219_c19_5b3f_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l225_c38_c444]
signal step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l225_c38_c444_return_output : gpu_step_result_t;

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l227_c31_ab01]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_c_l228_c2_7d32]
signal BIN_OP_PLUS_uxn_c_l228_c2_7d32_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l228_c2_7d32_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l196_c15_f26f
CONST_SR_12_uxn_c_l196_c15_f26f : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l196_c15_f26f_x,
CONST_SR_12_uxn_c_l196_c15_f26f_return_output);

-- BIN_OP_EQ_uxn_c_l198_c6_4bd9
BIN_OP_EQ_uxn_c_l198_c6_4bd9 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l198_c6_4bd9_left,
BIN_OP_EQ_uxn_c_l198_c6_4bd9_right,
BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output);

-- is_active_drawing_area_MUX_uxn_c_l198_c2_250a
is_active_drawing_area_MUX_uxn_c_l198_c2_250a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond,
is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue,
is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse,
is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output);

-- CONST_SR_2_uxn_c_l199_c28_7d2a
CONST_SR_2_uxn_c_l199_c28_7d2a : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l199_c28_7d2a_x,
CONST_SR_2_uxn_c_l199_c28_7d2a_return_output);

-- BIN_OP_AND_uxn_c_l199_c28_f165
BIN_OP_AND_uxn_c_l199_c28_f165 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l199_c28_f165_left,
BIN_OP_AND_uxn_c_l199_c28_f165_right,
BIN_OP_AND_uxn_c_l199_c28_f165_return_output);

-- UNARY_OP_NOT_uxn_c_l202_c7_1f28
UNARY_OP_NOT_uxn_c_l202_c7_1f28 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr,
UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e
TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd
FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output);

-- is_booted_MUX_uxn_c_l202_c2_890d
is_booted_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l202_c2_890d_cond,
is_booted_MUX_uxn_c_l202_c2_890d_iftrue,
is_booted_MUX_uxn_c_l202_c2_890d_iffalse,
is_booted_MUX_uxn_c_l202_c2_890d_return_output);

-- vram_address_MUX_uxn_c_l202_c2_890d
vram_address_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l202_c2_890d_cond,
vram_address_MUX_uxn_c_l202_c2_890d_iftrue,
vram_address_MUX_uxn_c_l202_c2_890d_iffalse,
vram_address_MUX_uxn_c_l202_c2_890d_return_output);

-- is_ram_write_MUX_uxn_c_l202_c2_890d
is_ram_write_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l202_c2_890d_cond,
is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue,
is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse,
is_ram_write_MUX_uxn_c_l202_c2_890d_return_output);

-- vram_value_MUX_uxn_c_l202_c2_890d
vram_value_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l202_c2_890d_cond,
vram_value_MUX_uxn_c_l202_c2_890d_iftrue,
vram_value_MUX_uxn_c_l202_c2_890d_iffalse,
vram_value_MUX_uxn_c_l202_c2_890d_return_output);

-- ram_write_value_MUX_uxn_c_l202_c2_890d
ram_write_value_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l202_c2_890d_cond,
ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue,
ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse,
ram_write_value_MUX_uxn_c_l202_c2_890d_return_output);

-- is_vram_write_MUX_uxn_c_l202_c2_890d
is_vram_write_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l202_c2_890d_cond,
is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue,
is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse,
is_vram_write_MUX_uxn_c_l202_c2_890d_return_output);

-- vram_write_layer_MUX_uxn_c_l202_c2_890d
vram_write_layer_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l202_c2_890d_cond,
vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue,
vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse,
vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output);

-- ram_address_MUX_uxn_c_l202_c2_890d
ram_address_MUX_uxn_c_l202_c2_890d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l202_c2_890d_cond,
ram_address_MUX_uxn_c_l202_c2_890d_iftrue,
ram_address_MUX_uxn_c_l202_c2_890d_iffalse,
ram_address_MUX_uxn_c_l202_c2_890d_return_output);

-- step_boot_uxn_c_l203_c41_f4f6
step_boot_uxn_c_l203_c41_f4f6 : entity work.step_boot_0CLK_e08689a7 port map (
clk,
step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE,
step_boot_uxn_c_l203_c41_f4f6_return_output);

-- UNARY_OP_NOT_uxn_c_l208_c14_d838
UNARY_OP_NOT_uxn_c_l208_c14_d838 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l208_c14_d838_expr,
UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21
TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output);

-- vram_address_MUX_uxn_c_l208_c9_77fd
vram_address_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l208_c9_77fd_cond,
vram_address_MUX_uxn_c_l208_c9_77fd_iftrue,
vram_address_MUX_uxn_c_l208_c9_77fd_iffalse,
vram_address_MUX_uxn_c_l208_c9_77fd_return_output);

-- is_ram_write_MUX_uxn_c_l208_c9_77fd
is_ram_write_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l208_c9_77fd_cond,
is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue,
is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse,
is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output);

-- vram_value_MUX_uxn_c_l208_c9_77fd
vram_value_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l208_c9_77fd_cond,
vram_value_MUX_uxn_c_l208_c9_77fd_iftrue,
vram_value_MUX_uxn_c_l208_c9_77fd_iffalse,
vram_value_MUX_uxn_c_l208_c9_77fd_return_output);

-- ram_write_value_MUX_uxn_c_l208_c9_77fd
ram_write_value_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l208_c9_77fd_cond,
ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue,
ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse,
ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output);

-- is_vram_write_MUX_uxn_c_l208_c9_77fd
is_vram_write_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l208_c9_77fd_cond,
is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue,
is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse,
is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output);

-- vram_write_layer_MUX_uxn_c_l208_c9_77fd
vram_write_layer_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond,
vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue,
vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse,
vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output);

-- ram_address_MUX_uxn_c_l208_c9_77fd
ram_address_MUX_uxn_c_l208_c9_77fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l208_c9_77fd_cond,
ram_address_MUX_uxn_c_l208_c9_77fd_iftrue,
ram_address_MUX_uxn_c_l208_c9_77fd_iffalse,
ram_address_MUX_uxn_c_l208_c9_77fd_return_output);

-- step_cpu_uxn_c_l209_c39_a6bf
step_cpu_uxn_c_l209_c39_a6bf : entity work.step_cpu_0CLK_6d7b7177 port map (
clk,
step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE,
step_cpu_uxn_c_l209_c39_a6bf_ram_read_value,
step_cpu_uxn_c_l209_c39_a6bf_return_output);

-- main_ram_update_uxn_c_l219_c19_5b3f
main_ram_update_uxn_c_l219_c19_5b3f : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE,
main_ram_update_uxn_c_l219_c19_5b3f_ram_address,
main_ram_update_uxn_c_l219_c19_5b3f_value,
main_ram_update_uxn_c_l219_c19_5b3f_write_enable,
main_ram_update_uxn_c_l219_c19_5b3f_return_output);

-- step_gpu_uxn_c_l225_c38_c444
step_gpu_uxn_c_l225_c38_c444 : entity work.step_gpu_0CLK_57094e53 port map (
clk,
step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE,
step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area,
step_gpu_uxn_c_l225_c38_c444_is_vram_write,
step_gpu_uxn_c_l225_c38_c444_vram_write_layer,
step_gpu_uxn_c_l225_c38_c444_vram_address,
step_gpu_uxn_c_l225_c38_c444_vram_value,
step_gpu_uxn_c_l225_c38_c444_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output);

-- BIN_OP_PLUS_uxn_c_l228_c2_7d32
BIN_OP_PLUS_uxn_c_l228_c2_7d32 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l228_c2_7d32_left,
BIN_OP_PLUS_uxn_c_l228_c2_7d32_right,
BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 main_clock_cycle,
 input_code,
 palette_color_values,
 uxn_eval_result,
 current_pixel_palette_color,
 is_active_drawing_area,
 is_booted,
 is_active_fill,
 is_ram_write,
 ram_address,
 ram_write_value,
 ram_read_value,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l196_c15_f26f_return_output,
 BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output,
 is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output,
 CONST_SR_2_uxn_c_l199_c28_7d2a_return_output,
 BIN_OP_AND_uxn_c_l199_c28_f165_return_output,
 UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output,
 is_booted_MUX_uxn_c_l202_c2_890d_return_output,
 vram_address_MUX_uxn_c_l202_c2_890d_return_output,
 is_ram_write_MUX_uxn_c_l202_c2_890d_return_output,
 vram_value_MUX_uxn_c_l202_c2_890d_return_output,
 ram_write_value_MUX_uxn_c_l202_c2_890d_return_output,
 is_vram_write_MUX_uxn_c_l202_c2_890d_return_output,
 vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output,
 ram_address_MUX_uxn_c_l202_c2_890d_return_output,
 step_boot_uxn_c_l203_c41_f4f6_return_output,
 UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output,
 vram_address_MUX_uxn_c_l208_c9_77fd_return_output,
 is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output,
 vram_value_MUX_uxn_c_l208_c9_77fd_return_output,
 ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output,
 is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output,
 vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output,
 ram_address_MUX_uxn_c_l208_c9_77fd_return_output,
 step_cpu_uxn_c_l209_c39_a6bf_return_output,
 main_ram_update_uxn_c_l219_c19_5b3f_return_output,
 step_gpu_uxn_c_l225_c38_c444_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output,
 BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l196_c2_36c3 : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l196_c15_f26f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l196_c15_f26f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l199_c3_8bdd : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c28_f165_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c28_f165_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l199_c28_f165_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l202_c2_890d_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l202_c2_890d_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l202_c2_890d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l202_c2_890d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l208_c9_77fd_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l202_c2_890d_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l202_c2_890d_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l203_c41_f4f6_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l204_c18_372f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l205_c17_66db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l206_c21_f70a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l207_c15_b573_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l208_c9_77fd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l209_c39_a6bf_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l210_c18_40e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l211_c17_cb9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l213_c19_d4c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l214_c22_4827_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l215_c18_00c5_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l216_c16_6580_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l219_c19_5b3f_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l219_c19_5b3f_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l219_c19_5b3f_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l219_c19_5b3f_return_output : unsigned(7 downto 0);
 variable VAR_gpu_step_result : gpu_step_result_t;
 variable VAR_step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l225_c38_c444_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l226_c19_6a8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l227_c52_2c04_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l227_c20_5f6d_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l228_c2_a61c : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l216_l212_DUPLICATE_e7ba_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_is_vram_write : unsigned(0 downto 0);
variable REG_VAR_vram_write_layer : unsigned(0 downto 0);
variable REG_VAR_vram_address : unsigned(31 downto 0);
variable REG_VAR_vram_value : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_main_clock_cycle := main_clock_cycle;
  REG_VAR_input_code := input_code;
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
  REG_VAR_is_active_drawing_area := is_active_drawing_area;
  REG_VAR_is_booted := is_booted;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_ram_address := ram_address;
  REG_VAR_ram_write_value := ram_write_value;
  REG_VAR_ram_read_value := ram_read_value;
  REG_VAR_is_vram_write := is_vram_write;
  REG_VAR_vram_write_layer := vram_write_layer;
  REG_VAR_vram_address := vram_address;
  REG_VAR_vram_value := vram_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l199_c28_f165_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
     VAR_CONST_SR_12_uxn_c_l196_c15_f26f_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l202_c2_890d_iffalse := is_booted;
     VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_left := main_clock_cycle;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l209_c39_a6bf_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse := ram_write_value;
     VAR_vram_address_MUX_uxn_c_l202_c2_890d_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l202_c2_890d_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse := vram_write_layer;
     -- CONST_SR_12[uxn_c_l196_c15_f26f] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l196_c15_f26f_x <= VAR_CONST_SR_12_uxn_c_l196_c15_f26f_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l196_c15_f26f_return_output := CONST_SR_12_uxn_c_l196_c15_f26f_return_output;

     -- UNARY_OP_NOT[uxn_c_l208_c14_d838] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l208_c14_d838_expr <= VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output := UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;

     -- CONST_SR_2[uxn_c_l199_c28_7d2a] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l199_c28_7d2a_x <= VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_return_output := CONST_SR_2_uxn_c_l199_c28_7d2a_return_output;

     -- UNARY_OP_NOT[uxn_c_l202_c7_1f28] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr <= VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output := UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;

     -- BIN_OP_PLUS[uxn_c_l228_c2_7d32] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l228_c2_7d32_left <= VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_left;
     BIN_OP_PLUS_uxn_c_l228_c2_7d32_right <= VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output := BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l228_c2_a61c := resize(VAR_BIN_OP_PLUS_uxn_c_l228_c2_7d32_return_output, 32);
     VAR_input_code_uxn_c_l196_c2_36c3 := resize(VAR_CONST_SR_12_uxn_c_l196_c15_f26f_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l199_c28_f165_left := VAR_CONST_SR_2_uxn_c_l199_c28_7d2a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_is_booted_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_ram_address_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_vram_address_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_vram_value_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_cond := VAR_UNARY_OP_NOT_uxn_c_l202_c7_1f28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_ram_address_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_vram_address_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_vram_value_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond := VAR_UNARY_OP_NOT_uxn_c_l208_c14_d838_return_output;
     VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_left := VAR_input_code_uxn_c_l196_c2_36c3;
     REG_VAR_input_code := VAR_input_code_uxn_c_l196_c2_36c3;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l228_c2_a61c;
     -- BIN_OP_EQ[uxn_c_l198_c6_4bd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l198_c6_4bd9_left <= VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_left;
     BIN_OP_EQ_uxn_c_l198_c6_4bd9_right <= VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output := BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l202_c1_7f7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output;

     -- BIN_OP_AND[uxn_c_l199_c28_f165] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l199_c28_f165_left <= VAR_BIN_OP_AND_uxn_c_l199_c28_f165_left;
     BIN_OP_AND_uxn_c_l199_c28_f165_right <= VAR_BIN_OP_AND_uxn_c_l199_c28_f165_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l199_c28_f165_return_output := BIN_OP_AND_uxn_c_l199_c28_f165_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l199_c3_8bdd := resize(VAR_BIN_OP_AND_uxn_c_l199_c28_f165_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond := VAR_BIN_OP_EQ_uxn_c_l198_c6_4bd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l202_c1_7f7e_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue := VAR_is_active_drawing_area_uxn_c_l199_c3_8bdd;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l208_c1_5a21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output;

     -- step_boot[uxn_c_l203_c41_f4f6] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l203_c41_f4f6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l203_c41_f4f6_return_output := step_boot_uxn_c_l203_c41_f4f6_return_output;

     -- is_active_drawing_area_MUX[uxn_c_l198_c2_250a] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_cond;
     is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iftrue;
     is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output := is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l208_c1_5a21_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output;
     VAR_step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l198_c2_250a_return_output;
     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l206_c21_f70a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l206_c21_f70a_return_output := VAR_step_boot_uxn_c_l203_c41_f4f6_return_output.rom_byte;

     -- step_cpu[uxn_c_l209_c39_a6bf] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l209_c39_a6bf_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l209_c39_a6bf_ram_read_value <= VAR_step_cpu_uxn_c_l209_c39_a6bf_ram_read_value;
     -- Outputs
     VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output := step_cpu_uxn_c_l209_c39_a6bf_return_output;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l207_c15_b573] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l207_c15_b573_return_output := VAR_step_boot_uxn_c_l203_c41_f4f6_return_output.is_finished;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l205_c17_66db] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l205_c17_66db_return_output := VAR_step_boot_uxn_c_l203_c41_f4f6_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l204_c18_372f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l204_c18_372f_return_output := VAR_step_boot_uxn_c_l203_c41_f4f6_return_output.is_valid_byte;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l202_c2_890d_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l205_c17_66db_return_output;
     VAR_is_booted_MUX_uxn_c_l202_c2_890d_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l207_c15_b573_return_output;
     VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l204_c18_372f_return_output;
     VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l206_c21_f70a_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l214_c22_4827] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l214_c22_4827_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l216_l212_DUPLICATE_e7ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l216_l212_DUPLICATE_e7ba_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.u8_value;

     -- is_booted_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l202_c2_890d_cond <= VAR_is_booted_MUX_uxn_c_l202_c2_890d_cond;
     is_booted_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_is_booted_MUX_uxn_c_l202_c2_890d_iftrue;
     is_booted_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_is_booted_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l202_c2_890d_return_output := is_booted_MUX_uxn_c_l202_c2_890d_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l213_c19_d4c1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l213_c19_d4c1_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l210_c18_40e9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l210_c18_40e9_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.is_ram_write;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l215_c18_00c5] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l215_c18_00c5_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.vram_address;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l211_c17_cb9d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l211_c17_cb9d_return_output := VAR_step_cpu_uxn_c_l209_c39_a6bf_return_output.ram_address;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l211_c17_cb9d_return_output;
     VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l210_c18_40e9_return_output;
     VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l213_c19_d4c1_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l214_c22_4827_return_output;
     VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l215_c18_00c5_return_output;
     VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l216_l212_DUPLICATE_e7ba_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l202_c2_890d_return_output;
     -- ram_write_value_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l208_c9_77fd_cond <= VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_cond;
     ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iftrue;
     ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output := ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output;

     -- is_vram_write_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l208_c9_77fd_cond <= VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_cond;
     is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iftrue;
     is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output := is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output;

     -- vram_write_layer_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond <= VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_cond;
     vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iftrue;
     vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output := vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output;

     -- vram_address_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l208_c9_77fd_cond <= VAR_vram_address_MUX_uxn_c_l208_c9_77fd_cond;
     vram_address_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iftrue;
     vram_address_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_vram_address_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l208_c9_77fd_return_output := vram_address_MUX_uxn_c_l208_c9_77fd_return_output;

     -- CAST_TO_uint2_t[uxn_c_l216_c16_6580] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l216_c16_6580_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l216_l212_DUPLICATE_e7ba_return_output);

     -- is_ram_write_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l208_c9_77fd_cond <= VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_cond;
     is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iftrue;
     is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output := is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output;

     -- ram_address_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l208_c9_77fd_cond <= VAR_ram_address_MUX_uxn_c_l208_c9_77fd_cond;
     ram_address_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iftrue;
     ram_address_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_ram_address_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l208_c9_77fd_return_output := ram_address_MUX_uxn_c_l208_c9_77fd_return_output;

     -- Submodule level 6
     VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l216_c16_6580_return_output;
     VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse := VAR_is_ram_write_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse := VAR_is_vram_write_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_ram_address_MUX_uxn_c_l202_c2_890d_iffalse := VAR_ram_address_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse := VAR_ram_write_value_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_vram_address_MUX_uxn_c_l202_c2_890d_iffalse := VAR_vram_address_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse := VAR_vram_write_layer_MUX_uxn_c_l208_c9_77fd_return_output;
     -- ram_address_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l202_c2_890d_cond <= VAR_ram_address_MUX_uxn_c_l202_c2_890d_cond;
     ram_address_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_ram_address_MUX_uxn_c_l202_c2_890d_iftrue;
     ram_address_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_ram_address_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l202_c2_890d_return_output := ram_address_MUX_uxn_c_l202_c2_890d_return_output;

     -- ram_write_value_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l202_c2_890d_cond <= VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_cond;
     ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iftrue;
     ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_return_output := ram_write_value_MUX_uxn_c_l202_c2_890d_return_output;

     -- vram_value_MUX[uxn_c_l208_c9_77fd] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l208_c9_77fd_cond <= VAR_vram_value_MUX_uxn_c_l208_c9_77fd_cond;
     vram_value_MUX_uxn_c_l208_c9_77fd_iftrue <= VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iftrue;
     vram_value_MUX_uxn_c_l208_c9_77fd_iffalse <= VAR_vram_value_MUX_uxn_c_l208_c9_77fd_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l208_c9_77fd_return_output := vram_value_MUX_uxn_c_l208_c9_77fd_return_output;

     -- vram_address_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l202_c2_890d_cond <= VAR_vram_address_MUX_uxn_c_l202_c2_890d_cond;
     vram_address_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_vram_address_MUX_uxn_c_l202_c2_890d_iftrue;
     vram_address_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_vram_address_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l202_c2_890d_return_output := vram_address_MUX_uxn_c_l202_c2_890d_return_output;

     -- is_vram_write_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l202_c2_890d_cond <= VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_cond;
     is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iftrue;
     is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_return_output := is_vram_write_MUX_uxn_c_l202_c2_890d_return_output;

     -- is_ram_write_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l202_c2_890d_cond <= VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_cond;
     is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iftrue;
     is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_return_output := is_ram_write_MUX_uxn_c_l202_c2_890d_return_output;

     -- vram_write_layer_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l202_c2_890d_cond <= VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_cond;
     vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iftrue;
     vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output := vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output;

     -- Submodule level 7
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_main_ram_update_uxn_c_l219_c19_5b3f_write_enable := VAR_is_ram_write_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_step_gpu_uxn_c_l225_c38_c444_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_main_ram_update_uxn_c_l219_c19_5b3f_ram_address := VAR_ram_address_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_main_ram_update_uxn_c_l219_c19_5b3f_value := VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_step_gpu_uxn_c_l225_c38_c444_vram_address := VAR_vram_address_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l202_c2_890d_return_output;
     VAR_vram_value_MUX_uxn_c_l202_c2_890d_iffalse := VAR_vram_value_MUX_uxn_c_l208_c9_77fd_return_output;
     VAR_step_gpu_uxn_c_l225_c38_c444_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l202_c2_890d_return_output;
     -- vram_value_MUX[uxn_c_l202_c2_890d] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l202_c2_890d_cond <= VAR_vram_value_MUX_uxn_c_l202_c2_890d_cond;
     vram_value_MUX_uxn_c_l202_c2_890d_iftrue <= VAR_vram_value_MUX_uxn_c_l202_c2_890d_iftrue;
     vram_value_MUX_uxn_c_l202_c2_890d_iffalse <= VAR_vram_value_MUX_uxn_c_l202_c2_890d_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l202_c2_890d_return_output := vram_value_MUX_uxn_c_l202_c2_890d_return_output;

     -- main_ram_update[uxn_c_l219_c19_5b3f] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l219_c19_5b3f_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l219_c19_5b3f_ram_address <= VAR_main_ram_update_uxn_c_l219_c19_5b3f_ram_address;
     main_ram_update_uxn_c_l219_c19_5b3f_value <= VAR_main_ram_update_uxn_c_l219_c19_5b3f_value;
     main_ram_update_uxn_c_l219_c19_5b3f_write_enable <= VAR_main_ram_update_uxn_c_l219_c19_5b3f_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l219_c19_5b3f_return_output := main_ram_update_uxn_c_l219_c19_5b3f_return_output;

     -- Submodule level 8
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l219_c19_5b3f_return_output;
     VAR_step_gpu_uxn_c_l225_c38_c444_vram_value := VAR_vram_value_MUX_uxn_c_l202_c2_890d_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l202_c2_890d_return_output;
     -- step_gpu[uxn_c_l225_c38_c444] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l225_c38_c444_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area <= VAR_step_gpu_uxn_c_l225_c38_c444_is_active_drawing_area;
     step_gpu_uxn_c_l225_c38_c444_is_vram_write <= VAR_step_gpu_uxn_c_l225_c38_c444_is_vram_write;
     step_gpu_uxn_c_l225_c38_c444_vram_write_layer <= VAR_step_gpu_uxn_c_l225_c38_c444_vram_write_layer;
     step_gpu_uxn_c_l225_c38_c444_vram_address <= VAR_step_gpu_uxn_c_l225_c38_c444_vram_address;
     step_gpu_uxn_c_l225_c38_c444_vram_value <= VAR_step_gpu_uxn_c_l225_c38_c444_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l225_c38_c444_return_output := step_gpu_uxn_c_l225_c38_c444_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l226_c19_6a8e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l226_c19_6a8e_return_output := VAR_step_gpu_uxn_c_l225_c38_c444_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l227_c52_2c04] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l227_c52_2c04_return_output := VAR_step_gpu_uxn_c_l225_c38_c444_return_output.color;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l226_c19_6a8e_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0 := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l227_c52_2c04_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l227_c31_ab01] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output;

     -- Submodule level 11
     -- CAST_TO_uint16_t[uxn_c_l227_c20_5f6d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l227_c20_5f6d_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l227_c31_ab01_return_output);

     -- Submodule level 12
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l227_c20_5f6d_return_output;
     REG_VAR_uxn_eval_result := VAR_CAST_TO_uint16_t_uxn_c_l227_c20_5f6d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_main_clock_cycle <= REG_VAR_main_clock_cycle;
REG_COMB_input_code <= REG_VAR_input_code;
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
REG_COMB_is_active_drawing_area <= REG_VAR_is_active_drawing_area;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_ram_write_value <= REG_VAR_ram_write_value;
REG_COMB_ram_read_value <= REG_VAR_ram_read_value;
REG_COMB_is_vram_write <= REG_VAR_is_vram_write;
REG_COMB_vram_write_layer <= REG_VAR_vram_write_layer;
REG_COMB_vram_address <= REG_VAR_vram_address;
REG_COMB_vram_value <= REG_VAR_vram_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     main_clock_cycle <= REG_COMB_main_clock_cycle;
     input_code <= REG_COMB_input_code;
     palette_color_values <= REG_COMB_palette_color_values;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
     is_active_drawing_area <= REG_COMB_is_active_drawing_area;
     is_booted <= REG_COMB_is_booted;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     ram_address <= REG_COMB_ram_address;
     ram_write_value <= REG_COMB_ram_write_value;
     ram_read_value <= REG_COMB_ram_read_value;
     is_vram_write <= REG_COMB_is_vram_write;
     vram_write_layer <= REG_COMB_vram_write_layer;
     vram_address <= REG_COMB_vram_address;
     vram_value <= REG_COMB_vram_value;
 end if;
 end if;
end process;

end arch;
