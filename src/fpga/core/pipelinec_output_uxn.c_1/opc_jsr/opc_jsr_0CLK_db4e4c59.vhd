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
-- Submodules: 13
entity opc_jsr_0CLK_db4e4c59 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsr_0CLK_db4e4c59;
architecture arch of opc_jsr_0CLK_db4e4c59 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l448_c7_5a65]
signal t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l448_c7_5a65_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l448_c7_5a65_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l449_c9_1c93]
signal set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_1c93_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l450_c6_dbe4]
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l451_c1_d439]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l450_c2_acec]
signal tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l450_c2_acec]
signal result_MUX_uxn_opcodes_h_l450_c2_acec_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_acec_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l452_c30_52e8]
signal pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l452_c30_52e8_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l452_c10_5cd8]
signal push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_5cd8_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l453_c7_b31d]
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l454_c1_f0fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l453_c3_5f23]
signal result_MUX_uxn_opcodes_h_l453_c3_5f23_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l455_c4_0ec1]
signal pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l448_c7_5a65
t_register_uxn_opcodes_h_l448_c7_5a65 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l448_c7_5a65_stack_index,
t_register_uxn_opcodes_h_l448_c7_5a65_return_output);

-- set_uxn_opcodes_h_l449_c9_1c93
set_uxn_opcodes_h_l449_c9_1c93 : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE,
set_uxn_opcodes_h_l449_c9_1c93_stack_index,
set_uxn_opcodes_h_l449_c9_1c93_ins,
set_uxn_opcodes_h_l449_c9_1c93_k,
set_uxn_opcodes_h_l449_c9_1c93_mul,
set_uxn_opcodes_h_l449_c9_1c93_add,
set_uxn_opcodes_h_l449_c9_1c93_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4
BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left,
BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right,
BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output);

-- tmp8_MUX_uxn_opcodes_h_l450_c2_acec
tmp8_MUX_uxn_opcodes_h_l450_c2_acec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond,
tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue,
tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse,
tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output);

-- result_MUX_uxn_opcodes_h_l450_c2_acec
result_MUX_uxn_opcodes_h_l450_c2_acec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l450_c2_acec_cond,
result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue,
result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse,
result_MUX_uxn_opcodes_h_l450_c2_acec_return_output);

-- pc_get_uxn_opcodes_h_l452_c30_52e8
pc_get_uxn_opcodes_h_l452_c30_52e8 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l452_c30_52e8_return_output);

-- push2_stack_uxn_opcodes_h_l452_c10_5cd8
push2_stack_uxn_opcodes_h_l452_c10_5cd8 : entity work.push2_stack_0CLK_20337205 port map (
clk,
push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index,
push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins,
push2_stack_uxn_opcodes_h_l452_c10_5cd8_value,
push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d
BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left,
BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right,
BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output);

-- result_MUX_uxn_opcodes_h_l453_c3_5f23
result_MUX_uxn_opcodes_h_l453_c3_5f23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l453_c3_5f23_cond,
result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue,
result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse,
result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output);

-- pc_add_s8_uxn_opcodes_h_l455_c4_0ec1
pc_add_s8_uxn_opcodes_h_l455_c4_0ec1 : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l448_c7_5a65_return_output,
 set_uxn_opcodes_h_l449_c9_1c93_return_output,
 BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output,
 tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output,
 result_MUX_uxn_opcodes_h_l450_c2_acec_return_output,
 pc_get_uxn_opcodes_h_l452_c30_52e8_return_output,
 push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output,
 result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_5a65_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_5a65_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_1c93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_value : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_70c9_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l449_c9_1c93_mul := resize(to_unsigned(1, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l449_c9_1c93_add := resize(to_signed(-1, 2), 8);
     VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l449_c9_1c93_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l449_c9_1c93_k := VAR_k;
     VAR_set_uxn_opcodes_h_l449_c9_1c93_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l448_c7_5a65_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l449_c9_1c93] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l449_c9_1c93_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l449_c9_1c93_stack_index <= VAR_set_uxn_opcodes_h_l449_c9_1c93_stack_index;
     set_uxn_opcodes_h_l449_c9_1c93_ins <= VAR_set_uxn_opcodes_h_l449_c9_1c93_ins;
     set_uxn_opcodes_h_l449_c9_1c93_k <= VAR_set_uxn_opcodes_h_l449_c9_1c93_k;
     set_uxn_opcodes_h_l449_c9_1c93_mul <= VAR_set_uxn_opcodes_h_l449_c9_1c93_mul;
     set_uxn_opcodes_h_l449_c9_1c93_add <= VAR_set_uxn_opcodes_h_l449_c9_1c93_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l449_c9_1c93_return_output := set_uxn_opcodes_h_l449_c9_1c93_return_output;

     -- t_register[uxn_opcodes_h_l448_c7_5a65] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l448_c7_5a65_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l448_c7_5a65_stack_index <= VAR_t_register_uxn_opcodes_h_l448_c7_5a65_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l448_c7_5a65_return_output := t_register_uxn_opcodes_h_l448_c7_5a65_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left := VAR_set_uxn_opcodes_h_l449_c9_1c93_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue := VAR_set_uxn_opcodes_h_l449_c9_1c93_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l448_c7_5a65_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l450_c6_dbe4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_left;
     BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output := BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l455_c14_70c9] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_70c9_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l448_c7_5a65_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_dbe4_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_70c9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l451_c1_d439] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output;
     VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output;
     VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_d439_return_output;
     -- pc_get[uxn_opcodes_h_l452_c30_52e8] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_return_output := pc_get_uxn_opcodes_h_l452_c30_52e8_return_output;

     -- Submodule level 4
     VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_value := VAR_pc_get_uxn_opcodes_h_l452_c30_52e8_return_output;
     -- push2_stack[uxn_opcodes_h_l452_c10_5cd8] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index <= VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_stack_index;
     push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins <= VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_ins;
     push2_stack_uxn_opcodes_h_l452_c10_5cd8_value <= VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output := push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left := VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse := VAR_push2_stack_uxn_opcodes_h_l452_c10_5cd8_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l450_c2_acec] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_cond;
     tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iftrue;
     tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output := tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l453_c7_b31d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_left;
     BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output := BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_b31d_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_acec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l454_c1_f0fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output;

     -- result_MUX[uxn_opcodes_h_l453_c3_5f23] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l453_c3_5f23_cond <= VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_cond;
     result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue <= VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iftrue;
     result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse <= VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output := result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output;

     -- Submodule level 7
     VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_f0fc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse := VAR_result_MUX_uxn_opcodes_h_l453_c3_5f23_return_output;
     -- result_MUX[uxn_opcodes_h_l450_c2_acec] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l450_c2_acec_cond <= VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_cond;
     result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue <= VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iftrue;
     result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse <= VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_return_output := result_MUX_uxn_opcodes_h_l450_c2_acec_return_output;

     -- pc_add_s8[uxn_opcodes_h_l455_c4_0ec1] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l455_c4_0ec1_adjustment;
     -- Outputs

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l450_c2_acec_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
