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
entity opc_rot2_0CLK_0ca1079f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_rot2_0CLK_0ca1079f;
architecture arch of opc_rot2_0CLK_0ca1079f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l197_c8_9317]
signal t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l197_c8_9317_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l197_c8_9317_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l198_c8_a5b1]
signal n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output : unsigned(15 downto 0);

-- l2_register[uxn_opcodes_h_l199_c8_6c0c]
signal l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE : unsigned(0 downto 0);
signal l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index : unsigned(0 downto 0);
signal l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l200_c9_27ee]
signal set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_27ee_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l201_c6_a374]
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l202_c1_e9e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l201_c2_c56e]
signal result_MUX_uxn_opcodes_h_l201_c2_c56e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output : unsigned(0 downto 0);

-- put2_stack[uxn_opcodes_h_l203_c3_39d4]
signal put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_39d4_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_39d4_value : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l204_c3_a1f4]
signal put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_a1f4_value : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l205_c3_88f7]
signal put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_88f7_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_88f7_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l197_c8_9317
t2_register_uxn_opcodes_h_l197_c8_9317 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l197_c8_9317_stack_index,
t2_register_uxn_opcodes_h_l197_c8_9317_return_output);

-- n2_register_uxn_opcodes_h_l198_c8_a5b1
n2_register_uxn_opcodes_h_l198_c8_a5b1 : entity work.n2_register_0CLK_efc3e079 port map (
clk,
n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index,
n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output);

-- l2_register_uxn_opcodes_h_l199_c8_6c0c
l2_register_uxn_opcodes_h_l199_c8_6c0c : entity work.l2_register_0CLK_efc3e079 port map (
clk,
l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE,
l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index,
l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output);

-- set_uxn_opcodes_h_l200_c9_27ee
set_uxn_opcodes_h_l200_c9_27ee : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE,
set_uxn_opcodes_h_l200_c9_27ee_stack_index,
set_uxn_opcodes_h_l200_c9_27ee_ins,
set_uxn_opcodes_h_l200_c9_27ee_k,
set_uxn_opcodes_h_l200_c9_27ee_mul,
set_uxn_opcodes_h_l200_c9_27ee_add,
set_uxn_opcodes_h_l200_c9_27ee_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l201_c6_a374
BIN_OP_GT_uxn_opcodes_h_l201_c6_a374 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left,
BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right,
BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output);

-- result_MUX_uxn_opcodes_h_l201_c2_c56e
result_MUX_uxn_opcodes_h_l201_c2_c56e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l201_c2_c56e_cond,
result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue,
result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse,
result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output);

-- put2_stack_uxn_opcodes_h_l203_c3_39d4
put2_stack_uxn_opcodes_h_l203_c3_39d4 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index,
put2_stack_uxn_opcodes_h_l203_c3_39d4_offset,
put2_stack_uxn_opcodes_h_l203_c3_39d4_value);

-- put2_stack_uxn_opcodes_h_l204_c3_a1f4
put2_stack_uxn_opcodes_h_l204_c3_a1f4 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index,
put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset,
put2_stack_uxn_opcodes_h_l204_c3_a1f4_value);

-- put2_stack_uxn_opcodes_h_l205_c3_88f7
put2_stack_uxn_opcodes_h_l205_c3_88f7 : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index,
put2_stack_uxn_opcodes_h_l205_c3_88f7_offset,
put2_stack_uxn_opcodes_h_l205_c3_88f7_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 l16,
 n16,
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l197_c8_9317_return_output,
 n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output,
 l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output,
 set_uxn_opcodes_h_l200_c9_27ee_return_output,
 BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output,
 result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_9317_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_9317_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output : unsigned(15 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index : unsigned(0 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_27ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_l16 := l16;
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l200_c9_27ee_mul := resize(to_unsigned(6, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset := resize(to_unsigned(2, 2), 8);
     VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_offset := resize(to_unsigned(4, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l200_c9_27ee_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse := VAR_CLOCK_ENABLE;
     VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l200_c9_27ee_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l200_c9_27ee_k := VAR_k;
     VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index := VAR_stack_index;
     VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l200_c9_27ee_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l197_c8_9317_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l197_c8_9317] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l197_c8_9317_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l197_c8_9317_stack_index <= VAR_t2_register_uxn_opcodes_h_l197_c8_9317_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l197_c8_9317_return_output := t2_register_uxn_opcodes_h_l197_c8_9317_return_output;

     -- n2_register[uxn_opcodes_h_l198_c8_a5b1] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index <= VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output := n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output;

     -- l2_register[uxn_opcodes_h_l199_c8_6c0c] LATENCY=0
     -- Clock enable
     l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE <= VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_CLOCK_ENABLE;
     -- Inputs
     l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index <= VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_stack_index;
     -- Outputs
     VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output := l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output;

     -- set[uxn_opcodes_h_l200_c9_27ee] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l200_c9_27ee_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l200_c9_27ee_stack_index <= VAR_set_uxn_opcodes_h_l200_c9_27ee_stack_index;
     set_uxn_opcodes_h_l200_c9_27ee_ins <= VAR_set_uxn_opcodes_h_l200_c9_27ee_ins;
     set_uxn_opcodes_h_l200_c9_27ee_k <= VAR_set_uxn_opcodes_h_l200_c9_27ee_k;
     set_uxn_opcodes_h_l200_c9_27ee_mul <= VAR_set_uxn_opcodes_h_l200_c9_27ee_mul;
     set_uxn_opcodes_h_l200_c9_27ee_add <= VAR_set_uxn_opcodes_h_l200_c9_27ee_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l200_c9_27ee_return_output := set_uxn_opcodes_h_l200_c9_27ee_return_output;

     -- Submodule level 1
     REG_VAR_l16 := VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output;
     VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_value := VAR_l2_register_uxn_opcodes_h_l199_c8_6c0c_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_value := VAR_n2_register_uxn_opcodes_h_l198_c8_a5b1_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left := VAR_set_uxn_opcodes_h_l200_c9_27ee_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l200_c9_27ee_return_output;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_value := VAR_t2_register_uxn_opcodes_h_l197_c8_9317_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l197_c8_9317_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l201_c6_a374] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_left;
     BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output := BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output;
     VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_a374_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l202_c1_e9e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output;

     -- result_MUX[uxn_opcodes_h_l201_c2_c56e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l201_c2_c56e_cond <= VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_cond;
     result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iftrue;
     result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output := result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_e9e6_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l201_c2_c56e_return_output;
     -- put2_stack[uxn_opcodes_h_l205_c3_88f7] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index <= VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_stack_index;
     put2_stack_uxn_opcodes_h_l205_c3_88f7_offset <= VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_offset;
     put2_stack_uxn_opcodes_h_l205_c3_88f7_value <= VAR_put2_stack_uxn_opcodes_h_l205_c3_88f7_value;
     -- Outputs

     -- put2_stack[uxn_opcodes_h_l203_c3_39d4] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index <= VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_stack_index;
     put2_stack_uxn_opcodes_h_l203_c3_39d4_offset <= VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_offset;
     put2_stack_uxn_opcodes_h_l203_c3_39d4_value <= VAR_put2_stack_uxn_opcodes_h_l203_c3_39d4_value;
     -- Outputs

     -- put2_stack[uxn_opcodes_h_l204_c3_a1f4] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index <= VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_stack_index;
     put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset <= VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_offset;
     put2_stack_uxn_opcodes_h_l204_c3_a1f4_value <= VAR_put2_stack_uxn_opcodes_h_l204_c3_a1f4_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_l16 <= REG_VAR_l16;
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
     l16 <= REG_COMB_l16;
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
