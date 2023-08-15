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
-- t2_register[uxn_opcodes_h_l857_c8_e8a6]
signal t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_1704]
signal n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_1704_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_1704_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_8273]
signal set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_8273_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_140d]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_9e0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_599f]
signal result_MUX_uxn_opcodes_h_l860_c2_599f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_599f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_599f]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_c3fb]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_8668]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_f2e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_9e0c]
signal result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_9e0c]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(7 downto 0);

-- halt[uxn_opcodes_h_l862_c10_14c8]
signal halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_14c8_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_14c8_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_14c8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_b04a]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_2257]
signal result_MUX_uxn_opcodes_h_l863_c3_2257_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_2257_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_33c2]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_0229]
signal put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0229_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_0229_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_e8a6
t2_register_uxn_opcodes_h_l857_c8_e8a6 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index,
t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_1704
n2_register_uxn_opcodes_h_l858_c8_1704 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_1704_stack_index,
n2_register_uxn_opcodes_h_l858_c8_1704_return_output);

-- set_uxn_opcodes_h_l859_c9_8273
set_uxn_opcodes_h_l859_c9_8273 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_8273_stack_index,
set_uxn_opcodes_h_l859_c9_8273_ins,
set_uxn_opcodes_h_l859_c9_8273_k,
set_uxn_opcodes_h_l859_c9_8273_mul,
set_uxn_opcodes_h_l859_c9_8273_add,
set_uxn_opcodes_h_l859_c9_8273_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_140d
BIN_OP_GT_uxn_opcodes_h_l860_c6_140d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_599f
result_MUX_uxn_opcodes_h_l860_c2_599f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_599f_cond,
result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_599f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_599f
tmp8_MUX_uxn_opcodes_h_l860_c2_599f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_9e0c
result_MUX_uxn_opcodes_h_l861_c7_9e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond,
result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c
tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output);

-- halt_uxn_opcodes_h_l862_c10_14c8
halt_uxn_opcodes_h_l862_c10_14c8 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_14c8_ins,
halt_uxn_opcodes_h_l862_c10_14c8_err,
halt_uxn_opcodes_h_l862_c10_14c8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a
BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_2257
result_MUX_uxn_opcodes_h_l863_c3_2257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_2257_cond,
result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_2257_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2
BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_0229
put2_stack_uxn_opcodes_h_l866_c3_0229 : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_0229_offset,
put2_stack_uxn_opcodes_h_l866_c3_0229_value);



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
 t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output,
 n2_register_uxn_opcodes_h_l858_c8_1704_return_output,
 set_uxn_opcodes_h_l859_c9_8273_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_599f_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output,
 halt_uxn_opcodes_h_l862_c10_14c8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_2257_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_1704_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_1704_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_8273_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_14c8_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_14c8_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_14c8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_halt_uxn_opcodes_h_l862_c10_14c8_err := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l859_c9_8273_mul := resize(to_unsigned(4, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l859_c9_8273_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_14c8_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_8273_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_8273_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_1704_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_8273_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l859_c9_8273] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_8273_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_8273_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_8273_stack_index;
     set_uxn_opcodes_h_l859_c9_8273_ins <= VAR_set_uxn_opcodes_h_l859_c9_8273_ins;
     set_uxn_opcodes_h_l859_c9_8273_k <= VAR_set_uxn_opcodes_h_l859_c9_8273_k;
     set_uxn_opcodes_h_l859_c9_8273_mul <= VAR_set_uxn_opcodes_h_l859_c9_8273_mul;
     set_uxn_opcodes_h_l859_c9_8273_add <= VAR_set_uxn_opcodes_h_l859_c9_8273_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_8273_return_output := set_uxn_opcodes_h_l859_c9_8273_return_output;

     -- n2_register[uxn_opcodes_h_l858_c8_1704] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_1704_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_1704_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_1704_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_1704_return_output := n2_register_uxn_opcodes_h_l858_c8_1704_return_output;

     -- t2_register[uxn_opcodes_h_l857_c8_e8a6] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output := t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left := VAR_n2_register_uxn_opcodes_h_l858_c8_1704_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_1704_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left := VAR_set_uxn_opcodes_h_l859_c9_8273_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue := VAR_set_uxn_opcodes_h_l859_c9_8273_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse := VAR_set_uxn_opcodes_h_l859_c9_8273_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right := VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left := VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_e8a6_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_33c2] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_140d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_c3fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_33c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c3fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_140d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_9e0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_8668] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_f2e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_f2e7_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_8668_return_output;
     -- halt[uxn_opcodes_h_l862_c10_14c8] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_14c8_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_14c8_ins <= VAR_halt_uxn_opcodes_h_l862_c10_14c8_ins;
     halt_uxn_opcodes_h_l862_c10_14c8_err <= VAR_halt_uxn_opcodes_h_l862_c10_14c8_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_14c8_return_output := halt_uxn_opcodes_h_l862_c10_14c8_return_output;

     -- put2_stack[uxn_opcodes_h_l866_c3_0229] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_0229_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_offset;
     put2_stack_uxn_opcodes_h_l866_c3_0229_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_0229_value;
     -- Outputs

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left := VAR_halt_uxn_opcodes_h_l862_c10_14c8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_14c8_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_b04a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l861_c7_9e0c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_b04a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l860_c2_599f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output;

     -- result_MUX[uxn_opcodes_h_l863_c3_2257] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_2257_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_cond;
     result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_return_output := result_MUX_uxn_opcodes_h_l863_c3_2257_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_2257_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_599f_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_9e0c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_cond;
     result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output := result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_9e0c_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_599f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_599f_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_cond;
     result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_return_output := result_MUX_uxn_opcodes_h_l860_c2_599f_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_599f_return_output;
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
