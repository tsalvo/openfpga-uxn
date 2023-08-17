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
entity opc_div_0CLK_6c00b54e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div_0CLK_6c00b54e;
architecture arch of opc_div_0CLK_6c00b54e is
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
-- t_register[uxn_opcodes_h_l838_c7_5345]
signal t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l838_c7_5345_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l838_c7_5345_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l839_c7_47a1]
signal n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l839_c7_47a1_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l839_c7_47a1_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l840_c9_31ac]
signal set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l840_c9_31ac_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l841_c6_fc5e]
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c7_05ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l841_c2_4957]
signal result_MUX_uxn_opcodes_h_l841_c2_4957_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l841_c2_4957_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l841_c2_4957]
signal tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l842_c11_1acb]
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c1_cb3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l846_c1_39a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l842_c7_05ad]
signal result_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l842_c7_05ad]
signal tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l843_c10_8bd1]
signal halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l843_c10_8bd1_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l843_c10_8bd1_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l843_c10_8bd1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l844_c7_f2b9]
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l844_c3_1c6a]
signal result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l847_c29_efc3]
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l847_c3_16e3]
signal put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_16e3_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l847_c3_16e3_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l838_c7_5345
t_register_uxn_opcodes_h_l838_c7_5345 : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l838_c7_5345_stack_index,
t_register_uxn_opcodes_h_l838_c7_5345_return_output);

-- n_register_uxn_opcodes_h_l839_c7_47a1
n_register_uxn_opcodes_h_l839_c7_47a1 : entity work.n_register_0CLK_31d26cd6 port map (
clk,
n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l839_c7_47a1_stack_index,
n_register_uxn_opcodes_h_l839_c7_47a1_return_output);

-- set_uxn_opcodes_h_l840_c9_31ac
set_uxn_opcodes_h_l840_c9_31ac : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE,
set_uxn_opcodes_h_l840_c9_31ac_stack_index,
set_uxn_opcodes_h_l840_c9_31ac_ins,
set_uxn_opcodes_h_l840_c9_31ac_k,
set_uxn_opcodes_h_l840_c9_31ac_mul,
set_uxn_opcodes_h_l840_c9_31ac_add,
set_uxn_opcodes_h_l840_c9_31ac_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e
BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left,
BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right,
BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output);

-- result_MUX_uxn_opcodes_h_l841_c2_4957
result_MUX_uxn_opcodes_h_l841_c2_4957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l841_c2_4957_cond,
result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue,
result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse,
result_MUX_uxn_opcodes_h_l841_c2_4957_return_output);

-- tmp8_MUX_uxn_opcodes_h_l841_c2_4957
tmp8_MUX_uxn_opcodes_h_l841_c2_4957 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond,
tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue,
tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse,
tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb
BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right,
BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output);

-- result_MUX_uxn_opcodes_h_l842_c7_05ad
result_MUX_uxn_opcodes_h_l842_c7_05ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l842_c7_05ad_cond,
result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue,
result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse,
result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output);

-- tmp8_MUX_uxn_opcodes_h_l842_c7_05ad
tmp8_MUX_uxn_opcodes_h_l842_c7_05ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond,
tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue,
tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse,
tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output);

-- halt_uxn_opcodes_h_l843_c10_8bd1
halt_uxn_opcodes_h_l843_c10_8bd1 : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE,
halt_uxn_opcodes_h_l843_c10_8bd1_ins,
halt_uxn_opcodes_h_l843_c10_8bd1_err,
halt_uxn_opcodes_h_l843_c10_8bd1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9
BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left,
BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right,
BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output);

-- result_MUX_uxn_opcodes_h_l844_c3_1c6a
result_MUX_uxn_opcodes_h_l844_c3_1c6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond,
result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue,
result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse,
result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3
BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3 : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left,
BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right,
BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output);

-- put_stack_uxn_opcodes_h_l847_c3_16e3
put_stack_uxn_opcodes_h_l847_c3_16e3 : entity work.put_stack_0CLK_12466044 port map (
clk,
put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index,
put_stack_uxn_opcodes_h_l847_c3_16e3_offset,
put_stack_uxn_opcodes_h_l847_c3_16e3_value);



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
 t_register_uxn_opcodes_h_l838_c7_5345_return_output,
 n_register_uxn_opcodes_h_l839_c7_47a1_return_output,
 set_uxn_opcodes_h_l840_c9_31ac_return_output,
 BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output,
 result_MUX_uxn_opcodes_h_l841_c2_4957_return_output,
 tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output,
 result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output,
 tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output,
 halt_uxn_opcodes_h_l843_c10_8bd1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output,
 result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_5345_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l838_c7_5345_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_47a1_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l839_c7_47a1_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l840_c9_31ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_8bd1_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_8bd1_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l843_c10_8bd1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l840_c9_31ac_mul := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l840_c9_31ac_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l843_c10_8bd1_err := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l843_c10_8bd1_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l840_c9_31ac_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l840_c9_31ac_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l839_c7_47a1_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l840_c9_31ac_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l838_c7_5345_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l838_c7_5345] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l838_c7_5345_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l838_c7_5345_stack_index <= VAR_t_register_uxn_opcodes_h_l838_c7_5345_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l838_c7_5345_return_output := t_register_uxn_opcodes_h_l838_c7_5345_return_output;

     -- set[uxn_opcodes_h_l840_c9_31ac] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l840_c9_31ac_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l840_c9_31ac_stack_index <= VAR_set_uxn_opcodes_h_l840_c9_31ac_stack_index;
     set_uxn_opcodes_h_l840_c9_31ac_ins <= VAR_set_uxn_opcodes_h_l840_c9_31ac_ins;
     set_uxn_opcodes_h_l840_c9_31ac_k <= VAR_set_uxn_opcodes_h_l840_c9_31ac_k;
     set_uxn_opcodes_h_l840_c9_31ac_mul <= VAR_set_uxn_opcodes_h_l840_c9_31ac_mul;
     set_uxn_opcodes_h_l840_c9_31ac_add <= VAR_set_uxn_opcodes_h_l840_c9_31ac_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l840_c9_31ac_return_output := set_uxn_opcodes_h_l840_c9_31ac_return_output;

     -- n_register[uxn_opcodes_h_l839_c7_47a1] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l839_c7_47a1_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l839_c7_47a1_stack_index <= VAR_n_register_uxn_opcodes_h_l839_c7_47a1_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l839_c7_47a1_return_output := n_register_uxn_opcodes_h_l839_c7_47a1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left := VAR_n_register_uxn_opcodes_h_l839_c7_47a1_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l839_c7_47a1_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left := VAR_set_uxn_opcodes_h_l840_c9_31ac_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue := VAR_set_uxn_opcodes_h_l840_c9_31ac_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse := VAR_set_uxn_opcodes_h_l840_c9_31ac_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right := VAR_t_register_uxn_opcodes_h_l838_c7_5345_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left := VAR_t_register_uxn_opcodes_h_l838_c7_5345_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l838_c7_5345_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l841_c6_fc5e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_left;
     BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output := BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l847_c29_efc3] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_left;
     BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output := BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l842_c11_1acb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_left;
     BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output := BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output;

     -- Submodule level 2
     VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l847_c29_efc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l842_c11_1acb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l841_c6_fc5e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c7_05ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l842_c1_cb3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l846_c1_39a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l846_c1_39a2_return_output;
     VAR_halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l842_c1_cb3e_return_output;
     -- put_stack[uxn_opcodes_h_l847_c3_16e3] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index <= VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_stack_index;
     put_stack_uxn_opcodes_h_l847_c3_16e3_offset <= VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_offset;
     put_stack_uxn_opcodes_h_l847_c3_16e3_value <= VAR_put_stack_uxn_opcodes_h_l847_c3_16e3_value;
     -- Outputs

     -- halt[uxn_opcodes_h_l843_c10_8bd1] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l843_c10_8bd1_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l843_c10_8bd1_ins <= VAR_halt_uxn_opcodes_h_l843_c10_8bd1_ins;
     halt_uxn_opcodes_h_l843_c10_8bd1_err <= VAR_halt_uxn_opcodes_h_l843_c10_8bd1_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l843_c10_8bd1_return_output := halt_uxn_opcodes_h_l843_c10_8bd1_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left := VAR_halt_uxn_opcodes_h_l843_c10_8bd1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue := VAR_halt_uxn_opcodes_h_l843_c10_8bd1_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l844_c7_f2b9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_left;
     BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output := BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l842_c7_05ad] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_cond;
     tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue;
     tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output := tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l844_c7_f2b9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l841_c2_4957] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_cond;
     tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iftrue;
     tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output := tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output;

     -- result_MUX[uxn_opcodes_h_l844_c3_1c6a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond <= VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_cond;
     result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iftrue;
     result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output := result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue := VAR_result_MUX_uxn_opcodes_h_l844_c3_1c6a_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l841_c2_4957_return_output;
     -- result_MUX[uxn_opcodes_h_l842_c7_05ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l842_c7_05ad_cond <= VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_cond;
     result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue <= VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iftrue;
     result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse <= VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output := result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse := VAR_result_MUX_uxn_opcodes_h_l842_c7_05ad_return_output;
     -- result_MUX[uxn_opcodes_h_l841_c2_4957] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l841_c2_4957_cond <= VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_cond;
     result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue <= VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iftrue;
     result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse <= VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_return_output := result_MUX_uxn_opcodes_h_l841_c2_4957_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l841_c2_4957_return_output;
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
