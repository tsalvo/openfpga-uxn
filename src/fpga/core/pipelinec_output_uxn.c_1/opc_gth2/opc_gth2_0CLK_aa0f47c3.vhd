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
-- Submodules: 9
entity opc_gth2_0CLK_aa0f47c3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_gth2_0CLK_aa0f47c3;
architecture arch of opc_gth2_0CLK_aa0f47c3 is
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
-- t2_register[uxn_opcodes_h_l349_c8_2568]
signal t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l349_c8_2568_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l349_c8_2568_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l350_c8_c6e8]
signal n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l351_c9_6b33]
signal set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l351_c9_6b33_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l352_c6_1e2f]
signal BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l353_c1_55ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l352_c2_1a0e]
signal result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l354_c30_00e7]
signal BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l354_c30_4f39]
signal MUX_uxn_opcodes_h_l354_c30_4f39_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l354_c30_4f39_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l354_c30_4f39_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l354_c30_4f39_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l354_c3_7870]
signal put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l354_c3_7870_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l354_c3_7870_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l349_c8_2568
t2_register_uxn_opcodes_h_l349_c8_2568 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l349_c8_2568_stack_index,
t2_register_uxn_opcodes_h_l349_c8_2568_return_output);

-- n2_register_uxn_opcodes_h_l350_c8_c6e8
n2_register_uxn_opcodes_h_l350_c8_c6e8 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index,
n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output);

-- set_uxn_opcodes_h_l351_c9_6b33
set_uxn_opcodes_h_l351_c9_6b33 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE,
set_uxn_opcodes_h_l351_c9_6b33_stack_index,
set_uxn_opcodes_h_l351_c9_6b33_ins,
set_uxn_opcodes_h_l351_c9_6b33_k,
set_uxn_opcodes_h_l351_c9_6b33_mul,
set_uxn_opcodes_h_l351_c9_6b33_add,
set_uxn_opcodes_h_l351_c9_6b33_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f
BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left,
BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right,
BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output);

-- result_MUX_uxn_opcodes_h_l352_c2_1a0e
result_MUX_uxn_opcodes_h_l352_c2_1a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond,
result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue,
result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse,
result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7
BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left,
BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right,
BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output);

-- MUX_uxn_opcodes_h_l354_c30_4f39
MUX_uxn_opcodes_h_l354_c30_4f39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l354_c30_4f39_cond,
MUX_uxn_opcodes_h_l354_c30_4f39_iftrue,
MUX_uxn_opcodes_h_l354_c30_4f39_iffalse,
MUX_uxn_opcodes_h_l354_c30_4f39_return_output);

-- put2_stack_uxn_opcodes_h_l354_c3_7870
put2_stack_uxn_opcodes_h_l354_c3_7870 : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index,
put2_stack_uxn_opcodes_h_l354_c3_7870_offset,
put2_stack_uxn_opcodes_h_l354_c3_7870_value);



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
 t2_register_uxn_opcodes_h_l349_c8_2568_return_output,
 n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output,
 set_uxn_opcodes_h_l351_c9_6b33_return_output,
 BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output,
 result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output,
 MUX_uxn_opcodes_h_l354_c30_4f39_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l349_c8_2568_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l349_c8_2568_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l351_c9_6b33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_value : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l354_c30_4f39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l354_c30_4f39_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l351_c9_6b33_add := resize(to_signed(-3, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iftrue := resize(to_unsigned(1, 1), 16);
     VAR_set_uxn_opcodes_h_l351_c9_6b33_mul := resize(to_unsigned(4, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l351_c9_6b33_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l351_c9_6b33_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l351_c9_6b33_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l349_c8_2568_stack_index := VAR_stack_index;
     -- n2_register[uxn_opcodes_h_l350_c8_c6e8] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index <= VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output := n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output;

     -- set[uxn_opcodes_h_l351_c9_6b33] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l351_c9_6b33_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l351_c9_6b33_stack_index <= VAR_set_uxn_opcodes_h_l351_c9_6b33_stack_index;
     set_uxn_opcodes_h_l351_c9_6b33_ins <= VAR_set_uxn_opcodes_h_l351_c9_6b33_ins;
     set_uxn_opcodes_h_l351_c9_6b33_k <= VAR_set_uxn_opcodes_h_l351_c9_6b33_k;
     set_uxn_opcodes_h_l351_c9_6b33_mul <= VAR_set_uxn_opcodes_h_l351_c9_6b33_mul;
     set_uxn_opcodes_h_l351_c9_6b33_add <= VAR_set_uxn_opcodes_h_l351_c9_6b33_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l351_c9_6b33_return_output := set_uxn_opcodes_h_l351_c9_6b33_return_output;

     -- t2_register[uxn_opcodes_h_l349_c8_2568] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l349_c8_2568_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l349_c8_2568_stack_index <= VAR_t2_register_uxn_opcodes_h_l349_c8_2568_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l349_c8_2568_return_output := t2_register_uxn_opcodes_h_l349_c8_2568_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left := VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l350_c8_c6e8_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left := VAR_set_uxn_opcodes_h_l351_c9_6b33_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l351_c9_6b33_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right := VAR_t2_register_uxn_opcodes_h_l349_c8_2568_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l349_c8_2568_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l352_c6_1e2f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_left;
     BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output := BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l354_c30_00e7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_left;
     BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output := BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l352_c6_1e2f_return_output;
     VAR_MUX_uxn_opcodes_h_l354_c30_4f39_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l354_c30_00e7_return_output;
     -- MUX[uxn_opcodes_h_l354_c30_4f39] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l354_c30_4f39_cond <= VAR_MUX_uxn_opcodes_h_l354_c30_4f39_cond;
     MUX_uxn_opcodes_h_l354_c30_4f39_iftrue <= VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iftrue;
     MUX_uxn_opcodes_h_l354_c30_4f39_iffalse <= VAR_MUX_uxn_opcodes_h_l354_c30_4f39_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l354_c30_4f39_return_output := MUX_uxn_opcodes_h_l354_c30_4f39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l353_c1_55ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output;

     -- result_MUX[uxn_opcodes_h_l352_c2_1a0e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond <= VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_cond;
     result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iftrue;
     result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output := result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l353_c1_55ef_return_output;
     VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_value := VAR_MUX_uxn_opcodes_h_l354_c30_4f39_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l352_c2_1a0e_return_output;
     -- put2_stack[uxn_opcodes_h_l354_c3_7870] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index <= VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_stack_index;
     put2_stack_uxn_opcodes_h_l354_c3_7870_offset <= VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_offset;
     put2_stack_uxn_opcodes_h_l354_c3_7870_value <= VAR_put2_stack_uxn_opcodes_h_l354_c3_7870_value;
     -- Outputs

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