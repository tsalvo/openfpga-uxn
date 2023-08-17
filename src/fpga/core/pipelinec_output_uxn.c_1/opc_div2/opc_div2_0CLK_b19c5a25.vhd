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
entity opc_div2_0CLK_b19c5a25 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div2_0CLK_b19c5a25;
architecture arch of opc_div2_0CLK_b19c5a25 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l857_c8_c24d]
signal t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_c24d_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_452a]
signal n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_452a_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_452a_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_9cf9]
signal set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_9cf9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_2d94]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_c788]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_c26b]
signal result_MUX_uxn_opcodes_h_l860_c2_c26b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_c26b]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_322e]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_e2e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_a894]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_c788]
signal result_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_c788]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l862_c10_57d6]
signal halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_57d6_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_57d6_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_57d6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_3842]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_b099]
signal result_MUX_uxn_opcodes_h_l863_c3_b099_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b099_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_2c15]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_2a38]
signal put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_2a38_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_2a38_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_c24d
t2_register_uxn_opcodes_h_l857_c8_c24d : entity work.t2_register_0CLK_4fab5348 port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index,
t2_register_uxn_opcodes_h_l857_c8_c24d_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_452a
n2_register_uxn_opcodes_h_l858_c8_452a : entity work.n2_register_0CLK_4fab5348 port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_452a_stack_index,
n2_register_uxn_opcodes_h_l858_c8_452a_return_output);

-- set_uxn_opcodes_h_l859_c9_9cf9
set_uxn_opcodes_h_l859_c9_9cf9 : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_9cf9_stack_index,
set_uxn_opcodes_h_l859_c9_9cf9_ins,
set_uxn_opcodes_h_l859_c9_9cf9_k,
set_uxn_opcodes_h_l859_c9_9cf9_mul,
set_uxn_opcodes_h_l859_c9_9cf9_add,
set_uxn_opcodes_h_l859_c9_9cf9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94
BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_c26b
result_MUX_uxn_opcodes_h_l860_c2_c26b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_c26b_cond,
result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_c26b
tmp8_MUX_uxn_opcodes_h_l860_c2_c26b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e
BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_c788
result_MUX_uxn_opcodes_h_l861_c7_c788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_c788_cond,
result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_c788_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_c788
tmp8_MUX_uxn_opcodes_h_l861_c7_c788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output);

-- halt_uxn_opcodes_h_l862_c10_57d6
halt_uxn_opcodes_h_l862_c10_57d6 : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_57d6_ins,
halt_uxn_opcodes_h_l862_c10_57d6_err,
halt_uxn_opcodes_h_l862_c10_57d6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_3842
BIN_OP_GT_uxn_opcodes_h_l863_c7_3842 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_b099
result_MUX_uxn_opcodes_h_l863_c3_b099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_b099_cond,
result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_b099_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15
BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_2a38
put2_stack_uxn_opcodes_h_l866_c3_2a38 : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_2a38_offset,
put2_stack_uxn_opcodes_h_l866_c3_2a38_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n16,
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l857_c8_c24d_return_output,
 n2_register_uxn_opcodes_h_l858_c8_452a_return_output,
 set_uxn_opcodes_h_l859_c9_9cf9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_c788_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output,
 halt_uxn_opcodes_h_l862_c10_57d6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_b099_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_452a_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_452a_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_9cf9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_57d6_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_57d6_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_57d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_mul := resize(to_unsigned(4, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l862_c10_57d6_err := resize(to_unsigned(3, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_57d6_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_452a_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l857_c8_c24d] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_return_output := t2_register_uxn_opcodes_h_l857_c8_c24d_return_output;

     -- n2_register[uxn_opcodes_h_l858_c8_452a] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_452a_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_452a_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_452a_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_452a_return_output := n2_register_uxn_opcodes_h_l858_c8_452a_return_output;

     -- set[uxn_opcodes_h_l859_c9_9cf9] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_9cf9_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_stack_index;
     set_uxn_opcodes_h_l859_c9_9cf9_ins <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_ins;
     set_uxn_opcodes_h_l859_c9_9cf9_k <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_k;
     set_uxn_opcodes_h_l859_c9_9cf9_mul <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_mul;
     set_uxn_opcodes_h_l859_c9_9cf9_add <= VAR_set_uxn_opcodes_h_l859_c9_9cf9_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_9cf9_return_output := set_uxn_opcodes_h_l859_c9_9cf9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left := VAR_n2_register_uxn_opcodes_h_l858_c8_452a_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_452a_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left := VAR_set_uxn_opcodes_h_l859_c9_9cf9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue := VAR_set_uxn_opcodes_h_l859_c9_9cf9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse := VAR_set_uxn_opcodes_h_l859_c9_9cf9_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right := VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left := VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_c24d_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_322e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_2d94] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_2c15] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_2c15_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_322e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2d94_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_c788] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c788_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_a894] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_e2e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_a894_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_e2e9_return_output;
     -- halt[uxn_opcodes_h_l862_c10_57d6] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_57d6_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_57d6_ins <= VAR_halt_uxn_opcodes_h_l862_c10_57d6_ins;
     halt_uxn_opcodes_h_l862_c10_57d6_err <= VAR_halt_uxn_opcodes_h_l862_c10_57d6_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_57d6_return_output := halt_uxn_opcodes_h_l862_c10_57d6_return_output;

     -- put2_stack[uxn_opcodes_h_l866_c3_2a38] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_2a38_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_offset;
     put2_stack_uxn_opcodes_h_l866_c3_2a38_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_2a38_value;
     -- Outputs

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left := VAR_halt_uxn_opcodes_h_l862_c10_57d6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_57d6_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_3842] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l861_c7_c788] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_3842_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c788_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l860_c2_c26b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output;

     -- result_MUX[uxn_opcodes_h_l863_c3_b099] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_b099_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_cond;
     result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_return_output := result_MUX_uxn_opcodes_h_l863_c3_b099_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_b099_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_c26b_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_c788] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_c788_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_cond;
     result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_return_output := result_MUX_uxn_opcodes_h_l861_c7_c788_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_c788_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_c26b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_c26b_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_cond;
     result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output := result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_c26b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
