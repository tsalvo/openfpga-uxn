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
entity opc_jcn_0CLK_7c6909f0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn_0CLK_7c6909f0;
architecture arch of opc_jcn_0CLK_7c6909f0 is
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
-- t_register[uxn_opcodes_h_l419_c7_426e]
signal t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_426e_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_426e_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l420_c7_13dd]
signal n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_13dd_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_13dd_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l421_c9_f4c4]
signal set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_f4c4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l422_c6_118a]
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_8f30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l422_c2_b4a5]
signal result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l423_c11_8d2e]
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_5a0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l423_c7_8f30]
signal result_MUX_uxn_opcodes_h_l423_c7_8f30_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l424_c3_9ad1]
signal pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l419_c7_426e
t_register_uxn_opcodes_h_l419_c7_426e : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l419_c7_426e_stack_index,
t_register_uxn_opcodes_h_l419_c7_426e_return_output);

-- n_register_uxn_opcodes_h_l420_c7_13dd
n_register_uxn_opcodes_h_l420_c7_13dd : entity work.n_register_0CLK_31d26cd6 port map (
clk,
n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l420_c7_13dd_stack_index,
n_register_uxn_opcodes_h_l420_c7_13dd_return_output);

-- set_uxn_opcodes_h_l421_c9_f4c4
set_uxn_opcodes_h_l421_c9_f4c4 : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE,
set_uxn_opcodes_h_l421_c9_f4c4_stack_index,
set_uxn_opcodes_h_l421_c9_f4c4_ins,
set_uxn_opcodes_h_l421_c9_f4c4_k,
set_uxn_opcodes_h_l421_c9_f4c4_mul,
set_uxn_opcodes_h_l421_c9_f4c4_add,
set_uxn_opcodes_h_l421_c9_f4c4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l422_c6_118a
BIN_OP_GT_uxn_opcodes_h_l422_c6_118a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left,
BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right,
BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output);

-- result_MUX_uxn_opcodes_h_l422_c2_b4a5
result_MUX_uxn_opcodes_h_l422_c2_b4a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond,
result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue,
result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse,
result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e
BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left,
BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right,
BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output);

-- result_MUX_uxn_opcodes_h_l423_c7_8f30
result_MUX_uxn_opcodes_h_l423_c7_8f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l423_c7_8f30_cond,
result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue,
result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse,
result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output);

-- pc_add_s8_uxn_opcodes_h_l424_c3_9ad1
pc_add_s8_uxn_opcodes_h_l424_c3_9ad1 : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment);



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
 t_register_uxn_opcodes_h_l419_c7_426e_return_output,
 n_register_uxn_opcodes_h_l420_c7_13dd_return_output,
 set_uxn_opcodes_h_l421_c9_f4c4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output,
 result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output,
 result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_426e_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_426e_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_13dd_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_13dd_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_f4c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0869_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse := result;
     VAR_n_register_uxn_opcodes_h_l420_c7_13dd_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l419_c7_426e_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l419_c7_426e] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l419_c7_426e_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l419_c7_426e_stack_index <= VAR_t_register_uxn_opcodes_h_l419_c7_426e_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l419_c7_426e_return_output := t_register_uxn_opcodes_h_l419_c7_426e_return_output;

     -- set[uxn_opcodes_h_l421_c9_f4c4] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l421_c9_f4c4_stack_index <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_stack_index;
     set_uxn_opcodes_h_l421_c9_f4c4_ins <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_ins;
     set_uxn_opcodes_h_l421_c9_f4c4_k <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_k;
     set_uxn_opcodes_h_l421_c9_f4c4_mul <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_mul;
     set_uxn_opcodes_h_l421_c9_f4c4_add <= VAR_set_uxn_opcodes_h_l421_c9_f4c4_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l421_c9_f4c4_return_output := set_uxn_opcodes_h_l421_c9_f4c4_return_output;

     -- n_register[uxn_opcodes_h_l420_c7_13dd] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l420_c7_13dd_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l420_c7_13dd_stack_index <= VAR_n_register_uxn_opcodes_h_l420_c7_13dd_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l420_c7_13dd_return_output := n_register_uxn_opcodes_h_l420_c7_13dd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left := VAR_n_register_uxn_opcodes_h_l420_c7_13dd_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l420_c7_13dd_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left := VAR_set_uxn_opcodes_h_l421_c9_f4c4_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l421_c9_f4c4_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l419_c7_426e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l422_c6_118a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_left;
     BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output := BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l424_c13_0869] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0869_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l419_c7_426e_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l423_c11_8d2e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_left;
     BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output := BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_118a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_8d2e_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_0869_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_8f30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output;

     -- result_MUX[uxn_opcodes_h_l423_c7_8f30] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l423_c7_8f30_cond <= VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_cond;
     result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue <= VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iftrue;
     result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse <= VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output := result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_8f30_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse := VAR_result_MUX_uxn_opcodes_h_l423_c7_8f30_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_5a0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output;

     -- result_MUX[uxn_opcodes_h_l422_c2_b4a5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond <= VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_cond;
     result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue <= VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iftrue;
     result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse <= VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output := result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output;

     -- Submodule level 4
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_5a0b_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l422_c2_b4a5_return_output;
     -- pc_add_s8[uxn_opcodes_h_l424_c3_9ad1] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_9ad1_adjustment;
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
