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
-- Submodules: 11
entity opc_jcn_0CLK_7f8adde9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn_0CLK_7f8adde9;
architecture arch of opc_jcn_0CLK_7f8adde9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l419_c7_222f]
signal t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_222f_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_222f_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l420_c7_da17]
signal n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_da17_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_da17_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l421_c9_ea34]
signal set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_ea34_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l422_c6_a0a7]
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_c589]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l422_c2_53af]
signal result_MUX_uxn_opcodes_h_l422_c2_53af_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_53af_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l423_c11_7e50]
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_6092]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l423_c7_c589]
signal result_MUX_uxn_opcodes_h_l423_c7_c589_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_c589_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l424_c3_b382]
signal pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l419_c7_222f
t_register_uxn_opcodes_h_l419_c7_222f : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l419_c7_222f_stack_index,
t_register_uxn_opcodes_h_l419_c7_222f_return_output);

-- n_register_uxn_opcodes_h_l420_c7_da17
n_register_uxn_opcodes_h_l420_c7_da17 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l420_c7_da17_stack_index,
n_register_uxn_opcodes_h_l420_c7_da17_return_output);

-- set_uxn_opcodes_h_l421_c9_ea34
set_uxn_opcodes_h_l421_c9_ea34 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE,
set_uxn_opcodes_h_l421_c9_ea34_stack_index,
set_uxn_opcodes_h_l421_c9_ea34_ins,
set_uxn_opcodes_h_l421_c9_ea34_k,
set_uxn_opcodes_h_l421_c9_ea34_mul,
set_uxn_opcodes_h_l421_c9_ea34_add,
set_uxn_opcodes_h_l421_c9_ea34_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7
BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left,
BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right,
BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output);

-- result_MUX_uxn_opcodes_h_l422_c2_53af
result_MUX_uxn_opcodes_h_l422_c2_53af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l422_c2_53af_cond,
result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue,
result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse,
result_MUX_uxn_opcodes_h_l422_c2_53af_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50
BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left,
BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right,
BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output);

-- result_MUX_uxn_opcodes_h_l423_c7_c589
result_MUX_uxn_opcodes_h_l423_c7_c589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l423_c7_c589_cond,
result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue,
result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse,
result_MUX_uxn_opcodes_h_l423_c7_c589_return_output);

-- pc_add_s8_uxn_opcodes_h_l424_c3_b382
pc_add_s8_uxn_opcodes_h_l424_c3_b382 : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l419_c7_222f_return_output,
 n_register_uxn_opcodes_h_l420_c7_da17_return_output,
 set_uxn_opcodes_h_l421_c9_ea34_return_output,
 BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output,
 result_MUX_uxn_opcodes_h_l422_c2_53af_return_output,
 BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output,
 result_MUX_uxn_opcodes_h_l423_c7_c589_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_222f_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_222f_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_da17_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_da17_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_ea34_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0905_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l421_c9_ea34_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l421_c9_ea34_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_ea34_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l421_c9_ea34_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse := result;
     VAR_n_register_uxn_opcodes_h_l420_c7_da17_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l421_c9_ea34_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l419_c7_222f_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l419_c7_222f] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l419_c7_222f_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l419_c7_222f_stack_index <= VAR_t_register_uxn_opcodes_h_l419_c7_222f_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l419_c7_222f_return_output := t_register_uxn_opcodes_h_l419_c7_222f_return_output;

     -- set[uxn_opcodes_h_l421_c9_ea34] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l421_c9_ea34_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l421_c9_ea34_stack_index <= VAR_set_uxn_opcodes_h_l421_c9_ea34_stack_index;
     set_uxn_opcodes_h_l421_c9_ea34_ins <= VAR_set_uxn_opcodes_h_l421_c9_ea34_ins;
     set_uxn_opcodes_h_l421_c9_ea34_k <= VAR_set_uxn_opcodes_h_l421_c9_ea34_k;
     set_uxn_opcodes_h_l421_c9_ea34_mul <= VAR_set_uxn_opcodes_h_l421_c9_ea34_mul;
     set_uxn_opcodes_h_l421_c9_ea34_add <= VAR_set_uxn_opcodes_h_l421_c9_ea34_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l421_c9_ea34_return_output := set_uxn_opcodes_h_l421_c9_ea34_return_output;

     -- n_register[uxn_opcodes_h_l420_c7_da17] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l420_c7_da17_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l420_c7_da17_stack_index <= VAR_n_register_uxn_opcodes_h_l420_c7_da17_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l420_c7_da17_return_output := n_register_uxn_opcodes_h_l420_c7_da17_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left := VAR_n_register_uxn_opcodes_h_l420_c7_da17_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l420_c7_da17_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left := VAR_set_uxn_opcodes_h_l421_c9_ea34_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l421_c9_ea34_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l419_c7_222f_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l422_c6_a0a7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_left;
     BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output := BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l424_c13_0905] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0905_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l419_c7_222f_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l423_c11_7e50] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_left;
     BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output := BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_a0a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_7e50_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0905_return_output;
     -- result_MUX[uxn_opcodes_h_l423_c7_c589] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l423_c7_c589_cond <= VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_cond;
     result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue <= VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iftrue;
     result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse <= VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_return_output := result_MUX_uxn_opcodes_h_l423_c7_c589_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_c589] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_c589_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse := VAR_result_MUX_uxn_opcodes_h_l423_c7_c589_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_6092] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output;

     -- result_MUX[uxn_opcodes_h_l422_c2_53af] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l422_c2_53af_cond <= VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_cond;
     result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue <= VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iftrue;
     result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse <= VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_return_output := result_MUX_uxn_opcodes_h_l422_c2_53af_return_output;

     -- Submodule level 4
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_6092_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l422_c2_53af_return_output;
     -- pc_add_s8[uxn_opcodes_h_l424_c3_b382] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b382_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
