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
entity opc_div2_0CLK_e1a1d759 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div2_0CLK_e1a1d759;
architecture arch of opc_div2_0CLK_e1a1d759 is
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
-- t2_register[uxn_opcodes_h_l857_c8_15d7]
signal t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_15d7_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_a5fc]
signal n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_8a8b]
signal set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8a8b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_fbb1]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_4f70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_5886]
signal result_MUX_uxn_opcodes_h_l860_c2_5886_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_5886_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_5886]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_8357]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_760b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_d828]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_4f70]
signal result_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_4f70]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l862_c10_8164]
signal halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_8164_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_8164_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_8164_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_a173]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_b521]
signal result_MUX_uxn_opcodes_h_l863_c3_b521_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_b521_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_6068]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_f1ef]
signal put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_f1ef_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_15d7
t2_register_uxn_opcodes_h_l857_c8_15d7 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index,
t2_register_uxn_opcodes_h_l857_c8_15d7_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_a5fc
n2_register_uxn_opcodes_h_l858_c8_a5fc : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index,
n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output);

-- set_uxn_opcodes_h_l859_c9_8a8b
set_uxn_opcodes_h_l859_c9_8a8b : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_8a8b_stack_index,
set_uxn_opcodes_h_l859_c9_8a8b_ins,
set_uxn_opcodes_h_l859_c9_8a8b_k,
set_uxn_opcodes_h_l859_c9_8a8b_mul,
set_uxn_opcodes_h_l859_c9_8a8b_add,
set_uxn_opcodes_h_l859_c9_8a8b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1
BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_5886
result_MUX_uxn_opcodes_h_l860_c2_5886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_5886_cond,
result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_5886_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_5886
tmp8_MUX_uxn_opcodes_h_l860_c2_5886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357
BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_4f70
result_MUX_uxn_opcodes_h_l861_c7_4f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_4f70_cond,
result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_4f70
tmp8_MUX_uxn_opcodes_h_l861_c7_4f70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output);

-- halt_uxn_opcodes_h_l862_c10_8164
halt_uxn_opcodes_h_l862_c10_8164 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_8164_ins,
halt_uxn_opcodes_h_l862_c10_8164_err,
halt_uxn_opcodes_h_l862_c10_8164_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_a173
BIN_OP_GT_uxn_opcodes_h_l863_c7_a173 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_b521
result_MUX_uxn_opcodes_h_l863_c3_b521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_b521_cond,
result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_b521_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068
BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_f1ef
put2_stack_uxn_opcodes_h_l866_c3_f1ef : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset,
put2_stack_uxn_opcodes_h_l866_c3_f1ef_value);



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
 t2_register_uxn_opcodes_h_l857_c8_15d7_return_output,
 n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output,
 set_uxn_opcodes_h_l859_c9_8a8b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_5886_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output,
 halt_uxn_opcodes_h_l862_c10_8164_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_b521_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8a8b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_8164_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_8164_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_8164_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l862_c10_8164_err := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_mul := resize(to_unsigned(4, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_8164_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index := VAR_stack_index;
     -- n2_register[uxn_opcodes_h_l858_c8_a5fc] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output := n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output;

     -- t2_register[uxn_opcodes_h_l857_c8_15d7] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_return_output := t2_register_uxn_opcodes_h_l857_c8_15d7_return_output;

     -- set[uxn_opcodes_h_l859_c9_8a8b] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_8a8b_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_stack_index;
     set_uxn_opcodes_h_l859_c9_8a8b_ins <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_ins;
     set_uxn_opcodes_h_l859_c9_8a8b_k <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_k;
     set_uxn_opcodes_h_l859_c9_8a8b_mul <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_mul;
     set_uxn_opcodes_h_l859_c9_8a8b_add <= VAR_set_uxn_opcodes_h_l859_c9_8a8b_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_8a8b_return_output := set_uxn_opcodes_h_l859_c9_8a8b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left := VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_a5fc_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left := VAR_set_uxn_opcodes_h_l859_c9_8a8b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue := VAR_set_uxn_opcodes_h_l859_c9_8a8b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse := VAR_set_uxn_opcodes_h_l859_c9_8a8b_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right := VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left := VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_15d7_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_8357] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_fbb1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_6068] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_6068_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_8357_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_fbb1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_4f70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_d828] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_760b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_d828_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_760b_return_output;
     -- put2_stack[uxn_opcodes_h_l866_c3_f1ef] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_offset;
     put2_stack_uxn_opcodes_h_l866_c3_f1ef_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_f1ef_value;
     -- Outputs

     -- halt[uxn_opcodes_h_l862_c10_8164] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_8164_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_8164_ins <= VAR_halt_uxn_opcodes_h_l862_c10_8164_ins;
     halt_uxn_opcodes_h_l862_c10_8164_err <= VAR_halt_uxn_opcodes_h_l862_c10_8164_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_8164_return_output := halt_uxn_opcodes_h_l862_c10_8164_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left := VAR_halt_uxn_opcodes_h_l862_c10_8164_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_8164_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l861_c7_4f70] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_a173] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_a173_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;
     -- result_MUX[uxn_opcodes_h_l863_c3_b521] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_b521_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_cond;
     result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_return_output := result_MUX_uxn_opcodes_h_l863_c3_b521_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l860_c2_5886] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_b521_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_5886_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_4f70] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_4f70_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_cond;
     result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output := result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_4f70_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_5886] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_5886_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_cond;
     result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_return_output := result_MUX_uxn_opcodes_h_l860_c2_5886_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_5886_return_output;
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
