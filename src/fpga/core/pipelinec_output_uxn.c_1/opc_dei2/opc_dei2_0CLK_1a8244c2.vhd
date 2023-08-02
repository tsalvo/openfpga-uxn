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
-- Submodules: 8
entity opc_dei2_0CLK_1a8244c2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dei2_0CLK_1a8244c2;
architecture arch of opc_dei2_0CLK_1a8244c2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l707_c7_faee]
signal t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l707_c7_faee_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l707_c7_faee_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l708_c9_6af3]
signal set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l708_c9_6af3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l709_c6_28a1]
signal BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l710_c1_030e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l709_c2_9743]
signal result_MUX_uxn_opcodes_h_l709_c2_9743_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l709_c2_9743_return_output : unsigned(0 downto 0);

-- dei[uxn_opcodes_h_l711_c3_7089]
signal dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l711_c3_7089_stack_index : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l711_c3_7089_stack_offset : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l711_c3_7089_addr : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l712_c23_0619]
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output : unsigned(8 downto 0);

-- dei[uxn_opcodes_h_l712_c3_20c7]
signal dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l712_c3_20c7_stack_index : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l712_c3_20c7_stack_offset : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l712_c3_20c7_addr : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l707_c7_faee
t_register_uxn_opcodes_h_l707_c7_faee : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l707_c7_faee_stack_index,
t_register_uxn_opcodes_h_l707_c7_faee_return_output);

-- set_uxn_opcodes_h_l708_c9_6af3
set_uxn_opcodes_h_l708_c9_6af3 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE,
set_uxn_opcodes_h_l708_c9_6af3_stack_index,
set_uxn_opcodes_h_l708_c9_6af3_ins,
set_uxn_opcodes_h_l708_c9_6af3_k,
set_uxn_opcodes_h_l708_c9_6af3_mul,
set_uxn_opcodes_h_l708_c9_6af3_add,
set_uxn_opcodes_h_l708_c9_6af3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1
BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left,
BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right,
BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output);

-- result_MUX_uxn_opcodes_h_l709_c2_9743
result_MUX_uxn_opcodes_h_l709_c2_9743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l709_c2_9743_cond,
result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue,
result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse,
result_MUX_uxn_opcodes_h_l709_c2_9743_return_output);

-- dei_uxn_opcodes_h_l711_c3_7089
dei_uxn_opcodes_h_l711_c3_7089 : entity work.dei_0CLK_8eeaad6f port map (
clk,
dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE,
dei_uxn_opcodes_h_l711_c3_7089_stack_index,
dei_uxn_opcodes_h_l711_c3_7089_stack_offset,
dei_uxn_opcodes_h_l711_c3_7089_addr);

-- BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619
BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left,
BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right,
BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output);

-- dei_uxn_opcodes_h_l712_c3_20c7
dei_uxn_opcodes_h_l712_c3_20c7 : entity work.dei_0CLK_8eeaad6f port map (
clk,
dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE,
dei_uxn_opcodes_h_l712_c3_20c7_stack_index,
dei_uxn_opcodes_h_l712_c3_20c7_stack_offset,
dei_uxn_opcodes_h_l712_c3_20c7_addr);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l707_c7_faee_return_output,
 set_uxn_opcodes_h_l708_c9_6af3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output,
 result_MUX_uxn_opcodes_h_l709_c2_9743_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l707_c7_faee_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l707_c7_faee_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l708_c9_6af3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_index : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l711_c3_7089_addr : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_index : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l712_c3_20c7_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output : unsigned(8 downto 0);
 variable VAR_dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse := to_unsigned(0, 1);
     VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_offset := resize(to_unsigned(1, 1), 8);
     VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l708_c9_6af3_mul := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_h_l708_c9_6af3_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l708_c9_6af3_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l708_c9_6af3_k := VAR_k;
     VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_index := VAR_stack_index;
     VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l708_c9_6af3_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l707_c7_faee_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l708_c9_6af3] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l708_c9_6af3_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l708_c9_6af3_stack_index <= VAR_set_uxn_opcodes_h_l708_c9_6af3_stack_index;
     set_uxn_opcodes_h_l708_c9_6af3_ins <= VAR_set_uxn_opcodes_h_l708_c9_6af3_ins;
     set_uxn_opcodes_h_l708_c9_6af3_k <= VAR_set_uxn_opcodes_h_l708_c9_6af3_k;
     set_uxn_opcodes_h_l708_c9_6af3_mul <= VAR_set_uxn_opcodes_h_l708_c9_6af3_mul;
     set_uxn_opcodes_h_l708_c9_6af3_add <= VAR_set_uxn_opcodes_h_l708_c9_6af3_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l708_c9_6af3_return_output := set_uxn_opcodes_h_l708_c9_6af3_return_output;

     -- t_register[uxn_opcodes_h_l707_c7_faee] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l707_c7_faee_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l707_c7_faee_stack_index <= VAR_t_register_uxn_opcodes_h_l707_c7_faee_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l707_c7_faee_return_output := t_register_uxn_opcodes_h_l707_c7_faee_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left := VAR_set_uxn_opcodes_h_l708_c9_6af3_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l708_c9_6af3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left := VAR_t_register_uxn_opcodes_h_l707_c7_faee_return_output;
     VAR_dei_uxn_opcodes_h_l711_c3_7089_addr := VAR_t_register_uxn_opcodes_h_l707_c7_faee_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l707_c7_faee_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l712_c23_0619] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_left;
     BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output := BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l709_c6_28a1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_left;
     BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output := BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l709_c6_28a1_return_output;
     VAR_dei_uxn_opcodes_h_l712_c3_20c7_addr := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c23_0619_return_output, 8);
     -- result_MUX[uxn_opcodes_h_l709_c2_9743] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l709_c2_9743_cond <= VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_cond;
     result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue <= VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iftrue;
     result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse <= VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_return_output := result_MUX_uxn_opcodes_h_l709_c2_9743_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l710_c1_030e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output;

     -- Submodule level 3
     VAR_dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output;
     VAR_dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l710_c1_030e_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l709_c2_9743_return_output;
     -- dei[uxn_opcodes_h_l711_c3_7089] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l711_c3_7089_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l711_c3_7089_stack_index <= VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_index;
     dei_uxn_opcodes_h_l711_c3_7089_stack_offset <= VAR_dei_uxn_opcodes_h_l711_c3_7089_stack_offset;
     dei_uxn_opcodes_h_l711_c3_7089_addr <= VAR_dei_uxn_opcodes_h_l711_c3_7089_addr;
     -- Outputs

     -- dei[uxn_opcodes_h_l712_c3_20c7] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l712_c3_20c7_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l712_c3_20c7_stack_index <= VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_index;
     dei_uxn_opcodes_h_l712_c3_20c7_stack_offset <= VAR_dei_uxn_opcodes_h_l712_c3_20c7_stack_offset;
     dei_uxn_opcodes_h_l712_c3_20c7_addr <= VAR_dei_uxn_opcodes_h_l712_c3_20c7_addr;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
