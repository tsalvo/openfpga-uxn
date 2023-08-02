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
-- t2_register[uxn_opcodes_h_l857_c8_eb1e]
signal t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_8417]
signal n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_8417_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_8417_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_ab80]
signal set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_ab80_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_45b2]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_c06a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_6ed7]
signal result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_6ed7]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_aa73]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_976e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_aaba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_c06a]
signal result_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_c06a]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l862_c10_e5a5]
signal halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_e5a5_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_e5a5_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_e5a5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_f0f2]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_cbd7]
signal result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_108a]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_0120]
signal put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0120_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0120_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_eb1e
t2_register_uxn_opcodes_h_l857_c8_eb1e : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index,
t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_8417
n2_register_uxn_opcodes_h_l858_c8_8417 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_8417_stack_index,
n2_register_uxn_opcodes_h_l858_c8_8417_return_output);

-- set_uxn_opcodes_h_l859_c9_ab80
set_uxn_opcodes_h_l859_c9_ab80 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_ab80_stack_index,
set_uxn_opcodes_h_l859_c9_ab80_ins,
set_uxn_opcodes_h_l859_c9_ab80_k,
set_uxn_opcodes_h_l859_c9_ab80_mul,
set_uxn_opcodes_h_l859_c9_ab80_add,
set_uxn_opcodes_h_l859_c9_ab80_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2
BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_6ed7
result_MUX_uxn_opcodes_h_l860_c2_6ed7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond,
result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7
tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73
BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_c06a
result_MUX_uxn_opcodes_h_l861_c7_c06a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_c06a_cond,
result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_c06a
tmp8_MUX_uxn_opcodes_h_l861_c7_c06a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output);

-- halt_uxn_opcodes_h_l862_c10_e5a5
halt_uxn_opcodes_h_l862_c10_e5a5 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_e5a5_ins,
halt_uxn_opcodes_h_l862_c10_e5a5_err,
halt_uxn_opcodes_h_l862_c10_e5a5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2
BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_cbd7
result_MUX_uxn_opcodes_h_l863_c3_cbd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond,
result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a
BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_0120
put2_stack_uxn_opcodes_h_l866_c3_0120 : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_0120_offset,
put2_stack_uxn_opcodes_h_l866_c3_0120_value);



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
 t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output,
 n2_register_uxn_opcodes_h_l858_c8_8417_return_output,
 set_uxn_opcodes_h_l859_c9_ab80_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output,
 halt_uxn_opcodes_h_l862_c10_e5a5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_8417_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_8417_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_ab80_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_e5a5_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_e5a5_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_e5a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l859_c9_ab80_mul := resize(to_unsigned(4, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l862_c10_e5a5_err := resize(to_unsigned(3, 2), 8);
     VAR_set_uxn_opcodes_h_l859_c9_ab80_add := resize(to_signed(-2, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_e5a5_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_ab80_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_ab80_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_8417_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_ab80_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l857_c8_eb1e] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output := t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output;

     -- set[uxn_opcodes_h_l859_c9_ab80] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_ab80_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_ab80_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_ab80_stack_index;
     set_uxn_opcodes_h_l859_c9_ab80_ins <= VAR_set_uxn_opcodes_h_l859_c9_ab80_ins;
     set_uxn_opcodes_h_l859_c9_ab80_k <= VAR_set_uxn_opcodes_h_l859_c9_ab80_k;
     set_uxn_opcodes_h_l859_c9_ab80_mul <= VAR_set_uxn_opcodes_h_l859_c9_ab80_mul;
     set_uxn_opcodes_h_l859_c9_ab80_add <= VAR_set_uxn_opcodes_h_l859_c9_ab80_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_ab80_return_output := set_uxn_opcodes_h_l859_c9_ab80_return_output;

     -- n2_register[uxn_opcodes_h_l858_c8_8417] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_8417_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_8417_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_8417_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_8417_return_output := n2_register_uxn_opcodes_h_l858_c8_8417_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left := VAR_n2_register_uxn_opcodes_h_l858_c8_8417_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_8417_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left := VAR_set_uxn_opcodes_h_l859_c9_ab80_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue := VAR_set_uxn_opcodes_h_l859_c9_ab80_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse := VAR_set_uxn_opcodes_h_l859_c9_ab80_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right := VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left := VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_eb1e_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_aa73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_108a] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_45b2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_108a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_aa73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_45b2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_c06a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_976e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_aaba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_aaba_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_976e_return_output;
     -- halt[uxn_opcodes_h_l862_c10_e5a5] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_e5a5_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_e5a5_ins <= VAR_halt_uxn_opcodes_h_l862_c10_e5a5_ins;
     halt_uxn_opcodes_h_l862_c10_e5a5_err <= VAR_halt_uxn_opcodes_h_l862_c10_e5a5_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_e5a5_return_output := halt_uxn_opcodes_h_l862_c10_e5a5_return_output;

     -- put2_stack[uxn_opcodes_h_l866_c3_0120] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_0120_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_offset;
     put2_stack_uxn_opcodes_h_l866_c3_0120_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0120_value;
     -- Outputs

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left := VAR_halt_uxn_opcodes_h_l862_c10_e5a5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_e5a5_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l861_c7_c06a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_f0f2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_f0f2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l860_c2_6ed7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output;

     -- result_MUX[uxn_opcodes_h_l863_c3_cbd7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_cond;
     result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output := result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_cbd7_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_c06a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_c06a_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_cond;
     result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output := result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_c06a_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_6ed7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_cond;
     result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output := result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_6ed7_return_output;
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
