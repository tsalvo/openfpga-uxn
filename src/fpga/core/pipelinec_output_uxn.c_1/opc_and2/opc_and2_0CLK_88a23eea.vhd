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
entity opc_and2_0CLK_88a23eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_and2_0CLK_88a23eea;
architecture arch of opc_and2_0CLK_88a23eea is
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
-- t2_register[uxn_opcodes_h_l890_c8_9e87]
signal t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l890_c8_9e87_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l891_c8_0a56]
signal n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l891_c8_0a56_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l892_c9_37dd]
signal set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l892_c9_37dd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l893_c6_1f15]
signal BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l894_c1_4d49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l893_c2_3c88]
signal result_MUX_uxn_opcodes_h_l893_c2_3c88_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l895_c30_81ed]
signal BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l895_c3_0e85]
signal put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l895_c3_0e85_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l895_c3_0e85_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l890_c8_9e87
t2_register_uxn_opcodes_h_l890_c8_9e87 : entity work.t2_register_0CLK_4fab5348 port map (
clk,
t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index,
t2_register_uxn_opcodes_h_l890_c8_9e87_return_output);

-- n2_register_uxn_opcodes_h_l891_c8_0a56
n2_register_uxn_opcodes_h_l891_c8_0a56 : entity work.n2_register_0CLK_4fab5348 port map (
clk,
n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index,
n2_register_uxn_opcodes_h_l891_c8_0a56_return_output);

-- set_uxn_opcodes_h_l892_c9_37dd
set_uxn_opcodes_h_l892_c9_37dd : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE,
set_uxn_opcodes_h_l892_c9_37dd_stack_index,
set_uxn_opcodes_h_l892_c9_37dd_ins,
set_uxn_opcodes_h_l892_c9_37dd_k,
set_uxn_opcodes_h_l892_c9_37dd_mul,
set_uxn_opcodes_h_l892_c9_37dd_add,
set_uxn_opcodes_h_l892_c9_37dd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15
BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left,
BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right,
BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output);

-- result_MUX_uxn_opcodes_h_l893_c2_3c88
result_MUX_uxn_opcodes_h_l893_c2_3c88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l893_c2_3c88_cond,
result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue,
result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse,
result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed
BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left,
BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right,
BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output);

-- put2_stack_uxn_opcodes_h_l895_c3_0e85
put2_stack_uxn_opcodes_h_l895_c3_0e85 : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index,
put2_stack_uxn_opcodes_h_l895_c3_0e85_offset,
put2_stack_uxn_opcodes_h_l895_c3_0e85_value);



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
 t2_register_uxn_opcodes_h_l890_c8_9e87_return_output,
 n2_register_uxn_opcodes_h_l891_c8_0a56_return_output,
 set_uxn_opcodes_h_l892_c9_37dd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output,
 result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output,
 BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l892_c9_37dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l892_c9_37dd_mul := resize(to_unsigned(4, 3), 8);
     VAR_set_uxn_opcodes_h_l892_c9_37dd_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l892_c9_37dd_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l892_c9_37dd_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l892_c9_37dd_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l892_c9_37dd] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l892_c9_37dd_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l892_c9_37dd_stack_index <= VAR_set_uxn_opcodes_h_l892_c9_37dd_stack_index;
     set_uxn_opcodes_h_l892_c9_37dd_ins <= VAR_set_uxn_opcodes_h_l892_c9_37dd_ins;
     set_uxn_opcodes_h_l892_c9_37dd_k <= VAR_set_uxn_opcodes_h_l892_c9_37dd_k;
     set_uxn_opcodes_h_l892_c9_37dd_mul <= VAR_set_uxn_opcodes_h_l892_c9_37dd_mul;
     set_uxn_opcodes_h_l892_c9_37dd_add <= VAR_set_uxn_opcodes_h_l892_c9_37dd_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l892_c9_37dd_return_output := set_uxn_opcodes_h_l892_c9_37dd_return_output;

     -- n2_register[uxn_opcodes_h_l891_c8_0a56] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index <= VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_return_output := n2_register_uxn_opcodes_h_l891_c8_0a56_return_output;

     -- t2_register[uxn_opcodes_h_l890_c8_9e87] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index <= VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_return_output := t2_register_uxn_opcodes_h_l890_c8_9e87_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left := VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l891_c8_0a56_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left := VAR_set_uxn_opcodes_h_l892_c9_37dd_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l892_c9_37dd_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right := VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l890_c8_9e87_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l893_c6_1f15] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_left;
     BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output := BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l895_c30_81ed] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_left;
     BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output := BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output;

     -- Submodule level 2
     VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_value := VAR_BIN_OP_AND_uxn_opcodes_h_l895_c30_81ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output;
     VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l893_c6_1f15_return_output;
     -- result_MUX[uxn_opcodes_h_l893_c2_3c88] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l893_c2_3c88_cond <= VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_cond;
     result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue <= VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iftrue;
     result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse <= VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output := result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l894_c1_4d49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l894_c1_4d49_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l893_c2_3c88_return_output;
     -- put2_stack[uxn_opcodes_h_l895_c3_0e85] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index <= VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_stack_index;
     put2_stack_uxn_opcodes_h_l895_c3_0e85_offset <= VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_offset;
     put2_stack_uxn_opcodes_h_l895_c3_0e85_value <= VAR_put2_stack_uxn_opcodes_h_l895_c3_0e85_value;
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
