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
entity opc_div_0CLK_eff7b951 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div_0CLK_eff7b951;
architecture arch of opc_div_0CLK_eff7b951 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l838_c7_c534]
signal t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l838_c7_c534_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l838_c7_c534_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l839_c7_3a79]
signal n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l839_c7_3a79_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l839_c7_3a79_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l840_c9_538c]
signal set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_538c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l841_c6_fcc7]
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c7_16a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l841_c2_c22b]
signal result_MUX_uxn_opcodes_h_l841_c2_c22b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l841_c2_c22b]
signal tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l842_c11_4e2b]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c1_c03e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l846_c1_2953]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l842_c7_16a5]
signal result_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l842_c7_16a5]
signal tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l843_c10_c479]
signal halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l843_c10_c479_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l843_c10_c479_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l843_c10_c479_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l844_c7_c803]
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l844_c3_13ea]
signal result_MUX_uxn_opcodes_h_l844_c3_13ea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l847_c29_bff2]
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l847_c3_0ef0]
signal put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_0ef0_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_0ef0_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l838_c7_c534
t_register_uxn_opcodes_h_l838_c7_c534 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l838_c7_c534_stack_index,
t_register_uxn_opcodes_h_l838_c7_c534_return_output);

-- n_register_uxn_opcodes_h_l839_c7_3a79
n_register_uxn_opcodes_h_l839_c7_3a79 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l839_c7_3a79_stack_index,
n_register_uxn_opcodes_h_l839_c7_3a79_return_output);

-- set_uxn_opcodes_h_l840_c9_538c
set_uxn_opcodes_h_l840_c9_538c : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE,
set_uxn_opcodes_h_l840_c9_538c_stack_index,
set_uxn_opcodes_h_l840_c9_538c_ins,
set_uxn_opcodes_h_l840_c9_538c_k,
set_uxn_opcodes_h_l840_c9_538c_mul,
set_uxn_opcodes_h_l840_c9_538c_add,
set_uxn_opcodes_h_l840_c9_538c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7
BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left,
BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right,
BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output);

-- result_MUX_uxn_opcodes_h_l841_c2_c22b
result_MUX_uxn_opcodes_h_l841_c2_c22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l841_c2_c22b_cond,
result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue,
result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse,
result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l841_c2_c22b
tmp8_MUX_uxn_opcodes_h_l841_c2_c22b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond,
tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue,
tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse,
tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output);

-- result_MUX_uxn_opcodes_h_l842_c7_16a5
result_MUX_uxn_opcodes_h_l842_c7_16a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l842_c7_16a5_cond,
result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue,
result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse,
result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l842_c7_16a5
tmp8_MUX_uxn_opcodes_h_l842_c7_16a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond,
tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue,
tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse,
tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output);

-- halt_uxn_opcodes_h_l843_c10_c479
halt_uxn_opcodes_h_l843_c10_c479 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE,
halt_uxn_opcodes_h_l843_c10_c479_ins,
halt_uxn_opcodes_h_l843_c10_c479_err,
halt_uxn_opcodes_h_l843_c10_c479_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l844_c7_c803
BIN_OP_GT_uxn_opcodes_h_l844_c7_c803 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left,
BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right,
BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output);

-- result_MUX_uxn_opcodes_h_l844_c3_13ea
result_MUX_uxn_opcodes_h_l844_c3_13ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l844_c3_13ea_cond,
result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue,
result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse,
result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2
BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2 : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left,
BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right,
BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output);

-- put_stack_uxn_opcodes_h_l847_c3_0ef0
put_stack_uxn_opcodes_h_l847_c3_0ef0 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index,
put_stack_uxn_opcodes_h_l847_c3_0ef0_offset,
put_stack_uxn_opcodes_h_l847_c3_0ef0_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l838_c7_c534_return_output,
 n_register_uxn_opcodes_h_l839_c7_3a79_return_output,
 set_uxn_opcodes_h_l840_c9_538c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output,
 result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output,
 tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output,
 result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output,
 tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output,
 halt_uxn_opcodes_h_l843_c10_c479_return_output,
 BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output,
 result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_c534_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_c534_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_3a79_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_3a79_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_538c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_c479_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_c479_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_c479_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l840_c9_538c_add := resize(to_signed(-1, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l840_c9_538c_mul := resize(to_unsigned(2, 2), 8);
     VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l843_c10_c479_err := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l843_c10_c479_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l840_c9_538c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l840_c9_538c_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l839_c7_3a79_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l840_c9_538c_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l838_c7_c534_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l840_c9_538c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l840_c9_538c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l840_c9_538c_stack_index <= VAR_set_uxn_opcodes_h_l840_c9_538c_stack_index;
     set_uxn_opcodes_h_l840_c9_538c_ins <= VAR_set_uxn_opcodes_h_l840_c9_538c_ins;
     set_uxn_opcodes_h_l840_c9_538c_k <= VAR_set_uxn_opcodes_h_l840_c9_538c_k;
     set_uxn_opcodes_h_l840_c9_538c_mul <= VAR_set_uxn_opcodes_h_l840_c9_538c_mul;
     set_uxn_opcodes_h_l840_c9_538c_add <= VAR_set_uxn_opcodes_h_l840_c9_538c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l840_c9_538c_return_output := set_uxn_opcodes_h_l840_c9_538c_return_output;

     -- n_register[uxn_opcodes_h_l839_c7_3a79] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l839_c7_3a79_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l839_c7_3a79_stack_index <= VAR_n_register_uxn_opcodes_h_l839_c7_3a79_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l839_c7_3a79_return_output := n_register_uxn_opcodes_h_l839_c7_3a79_return_output;

     -- t_register[uxn_opcodes_h_l838_c7_c534] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l838_c7_c534_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l838_c7_c534_stack_index <= VAR_t_register_uxn_opcodes_h_l838_c7_c534_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l838_c7_c534_return_output := t_register_uxn_opcodes_h_l838_c7_c534_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left := VAR_n_register_uxn_opcodes_h_l839_c7_3a79_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l839_c7_3a79_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left := VAR_set_uxn_opcodes_h_l840_c9_538c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue := VAR_set_uxn_opcodes_h_l840_c9_538c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse := VAR_set_uxn_opcodes_h_l840_c9_538c_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right := VAR_t_register_uxn_opcodes_h_l838_c7_c534_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left := VAR_t_register_uxn_opcodes_h_l838_c7_c534_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l838_c7_c534_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l842_c11_4e2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l841_c6_fcc7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_left;
     BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output := BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l847_c29_bff2] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_left;
     BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output := BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output;

     -- Submodule level 2
     VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_bff2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_4e2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fcc7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c7_16a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l846_c1_2953] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c1_c03e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_2953_return_output;
     VAR_halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_c03e_return_output;
     -- put_stack[uxn_opcodes_h_l847_c3_0ef0] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index <= VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_stack_index;
     put_stack_uxn_opcodes_h_l847_c3_0ef0_offset <= VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_offset;
     put_stack_uxn_opcodes_h_l847_c3_0ef0_value <= VAR_put_stack_uxn_opcodes_h_l847_c3_0ef0_value;
     -- Outputs

     -- halt[uxn_opcodes_h_l843_c10_c479] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l843_c10_c479_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l843_c10_c479_ins <= VAR_halt_uxn_opcodes_h_l843_c10_c479_ins;
     halt_uxn_opcodes_h_l843_c10_c479_err <= VAR_halt_uxn_opcodes_h_l843_c10_c479_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l843_c10_c479_return_output := halt_uxn_opcodes_h_l843_c10_c479_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left := VAR_halt_uxn_opcodes_h_l843_c10_c479_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue := VAR_halt_uxn_opcodes_h_l843_c10_c479_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l844_c7_c803] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_left;
     BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output := BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l842_c7_16a5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_cond;
     tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output := tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_c803_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l841_c2_c22b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_cond;
     tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output := tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output;

     -- result_MUX[uxn_opcodes_h_l844_c3_13ea] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l844_c3_13ea_cond <= VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_cond;
     result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue <= VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iftrue;
     result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse <= VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output := result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue := VAR_result_MUX_uxn_opcodes_h_l844_c3_13ea_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_c22b_return_output;
     -- result_MUX[uxn_opcodes_h_l842_c7_16a5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l842_c7_16a5_cond <= VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_cond;
     result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iftrue;
     result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output := result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse := VAR_result_MUX_uxn_opcodes_h_l842_c7_16a5_return_output;
     -- result_MUX[uxn_opcodes_h_l841_c2_c22b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l841_c2_c22b_cond <= VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_cond;
     result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iftrue;
     result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output := result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l841_c2_c22b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
