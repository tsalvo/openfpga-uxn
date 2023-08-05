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
-- Submodules: 10
entity opc_jcn2_0CLK_fc8f03ff is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn2_0CLK_fc8f03ff;
architecture arch of opc_jcn2_0CLK_fc8f03ff is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l434_c8_c574]
signal t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l434_c8_c574_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l434_c8_c574_return_output : unsigned(15 downto 0);

-- l_register[uxn_opcodes_h_l435_c7_292f]
signal l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l435_c7_292f_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l435_c7_292f_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l436_c9_5d53]
signal set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_5d53_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l437_c6_1229]
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_1fc4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l437_c2_227c]
signal result_MUX_uxn_opcodes_h_l437_c2_227c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_227c_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l438_c11_da03]
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_e523]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l438_c7_1fc4]
signal result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l439_c3_5647]
signal pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l439_c3_5647_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l434_c8_c574
t2_register_uxn_opcodes_h_l434_c8_c574 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l434_c8_c574_stack_index,
t2_register_uxn_opcodes_h_l434_c8_c574_return_output);

-- l_register_uxn_opcodes_h_l435_c7_292f
l_register_uxn_opcodes_h_l435_c7_292f : entity work.l_register_0CLK_9682be37 port map (
clk,
l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE,
l_register_uxn_opcodes_h_l435_c7_292f_stack_index,
l_register_uxn_opcodes_h_l435_c7_292f_return_output);

-- set_uxn_opcodes_h_l436_c9_5d53
set_uxn_opcodes_h_l436_c9_5d53 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE,
set_uxn_opcodes_h_l436_c9_5d53_stack_index,
set_uxn_opcodes_h_l436_c9_5d53_ins,
set_uxn_opcodes_h_l436_c9_5d53_k,
set_uxn_opcodes_h_l436_c9_5d53_mul,
set_uxn_opcodes_h_l436_c9_5d53_add,
set_uxn_opcodes_h_l436_c9_5d53_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l437_c6_1229
BIN_OP_GT_uxn_opcodes_h_l437_c6_1229 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left,
BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right,
BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output);

-- result_MUX_uxn_opcodes_h_l437_c2_227c
result_MUX_uxn_opcodes_h_l437_c2_227c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l437_c2_227c_cond,
result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue,
result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse,
result_MUX_uxn_opcodes_h_l437_c2_227c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l438_c11_da03
BIN_OP_GT_uxn_opcodes_h_l438_c11_da03 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left,
BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right,
BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output);

-- result_MUX_uxn_opcodes_h_l438_c7_1fc4
result_MUX_uxn_opcodes_h_l438_c7_1fc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond,
result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue,
result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse,
result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output);

-- pc_set_uxn_opcodes_h_l439_c3_5647
pc_set_uxn_opcodes_h_l439_c3_5647 : entity work.pc_set_0CLK_b45f1687 port map (
clk,
pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l439_c3_5647_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 n8,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l434_c8_c574_return_output,
 l_register_uxn_opcodes_h_l435_c7_292f_return_output,
 set_uxn_opcodes_h_l436_c9_5d53_return_output,
 BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output,
 result_MUX_uxn_opcodes_h_l437_c2_227c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output,
 result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_c574_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_c574_return_output : unsigned(15 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_292f_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_292f_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_5d53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l439_c3_5647_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l436_c9_5d53_add := resize(to_signed(-3, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l436_c9_5d53_mul := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse := VAR_CLOCK_ENABLE;
     VAR_l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l436_c9_5d53_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l436_c9_5d53_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse := result;
     VAR_l_register_uxn_opcodes_h_l435_c7_292f_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l436_c9_5d53_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l434_c8_c574_stack_index := VAR_stack_index;
     -- l_register[uxn_opcodes_h_l435_c7_292f] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_h_l435_c7_292f_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_h_l435_c7_292f_stack_index <= VAR_l_register_uxn_opcodes_h_l435_c7_292f_stack_index;
     -- Outputs
     VAR_l_register_uxn_opcodes_h_l435_c7_292f_return_output := l_register_uxn_opcodes_h_l435_c7_292f_return_output;

     -- t2_register[uxn_opcodes_h_l434_c8_c574] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l434_c8_c574_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l434_c8_c574_stack_index <= VAR_t2_register_uxn_opcodes_h_l434_c8_c574_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l434_c8_c574_return_output := t2_register_uxn_opcodes_h_l434_c8_c574_return_output;

     -- set[uxn_opcodes_h_l436_c9_5d53] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l436_c9_5d53_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l436_c9_5d53_stack_index <= VAR_set_uxn_opcodes_h_l436_c9_5d53_stack_index;
     set_uxn_opcodes_h_l436_c9_5d53_ins <= VAR_set_uxn_opcodes_h_l436_c9_5d53_ins;
     set_uxn_opcodes_h_l436_c9_5d53_k <= VAR_set_uxn_opcodes_h_l436_c9_5d53_k;
     set_uxn_opcodes_h_l436_c9_5d53_mul <= VAR_set_uxn_opcodes_h_l436_c9_5d53_mul;
     set_uxn_opcodes_h_l436_c9_5d53_add <= VAR_set_uxn_opcodes_h_l436_c9_5d53_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l436_c9_5d53_return_output := set_uxn_opcodes_h_l436_c9_5d53_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left := VAR_l_register_uxn_opcodes_h_l435_c7_292f_return_output;
     REG_VAR_n8 := VAR_l_register_uxn_opcodes_h_l435_c7_292f_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left := VAR_set_uxn_opcodes_h_l436_c9_5d53_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l436_c9_5d53_return_output;
     VAR_pc_set_uxn_opcodes_h_l439_c3_5647_value := VAR_t2_register_uxn_opcodes_h_l434_c8_c574_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l434_c8_c574_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l438_c11_da03] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_left;
     BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output := BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l437_c6_1229] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_left;
     BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output := BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output;
     VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_1229_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output;
     VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_da03_return_output;
     -- result_MUX[uxn_opcodes_h_l438_c7_1fc4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond <= VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_cond;
     result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue;
     result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output := result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_1fc4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse := VAR_result_MUX_uxn_opcodes_h_l438_c7_1fc4_return_output;
     -- result_MUX[uxn_opcodes_h_l437_c2_227c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l437_c2_227c_cond <= VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_cond;
     result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue <= VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iftrue;
     result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse <= VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_return_output := result_MUX_uxn_opcodes_h_l437_c2_227c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_e523] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output;

     -- Submodule level 4
     VAR_pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_e523_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l437_c2_227c_return_output;
     -- pc_set[uxn_opcodes_h_l439_c3_5647] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l439_c3_5647_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l439_c3_5647_value <= VAR_pc_set_uxn_opcodes_h_l439_c3_5647_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
