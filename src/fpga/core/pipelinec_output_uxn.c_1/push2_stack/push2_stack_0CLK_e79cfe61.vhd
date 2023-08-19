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
-- Submodules: 17
entity push2_stack_0CLK_e79cfe61 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end push2_stack_0CLK_e79cfe61;
architecture arch of push2_stack_0CLK_e79cfe61 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal halt_return : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_halt_return : unsigned(0 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l272_c6_61c2]
signal stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l272_c6_c69d]
signal BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l272_c1_07fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l272_c2_4744]
signal result_MUX_uxn_stack_h_l272_c2_4744_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l272_c2_4744_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l272_c2_4744_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l272_c2_4744_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l272_c2_4744]
signal halt_return_MUX_uxn_stack_h_l272_c2_4744_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l273_c12_69bc]
signal halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l273_c12_69bc_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l273_c12_69bc_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l273_c12_69bc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l280_c6_f292]
signal BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l280_c1_ae46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output : unsigned(0 downto 0);

-- tmp_MUX[uxn_stack_h_l280_c2_3055]
signal tmp_MUX_uxn_stack_h_l280_c2_3055_cond : unsigned(0 downto 0);
signal tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l280_c2_3055_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_stack_h_l282_c73_ca93]
signal CONST_SR_8_uxn_stack_h_l282_c73_ca93_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l282_c3_0900]
signal stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l282_c3_0900_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l282_c3_0900_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l282_c3_0900_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l283_c31_d9be]
signal BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l283_c3_e806]
signal stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l283_c3_e806_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l283_c3_e806_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l283_c3_e806_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l284_c3_7b18]
signal stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative : unsigned(0 downto 0);

-- stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac
signal stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l272_c6_61c2
stack_pointer_get_uxn_stack_h_l272_c6_61c2 : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index,
stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output);

-- BIN_OP_GT_uxn_stack_h_l272_c6_c69d
BIN_OP_GT_uxn_stack_h_l272_c6_c69d : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left,
BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right,
BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output);

-- result_MUX_uxn_stack_h_l272_c2_4744
result_MUX_uxn_stack_h_l272_c2_4744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l272_c2_4744_cond,
result_MUX_uxn_stack_h_l272_c2_4744_iftrue,
result_MUX_uxn_stack_h_l272_c2_4744_iffalse,
result_MUX_uxn_stack_h_l272_c2_4744_return_output);

-- halt_return_MUX_uxn_stack_h_l272_c2_4744
halt_return_MUX_uxn_stack_h_l272_c2_4744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l272_c2_4744_cond,
halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue,
halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse,
halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output);

-- halt_uxn_stack_h_l273_c12_69bc
halt_uxn_stack_h_l273_c12_69bc : entity work.halt_0CLK_fd588851 port map (
clk,
halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE,
halt_uxn_stack_h_l273_c12_69bc_ins,
halt_uxn_stack_h_l273_c12_69bc_err,
halt_uxn_stack_h_l273_c12_69bc_return_output);

-- BIN_OP_EQ_uxn_stack_h_l280_c6_f292
BIN_OP_EQ_uxn_stack_h_l280_c6_f292 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left,
BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right,
BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output);

-- tmp_MUX_uxn_stack_h_l280_c2_3055
tmp_MUX_uxn_stack_h_l280_c2_3055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp_MUX_uxn_stack_h_l280_c2_3055_cond,
tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue,
tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse,
tmp_MUX_uxn_stack_h_l280_c2_3055_return_output);

-- CONST_SR_8_uxn_stack_h_l282_c73_ca93
CONST_SR_8_uxn_stack_h_l282_c73_ca93 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l282_c73_ca93_x,
CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output);

-- stack_data_set_uxn_stack_h_l282_c3_0900
stack_data_set_uxn_stack_h_l282_c3_0900 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l282_c3_0900_stack_index,
stack_data_set_uxn_stack_h_l282_c3_0900_address,
stack_data_set_uxn_stack_h_l282_c3_0900_value);

-- BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be
BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left,
BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right,
BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output);

-- stack_data_set_uxn_stack_h_l283_c3_e806
stack_data_set_uxn_stack_h_l283_c3_e806 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l283_c3_e806_stack_index,
stack_data_set_uxn_stack_h_l283_c3_e806_address,
stack_data_set_uxn_stack_h_l283_c3_e806_value);

-- stack_pointer_move_uxn_stack_h_l284_c3_7b18
stack_pointer_move_uxn_stack_h_l284_c3_7b18 : entity work.stack_pointer_move_0CLK_4a6b0d77 port map (
clk,
stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index,
stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment,
stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative);

-- stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac
stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index,
stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 value,
 -- Registers
 tmp,
 result,
 halt_return,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output,
 BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output,
 result_MUX_uxn_stack_h_l272_c2_4744_return_output,
 halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output,
 halt_uxn_stack_h_l273_c12_69bc_return_output,
 BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output,
 tmp_MUX_uxn_stack_h_l280_c2_3055_return_output,
 CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output,
 BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output,
 stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l272_c2_4744_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l272_c2_4744_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l276_c3_642e : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l272_c2_4744_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l272_c2_4744_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l273_c12_69bc_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l273_c12_69bc_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l273_c12_69bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse : unsigned(0 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_return_output : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l282_c3_0900_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l282_c3_0900_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l282_c3_0900_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l282_c63_b74f_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l283_c3_e806_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l283_c3_e806_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l283_c3_e806_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l283_c67_71d2_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_halt_return : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp := tmp;
  REG_VAR_result := result;
  REG_VAR_halt_return := halt_return;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right := to_unsigned(253, 8);
     VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment := resize(to_unsigned(2, 2), 8);
     VAR_result_uxn_stack_h_l276_c3_642e := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l272_c2_4744_iffalse := VAR_result_uxn_stack_h_l276_c3_642e;
     VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l273_c12_69bc_err := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_value := value;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l273_c12_69bc_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l282_c3_0900_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l283_c3_e806_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index := VAR_stack_index;
     VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse := tmp;
     VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_x := VAR_value;
     VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue := VAR_value;
     -- CAST_TO_uint8_t[uxn_stack_h_l283_c67_71d2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l283_c67_71d2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- stack_pointer_get[uxn_stack_h_l272_c6_61c2] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output := stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output;

     -- CONST_SR_8[uxn_stack_h_l282_c73_ca93] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l282_c73_ca93_x <= VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output := CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output;

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l283_c3_e806_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l283_c67_71d2_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left := VAR_stack_pointer_get_uxn_stack_h_l272_c6_61c2_return_output;
     -- CAST_TO_uint8_t[uxn_stack_h_l282_c63_b74f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l282_c63_b74f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l282_c73_ca93_return_output);

     -- BIN_OP_GT[uxn_stack_h_l272_c6_c69d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left <= VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_left;
     BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right <= VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output := BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond := VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_cond := VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output;
     VAR_result_MUX_uxn_stack_h_l272_c2_4744_cond := VAR_BIN_OP_GT_uxn_stack_h_l272_c6_c69d_return_output;
     VAR_stack_data_set_uxn_stack_h_l282_c3_0900_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l282_c63_b74f_return_output;
     -- halt_return_MUX[uxn_stack_h_l272_c2_4744] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l272_c2_4744_cond <= VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_cond;
     halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iftrue;
     halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output := halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l272_c1_07fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l272_c1_07fb_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left := VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l272_c2_4744_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l280_c6_f292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left <= VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_left;
     BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right <= VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output := BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output;

     -- halt[uxn_stack_h_l273_c12_69bc] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l273_c12_69bc_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l273_c12_69bc_ins <= VAR_halt_uxn_stack_h_l273_c12_69bc_ins;
     halt_uxn_stack_h_l273_c12_69bc_err <= VAR_halt_uxn_stack_h_l273_c12_69bc_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l273_c12_69bc_return_output := halt_uxn_stack_h_l273_c12_69bc_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond := VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output;
     VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_cond := VAR_BIN_OP_EQ_uxn_stack_h_l280_c6_f292_return_output;
     VAR_result_MUX_uxn_stack_h_l272_c2_4744_iftrue := VAR_halt_uxn_stack_h_l273_c12_69bc_return_output;
     -- result_MUX[uxn_stack_h_l272_c2_4744] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l272_c2_4744_cond <= VAR_result_MUX_uxn_stack_h_l272_c2_4744_cond;
     result_MUX_uxn_stack_h_l272_c2_4744_iftrue <= VAR_result_MUX_uxn_stack_h_l272_c2_4744_iftrue;
     result_MUX_uxn_stack_h_l272_c2_4744_iffalse <= VAR_result_MUX_uxn_stack_h_l272_c2_4744_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l272_c2_4744_return_output := result_MUX_uxn_stack_h_l272_c2_4744_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l280_c1_ae46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output;

     -- tmp_MUX[uxn_stack_h_l280_c2_3055] LATENCY=0
     -- Inputs
     tmp_MUX_uxn_stack_h_l280_c2_3055_cond <= VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_cond;
     tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue <= VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iftrue;
     tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse <= VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_iffalse;
     -- Outputs
     VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_return_output := tmp_MUX_uxn_stack_h_l280_c2_3055_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output;
     VAR_stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l280_c1_ae46_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l272_c2_4744_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l272_c2_4744_return_output;
     REG_VAR_tmp := VAR_tmp_MUX_uxn_stack_h_l280_c2_3055_return_output;
     -- stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output := stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output;

     -- stack_pointer_move[uxn_stack_h_l284_c3_7b18] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_stack_index;
     stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_adjustment;
     stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l284_c3_7b18_is_negative;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left := VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output;
     VAR_stack_data_set_uxn_stack_h_l282_c3_0900_address := VAR_stack_pointer_get_uxn_stack_h_l282_l283_DUPLICATE_a8ac_return_output;
     -- stack_data_set[uxn_stack_h_l282_c3_0900] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l282_c3_0900_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l282_c3_0900_stack_index <= VAR_stack_data_set_uxn_stack_h_l282_c3_0900_stack_index;
     stack_data_set_uxn_stack_h_l282_c3_0900_address <= VAR_stack_data_set_uxn_stack_h_l282_c3_0900_address;
     stack_data_set_uxn_stack_h_l282_c3_0900_value <= VAR_stack_data_set_uxn_stack_h_l282_c3_0900_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l283_c31_d9be] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_left;
     BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output := BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output;

     -- Submodule level 7
     VAR_stack_data_set_uxn_stack_h_l283_c3_e806_address := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l283_c31_d9be_return_output, 8);
     -- stack_data_set[uxn_stack_h_l283_c3_e806] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l283_c3_e806_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l283_c3_e806_stack_index <= VAR_stack_data_set_uxn_stack_h_l283_c3_e806_stack_index;
     stack_data_set_uxn_stack_h_l283_c3_e806_address <= VAR_stack_data_set_uxn_stack_h_l283_c3_e806_address;
     stack_data_set_uxn_stack_h_l283_c3_e806_value <= VAR_stack_data_set_uxn_stack_h_l283_c3_e806_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp <= REG_VAR_tmp;
REG_COMB_result <= REG_VAR_result;
REG_COMB_halt_return <= REG_VAR_halt_return;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp <= REG_COMB_tmp;
     result <= REG_COMB_result;
     halt_return <= REG_COMB_halt_return;
 end if;
 end if;
end process;

end arch;
