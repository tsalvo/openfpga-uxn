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
entity opc_div2_0CLK_6a02a47d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_div2_0CLK_6a02a47d;
architecture arch of opc_div2_0CLK_6a02a47d is
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
-- t2_register[uxn_opcodes_h_l857_c8_b4e4]
signal t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l858_c8_4e1f]
signal n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l859_c9_fb50]
signal set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l859_c9_fb50_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l860_c6_2ab0]
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_103f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l860_c2_081e]
signal tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l860_c2_081e]
signal result_MUX_uxn_opcodes_h_l860_c2_081e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l860_c2_081e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_9c4e]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_3020]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_ae86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l861_c7_103f]
signal tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l861_c7_103f]
signal result_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(0 downto 0);

-- halt[uxn_opcodes_h_l862_c10_06af]
signal halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_opcodes_h_l862_c10_06af_ins : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_06af_err : unsigned(7 downto 0);
signal halt_uxn_opcodes_h_l862_c10_06af_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l863_c7_ec3c]
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l863_c3_6774]
signal result_MUX_uxn_opcodes_h_l863_c3_6774_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l863_c3_6774_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l866_c30_3249]
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l866_c3_45c7]
signal put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_45c7_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l866_c3_45c7_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l857_c8_b4e4
t2_register_uxn_opcodes_h_l857_c8_b4e4 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index,
t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output);

-- n2_register_uxn_opcodes_h_l858_c8_4e1f
n2_register_uxn_opcodes_h_l858_c8_4e1f : entity work.n2_register_0CLK_efc3e079 port map (
clk,
n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index,
n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output);

-- set_uxn_opcodes_h_l859_c9_fb50
set_uxn_opcodes_h_l859_c9_fb50 : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE,
set_uxn_opcodes_h_l859_c9_fb50_stack_index,
set_uxn_opcodes_h_l859_c9_fb50_ins,
set_uxn_opcodes_h_l859_c9_fb50_k,
set_uxn_opcodes_h_l859_c9_fb50_mul,
set_uxn_opcodes_h_l859_c9_fb50_add,
set_uxn_opcodes_h_l859_c9_fb50_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0
BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left,
BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right,
BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l860_c2_081e
tmp8_MUX_uxn_opcodes_h_l860_c2_081e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond,
tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue,
tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse,
tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output);

-- result_MUX_uxn_opcodes_h_l860_c2_081e
result_MUX_uxn_opcodes_h_l860_c2_081e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l860_c2_081e_cond,
result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue,
result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse,
result_MUX_uxn_opcodes_h_l860_c2_081e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output);

-- tmp8_MUX_uxn_opcodes_h_l861_c7_103f
tmp8_MUX_uxn_opcodes_h_l861_c7_103f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond,
tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue,
tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse,
tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output);

-- result_MUX_uxn_opcodes_h_l861_c7_103f
result_MUX_uxn_opcodes_h_l861_c7_103f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l861_c7_103f_cond,
result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue,
result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse,
result_MUX_uxn_opcodes_h_l861_c7_103f_return_output);

-- halt_uxn_opcodes_h_l862_c10_06af
halt_uxn_opcodes_h_l862_c10_06af : entity work.halt_0CLK_0b25530d port map (
clk,
halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE,
halt_uxn_opcodes_h_l862_c10_06af_ins,
halt_uxn_opcodes_h_l862_c10_06af_err,
halt_uxn_opcodes_h_l862_c10_06af_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c
BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left,
BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right,
BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output);

-- result_MUX_uxn_opcodes_h_l863_c3_6774
result_MUX_uxn_opcodes_h_l863_c3_6774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l863_c3_6774_cond,
result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue,
result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse,
result_MUX_uxn_opcodes_h_l863_c3_6774_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249
BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right,
BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output);

-- put2_stack_uxn_opcodes_h_l866_c3_45c7
put2_stack_uxn_opcodes_h_l866_c3_45c7 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index,
put2_stack_uxn_opcodes_h_l866_c3_45c7_offset,
put2_stack_uxn_opcodes_h_l866_c3_45c7_value);



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
 t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output,
 n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output,
 set_uxn_opcodes_h_l859_c9_fb50_return_output,
 BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output,
 tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output,
 result_MUX_uxn_opcodes_h_l860_c2_081e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output,
 tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output,
 result_MUX_uxn_opcodes_h_l861_c7_103f_return_output,
 halt_uxn_opcodes_h_l862_c10_06af_return_output,
 BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output,
 result_MUX_uxn_opcodes_h_l863_c3_6774_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l859_c9_fb50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_06af_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_06af_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_opcodes_h_l862_c10_06af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l859_c9_fb50_mul := resize(to_unsigned(4, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l859_c9_fb50_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_opcodes_h_l862_c10_06af_err := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_opcodes_h_l862_c10_06af_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_fb50_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l859_c9_fb50_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l859_c9_fb50_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l857_c8_b4e4] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index <= VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output := t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output;

     -- set[uxn_opcodes_h_l859_c9_fb50] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l859_c9_fb50_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l859_c9_fb50_stack_index <= VAR_set_uxn_opcodes_h_l859_c9_fb50_stack_index;
     set_uxn_opcodes_h_l859_c9_fb50_ins <= VAR_set_uxn_opcodes_h_l859_c9_fb50_ins;
     set_uxn_opcodes_h_l859_c9_fb50_k <= VAR_set_uxn_opcodes_h_l859_c9_fb50_k;
     set_uxn_opcodes_h_l859_c9_fb50_mul <= VAR_set_uxn_opcodes_h_l859_c9_fb50_mul;
     set_uxn_opcodes_h_l859_c9_fb50_add <= VAR_set_uxn_opcodes_h_l859_c9_fb50_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l859_c9_fb50_return_output := set_uxn_opcodes_h_l859_c9_fb50_return_output;

     -- n2_register[uxn_opcodes_h_l858_c8_4e1f] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index <= VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output := n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left := VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l858_c8_4e1f_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left := VAR_set_uxn_opcodes_h_l859_c9_fb50_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue := VAR_set_uxn_opcodes_h_l859_c9_fb50_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse := VAR_set_uxn_opcodes_h_l859_c9_fb50_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right := VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left := VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l857_c8_b4e4_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_9c4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l866_c30_3249] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_left;
     BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output := BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l860_c6_2ab0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_left;
     BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output := BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_value := VAR_BIN_OP_DIV_uxn_opcodes_h_l866_c30_3249_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_9c4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l860_c6_2ab0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c7_103f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c7_103f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l865_c1_ae86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l861_c1_3020] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l865_c1_ae86_return_output;
     VAR_halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l861_c1_3020_return_output;
     -- put2_stack[uxn_opcodes_h_l866_c3_45c7] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index <= VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_stack_index;
     put2_stack_uxn_opcodes_h_l866_c3_45c7_offset <= VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_offset;
     put2_stack_uxn_opcodes_h_l866_c3_45c7_value <= VAR_put2_stack_uxn_opcodes_h_l866_c3_45c7_value;
     -- Outputs

     -- halt[uxn_opcodes_h_l862_c10_06af] LATENCY=0
     -- Clock enable
     halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE <= VAR_halt_uxn_opcodes_h_l862_c10_06af_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_opcodes_h_l862_c10_06af_ins <= VAR_halt_uxn_opcodes_h_l862_c10_06af_ins;
     halt_uxn_opcodes_h_l862_c10_06af_err <= VAR_halt_uxn_opcodes_h_l862_c10_06af_err;
     -- Outputs
     VAR_halt_uxn_opcodes_h_l862_c10_06af_return_output := halt_uxn_opcodes_h_l862_c10_06af_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left := VAR_halt_uxn_opcodes_h_l862_c10_06af_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue := VAR_halt_uxn_opcodes_h_l862_c10_06af_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l861_c7_103f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_cond;
     tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output := tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l863_c7_ec3c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_left;
     BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output := BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l863_c7_ec3c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l861_c7_103f_return_output;
     -- result_MUX[uxn_opcodes_h_l863_c3_6774] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l863_c3_6774_cond <= VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_cond;
     result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue <= VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iftrue;
     result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse <= VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_return_output := result_MUX_uxn_opcodes_h_l863_c3_6774_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l860_c2_081e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_cond;
     tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output := tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue := VAR_result_MUX_uxn_opcodes_h_l863_c3_6774_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l860_c2_081e_return_output;
     -- result_MUX[uxn_opcodes_h_l861_c7_103f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l861_c7_103f_cond <= VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_cond;
     result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iftrue;
     result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_return_output := result_MUX_uxn_opcodes_h_l861_c7_103f_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse := VAR_result_MUX_uxn_opcodes_h_l861_c7_103f_return_output;
     -- result_MUX[uxn_opcodes_h_l860_c2_081e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l860_c2_081e_cond <= VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_cond;
     result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iftrue;
     result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_return_output := result_MUX_uxn_opcodes_h_l860_c2_081e_return_output;

     -- Submodule level 9
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l860_c2_081e_return_output;
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
