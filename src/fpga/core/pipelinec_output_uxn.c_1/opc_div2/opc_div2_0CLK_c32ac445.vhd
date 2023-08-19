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
entity opc_div2_0CLK_c32ac445 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div2_0CLK_c32ac445;
architecture arch of opc_div2_0CLK_c32ac445 is
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
-- t2_register[uxn_opcodes_h_l857_c8_f099]
signal t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_f099_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_f099_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_b45f]
signal n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_b45f_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_5733]
signal set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_5733_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_c445]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_0060]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_f36c]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_f36c]
signal result_MUX_uxn_opcodes_h_l860_c2_f36c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_7452]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_0779]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_acf1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_0060]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_0060]
signal result_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(0 downto 0);

-- halt[uxn_opcodes_h_l862_c10_5418]
signal halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_5418_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_5418_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_5418_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_8b42]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_cc5f]
signal result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_0bf1]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_19a1]
signal put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_19a1_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_19a1_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_f099
t2_register_uxn_opcodes_h_l857_c8_f099 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_f099_stack_index,
t2_register_uxn_opcodes_h_l857_c8_f099_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_b45f
n2_register_uxn_opcodes_h_l858_c8_b45f : entity work.n2_register_0CLK_efc3e079 port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index,
n2_register_uxn_opcodes_h_l858_c8_b45f_return_output);

-- set_uxn_opcodes_h_l859_c9_5733
set_uxn_opcodes_h_l859_c9_5733 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_5733_stack_index,
set_uxn_opcodes_h_l859_c9_5733_ins,
set_uxn_opcodes_h_l859_c9_5733_k,
set_uxn_opcodes_h_l859_c9_5733_mul,
set_uxn_opcodes_h_l859_c9_5733_add,
set_uxn_opcodes_h_l859_c9_5733_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_c445
BIN_OP_GT_uxn_opcodes_h_l860_c6_c445 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_f36c
tmp8_MUX_uxn_opcodes_h_l860_c2_f36c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_f36c
result_MUX_uxn_opcodes_h_l860_c2_f36c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_f36c_cond,
result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_0060
tmp8_MUX_uxn_opcodes_h_l861_c7_0060 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_0060
result_MUX_uxn_opcodes_h_l861_c7_0060 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_0060_cond,
result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_0060_return_output);

-- halt_uxn_opcodes_h_l862_c10_5418
halt_uxn_opcodes_h_l862_c10_5418 : entity work.halt_0CLK_fd588851 port map (
clk,
halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_5418_ins,
halt_uxn_opcodes_h_l862_c10_5418_err,
halt_uxn_opcodes_h_l862_c10_5418_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42
BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_cc5f
result_MUX_uxn_opcodes_h_l863_c3_cc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond,
result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1
BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_19a1
put2_stack_uxn_opcodes_h_l866_c3_19a1 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_19a1_offset,
put2_stack_uxn_opcodes_h_l866_c3_19a1_value);



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
 t2_register_uxn_opcodes_h_l857_c8_f099_return_output,
 n2_register_uxn_opcodes_h_l858_c8_b45f_return_output,
 set_uxn_opcodes_h_l859_c9_5733_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_0060_return_output,
 halt_uxn_opcodes_h_l862_c10_5418_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_f099_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_f099_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_5733_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_5418_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_5418_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_5418_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_offset := resize(to_unsigned(0, 1), 8);
     VAR_halt_uxn_opcodes_h_l862_c10_5418_err := resize(to_unsigned(3, 2), 8);
     VAR_set_uxn_opcodes_h_l859_c9_5733_mul := resize(to_unsigned(4, 3), 8);
     VAR_set_uxn_opcodes_h_l859_c9_5733_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_5418_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_5733_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_5733_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_5733_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_f099_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l857_c8_f099] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_f099_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_f099_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_f099_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_f099_return_output := t2_register_uxn_opcodes_h_l857_c8_f099_return_output;

     -- n2_register[uxn_opcodes_h_l858_c8_b45f] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_return_output := n2_register_uxn_opcodes_h_l858_c8_b45f_return_output;

     -- set[uxn_opcodes_h_l859_c9_5733] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_5733_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_5733_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_5733_stack_index;
     set_uxn_opcodes_h_l859_c9_5733_ins <= VAR_set_uxn_opcodes_h_l859_c9_5733_ins;
     set_uxn_opcodes_h_l859_c9_5733_k <= VAR_set_uxn_opcodes_h_l859_c9_5733_k;
     set_uxn_opcodes_h_l859_c9_5733_mul <= VAR_set_uxn_opcodes_h_l859_c9_5733_mul;
     set_uxn_opcodes_h_l859_c9_5733_add <= VAR_set_uxn_opcodes_h_l859_c9_5733_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_5733_return_output := set_uxn_opcodes_h_l859_c9_5733_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left := VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_b45f_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left := VAR_set_uxn_opcodes_h_l859_c9_5733_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue := VAR_set_uxn_opcodes_h_l859_c9_5733_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse := VAR_set_uxn_opcodes_h_l859_c9_5733_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right := VAR_t2_register_uxn_opcodes_h_l857_c8_f099_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left := VAR_t2_register_uxn_opcodes_h_l857_c8_f099_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_f099_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_c445] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_0bf1] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_7452] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_0bf1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_7452_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_c445_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_0060] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_0060_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_acf1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_0779] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_acf1_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_0779_return_output;
     -- put2_stack[uxn_opcodes_h_l866_c3_19a1] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_19a1_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_offset;
     put2_stack_uxn_opcodes_h_l866_c3_19a1_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_19a1_value;
     -- Outputs

     -- halt[uxn_opcodes_h_l862_c10_5418] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_5418_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_5418_ins <= VAR_halt_uxn_opcodes_h_l862_c10_5418_ins;
     halt_uxn_opcodes_h_l862_c10_5418_err <= VAR_halt_uxn_opcodes_h_l862_c10_5418_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_5418_return_output := halt_uxn_opcodes_h_l862_c10_5418_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left := VAR_halt_uxn_opcodes_h_l862_c10_5418_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_5418_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_8b42] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l861_c7_0060] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_8b42_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_0060_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l860_c2_f36c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output;

     -- result_MUX[uxn_opcodes_h_l863_c3_cc5f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_cond;
     result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output := result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_cc5f_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_f36c_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_0060] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_0060_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_cond;
     result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_return_output := result_MUX_uxn_opcodes_h_l861_c7_0060_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_0060_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_f36c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_f36c_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_cond;
     result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output := result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_f36c_return_output;
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
