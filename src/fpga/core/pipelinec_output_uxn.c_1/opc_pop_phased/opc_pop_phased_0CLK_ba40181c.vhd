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
-- Submodules: 11
entity opc_pop_phased_0CLK_ba40181c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_pop_phased_0CLK_ba40181c;
architecture arch of opc_pop_phased_0CLK_ba40181c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal set_will_succeed : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_set_will_succeed : unsigned(0 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l178_c6_1f66]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l178_c1_c392]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l181_c7_0b10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l178_c2_6a26]
signal result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l179_c12_25a2]
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l181_c11_43c0]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l181_c1_56f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l181_c7_0b10]
signal result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l182_c3_c5aa]
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l182_c3_c5aa_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l184_c11_552c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l184_c7_f907]
signal result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66
BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output);

-- result_MUX_uxn_opcodes_phased_h_l178_c2_6a26
result_MUX_uxn_opcodes_phased_h_l178_c2_6a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond,
result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue,
result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse,
result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add,
set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0
BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output);

-- result_MUX_uxn_opcodes_phased_h_l181_c7_0b10
result_MUX_uxn_opcodes_phased_h_l181_c7_0b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond,
result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue,
result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse,
result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output);

-- set_uxn_opcodes_phased_h_l182_c3_c5aa
set_uxn_opcodes_phased_h_l182_c3_c5aa : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l182_c3_c5aa_sp,
set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index,
set_uxn_opcodes_phased_h_l182_c3_c5aa_ins,
set_uxn_opcodes_phased_h_l182_c3_c5aa_k,
set_uxn_opcodes_phased_h_l182_c3_c5aa_mul,
set_uxn_opcodes_phased_h_l182_c3_c5aa_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c
BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l184_c7_f907
result_MUX_uxn_opcodes_phased_h_l184_c7_f907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond,
result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue,
result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse,
result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 k,
 -- Registers
 set_will_succeed,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output,
 result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output,
 set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output,
 result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output,
 result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_set_will_succeed : unsigned(0 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_set_will_succeed := set_will_succeed;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add := resize(to_signed(-1, 2), 8);
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_mul := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_add := resize(to_signed(-1, 2), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse := result;
     REG_VAR_set_will_succeed := set_will_succeed;
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index := VAR_stack_index;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l181_c11_43c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l184_c11_552c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l178_c6_1f66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l178_c6_1f66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l181_c11_43c0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l184_c11_552c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l184_c7_f907] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_cond;
     result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iftrue;
     result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output := result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l181_c7_0b10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l178_c1_c392] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l178_c1_c392_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l184_c7_f907_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l181_c7_0b10] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_cond;
     result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iftrue;
     result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output := result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l179_c12_25a2] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_sp;
     set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_k;
     set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_mul;
     set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output := set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l181_c1_56f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output;

     -- Submodule level 3
     VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l181_c1_56f9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l181_c7_0b10_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l179_c12_25a2_return_output;
     -- set[uxn_opcodes_phased_h_l182_c3_c5aa] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l182_c3_c5aa_sp <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_sp;
     set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_stack_index;
     set_uxn_opcodes_phased_h_l182_c3_c5aa_ins <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_ins;
     set_uxn_opcodes_phased_h_l182_c3_c5aa_k <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_k;
     set_uxn_opcodes_phased_h_l182_c3_c5aa_mul <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_mul;
     set_uxn_opcodes_phased_h_l182_c3_c5aa_add <= VAR_set_uxn_opcodes_phased_h_l182_c3_c5aa_add;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l178_c2_6a26] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_cond;
     result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iftrue;
     result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output := result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output;

     -- Submodule level 4
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l178_c2_6a26_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_set_will_succeed <= REG_VAR_set_will_succeed;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     set_will_succeed <= REG_COMB_set_will_succeed;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
