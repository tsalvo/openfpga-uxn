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
entity push2_stack_0CLK_11599632 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end push2_stack_0CLK_11599632;
architecture arch of push2_stack_0CLK_11599632 is
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
-- stack_pointer_get[uxn_stack_h_l278_c6_4713]
signal stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l278_c6_9864]
signal BIN_OP_GT_uxn_stack_h_l278_c6_9864_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l278_c6_9864_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l278_c1_3dc3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l278_c2_e369]
signal result_MUX_uxn_stack_h_l278_c2_e369_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l278_c2_e369_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l278_c2_e369_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l278_c2_e369_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l278_c2_e369]
signal halt_return_MUX_uxn_stack_h_l278_c2_e369_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l279_c12_ef82]
signal halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l279_c12_ef82_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l279_c12_ef82_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l279_c12_ef82_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l286_c6_328a]
signal BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l286_c1_3730]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output : unsigned(0 downto 0);

-- tmp_MUX[uxn_stack_h_l286_c2_7002]
signal tmp_MUX_uxn_stack_h_l286_c2_7002_cond : unsigned(0 downto 0);
signal tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l286_c2_7002_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_stack_h_l288_c73_91ca]
signal CONST_SR_8_uxn_stack_h_l288_c73_91ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l288_c3_3a8b]
signal stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l288_c3_3a8b_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l288_c3_3a8b_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l289_c31_68fd]
signal BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l289_c3_ae55]
signal stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l289_c3_ae55_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l289_c3_ae55_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l290_c3_d0c5]
signal stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative : unsigned(0 downto 0);

-- stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c
signal stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l278_c6_4713
stack_pointer_get_uxn_stack_h_l278_c6_4713 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index,
stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output);

-- BIN_OP_GT_uxn_stack_h_l278_c6_9864
BIN_OP_GT_uxn_stack_h_l278_c6_9864 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l278_c6_9864_left,
BIN_OP_GT_uxn_stack_h_l278_c6_9864_right,
BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output);

-- result_MUX_uxn_stack_h_l278_c2_e369
result_MUX_uxn_stack_h_l278_c2_e369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l278_c2_e369_cond,
result_MUX_uxn_stack_h_l278_c2_e369_iftrue,
result_MUX_uxn_stack_h_l278_c2_e369_iffalse,
result_MUX_uxn_stack_h_l278_c2_e369_return_output);

-- halt_return_MUX_uxn_stack_h_l278_c2_e369
halt_return_MUX_uxn_stack_h_l278_c2_e369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l278_c2_e369_cond,
halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue,
halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse,
halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output);

-- halt_uxn_stack_h_l279_c12_ef82
halt_uxn_stack_h_l279_c12_ef82 : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE,
halt_uxn_stack_h_l279_c12_ef82_ins,
halt_uxn_stack_h_l279_c12_ef82_err,
halt_uxn_stack_h_l279_c12_ef82_return_output);

-- BIN_OP_EQ_uxn_stack_h_l286_c6_328a
BIN_OP_EQ_uxn_stack_h_l286_c6_328a : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left,
BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right,
BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output);

-- tmp_MUX_uxn_stack_h_l286_c2_7002
tmp_MUX_uxn_stack_h_l286_c2_7002 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp_MUX_uxn_stack_h_l286_c2_7002_cond,
tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue,
tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse,
tmp_MUX_uxn_stack_h_l286_c2_7002_return_output);

-- CONST_SR_8_uxn_stack_h_l288_c73_91ca
CONST_SR_8_uxn_stack_h_l288_c73_91ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l288_c73_91ca_x,
CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output);

-- stack_data_set_uxn_stack_h_l288_c3_3a8b
stack_data_set_uxn_stack_h_l288_c3_3a8b : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index,
stack_data_set_uxn_stack_h_l288_c3_3a8b_address,
stack_data_set_uxn_stack_h_l288_c3_3a8b_value);

-- BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd
BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left,
BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right,
BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output);

-- stack_data_set_uxn_stack_h_l289_c3_ae55
stack_data_set_uxn_stack_h_l289_c3_ae55 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index,
stack_data_set_uxn_stack_h_l289_c3_ae55_address,
stack_data_set_uxn_stack_h_l289_c3_ae55_value);

-- stack_pointer_move_uxn_stack_h_l290_c3_d0c5
stack_pointer_move_uxn_stack_h_l290_c3_d0c5 : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index,
stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment,
stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative);

-- stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c
stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index,
stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output);



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
 stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output,
 BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output,
 result_MUX_uxn_stack_h_l278_c2_e369_return_output,
 halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output,
 halt_uxn_stack_h_l279_c12_ef82_return_output,
 BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output,
 tmp_MUX_uxn_stack_h_l286_c2_7002_return_output,
 CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output,
 BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output,
 stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l278_c2_e369_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l278_c2_e369_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l282_c3_9c33 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l278_c2_e369_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l278_c2_e369_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l279_c12_ef82_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l279_c12_ef82_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l279_c12_ef82_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse : unsigned(0 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_return_output : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l288_c63_8d7b_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l289_c67_d3b3_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output : unsigned(7 downto 0);
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
     VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment := resize(to_unsigned(2, 2), 8);
     VAR_halt_uxn_stack_h_l279_c12_ef82_err := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l282_c3_9c33 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l278_c2_e369_iffalse := VAR_result_uxn_stack_h_l282_c3_9c33;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l279_c12_ef82_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index := VAR_stack_index;
     VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse := tmp;
     VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_x := VAR_value;
     VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue := VAR_value;
     -- stack_pointer_get[uxn_stack_h_l278_c6_4713] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output := stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output;

     -- CONST_SR_8[uxn_stack_h_l288_c73_91ca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l288_c73_91ca_x <= VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output := CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l289_c67_d3b3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l289_c67_d3b3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l289_c67_d3b3_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_left := VAR_stack_pointer_get_uxn_stack_h_l278_c6_4713_return_output;
     -- BIN_OP_GT[uxn_stack_h_l278_c6_9864] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l278_c6_9864_left <= VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_left;
     BIN_OP_GT_uxn_stack_h_l278_c6_9864_right <= VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output := BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l288_c63_8d7b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l288_c63_8d7b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l288_c73_91ca_return_output);

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond := VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_cond := VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output;
     VAR_result_MUX_uxn_stack_h_l278_c2_e369_cond := VAR_BIN_OP_GT_uxn_stack_h_l278_c6_9864_return_output;
     VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l288_c63_8d7b_return_output;
     -- halt_return_MUX[uxn_stack_h_l278_c2_e369] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l278_c2_e369_cond <= VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_cond;
     halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iftrue;
     halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output := halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l278_c1_3dc3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_3dc3_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left := VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l278_c2_e369_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l286_c6_328a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left <= VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_left;
     BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right <= VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output := BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output;

     -- halt[uxn_stack_h_l279_c12_ef82] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l279_c12_ef82_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l279_c12_ef82_ins <= VAR_halt_uxn_stack_h_l279_c12_ef82_ins;
     halt_uxn_stack_h_l279_c12_ef82_err <= VAR_halt_uxn_stack_h_l279_c12_ef82_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l279_c12_ef82_return_output := halt_uxn_stack_h_l279_c12_ef82_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond := VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output;
     VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_cond := VAR_BIN_OP_EQ_uxn_stack_h_l286_c6_328a_return_output;
     VAR_result_MUX_uxn_stack_h_l278_c2_e369_iftrue := VAR_halt_uxn_stack_h_l279_c12_ef82_return_output;
     -- tmp_MUX[uxn_stack_h_l286_c2_7002] LATENCY=0
     -- Inputs
     tmp_MUX_uxn_stack_h_l286_c2_7002_cond <= VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_cond;
     tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue <= VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iftrue;
     tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse <= VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_iffalse;
     -- Outputs
     VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_return_output := tmp_MUX_uxn_stack_h_l286_c2_7002_return_output;

     -- result_MUX[uxn_stack_h_l278_c2_e369] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l278_c2_e369_cond <= VAR_result_MUX_uxn_stack_h_l278_c2_e369_cond;
     result_MUX_uxn_stack_h_l278_c2_e369_iftrue <= VAR_result_MUX_uxn_stack_h_l278_c2_e369_iftrue;
     result_MUX_uxn_stack_h_l278_c2_e369_iffalse <= VAR_result_MUX_uxn_stack_h_l278_c2_e369_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l278_c2_e369_return_output := result_MUX_uxn_stack_h_l278_c2_e369_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l286_c1_3730] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output;
     VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l286_c1_3730_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l278_c2_e369_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l278_c2_e369_return_output;
     REG_VAR_tmp := VAR_tmp_MUX_uxn_stack_h_l286_c2_7002_return_output;
     -- stack_pointer_move[uxn_stack_h_l290_c3_d0c5] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_stack_index;
     stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_adjustment;
     stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l290_c3_d0c5_is_negative;
     -- Outputs

     -- stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output := stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output;

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left := VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output;
     VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_address := VAR_stack_pointer_get_uxn_stack_h_l289_l288_DUPLICATE_1b4c_return_output;
     -- stack_data_set[uxn_stack_h_l288_c3_3a8b] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index <= VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_stack_index;
     stack_data_set_uxn_stack_h_l288_c3_3a8b_address <= VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_address;
     stack_data_set_uxn_stack_h_l288_c3_3a8b_value <= VAR_stack_data_set_uxn_stack_h_l288_c3_3a8b_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l289_c31_68fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_left;
     BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output := BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output;

     -- Submodule level 7
     VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_address := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l289_c31_68fd_return_output, 8);
     -- stack_data_set[uxn_stack_h_l289_c3_ae55] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index <= VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_stack_index;
     stack_data_set_uxn_stack_h_l289_c3_ae55_address <= VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_address;
     stack_data_set_uxn_stack_h_l289_c3_ae55_value <= VAR_stack_data_set_uxn_stack_h_l289_c3_ae55_value;
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
