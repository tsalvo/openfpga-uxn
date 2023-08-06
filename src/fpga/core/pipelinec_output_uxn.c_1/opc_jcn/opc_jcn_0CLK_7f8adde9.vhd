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
-- t_register[uxn_opcodes_h_l419_c7_4629]
signal t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_4629_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_4629_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l420_c7_b12c]
signal n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_b12c_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_b12c_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l421_c9_1f55]
signal set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_1f55_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l422_c6_bff6]
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_0630]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l422_c2_ee11]
signal result_MUX_uxn_opcodes_h_l422_c2_ee11_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l423_c11_03e8]
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_f362]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l423_c7_0630]
signal result_MUX_uxn_opcodes_h_l423_c7_0630_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_0630_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l424_c3_b744]
signal pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l419_c7_4629
t_register_uxn_opcodes_h_l419_c7_4629 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l419_c7_4629_stack_index,
t_register_uxn_opcodes_h_l419_c7_4629_return_output);

-- n_register_uxn_opcodes_h_l420_c7_b12c
n_register_uxn_opcodes_h_l420_c7_b12c : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l420_c7_b12c_stack_index,
n_register_uxn_opcodes_h_l420_c7_b12c_return_output);

-- set_uxn_opcodes_h_l421_c9_1f55
set_uxn_opcodes_h_l421_c9_1f55 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE,
set_uxn_opcodes_h_l421_c9_1f55_stack_index,
set_uxn_opcodes_h_l421_c9_1f55_ins,
set_uxn_opcodes_h_l421_c9_1f55_k,
set_uxn_opcodes_h_l421_c9_1f55_mul,
set_uxn_opcodes_h_l421_c9_1f55_add,
set_uxn_opcodes_h_l421_c9_1f55_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6
BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left,
BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right,
BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output);

-- result_MUX_uxn_opcodes_h_l422_c2_ee11
result_MUX_uxn_opcodes_h_l422_c2_ee11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l422_c2_ee11_cond,
result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue,
result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse,
result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8
BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left,
BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right,
BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output);

-- result_MUX_uxn_opcodes_h_l423_c7_0630
result_MUX_uxn_opcodes_h_l423_c7_0630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l423_c7_0630_cond,
result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue,
result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse,
result_MUX_uxn_opcodes_h_l423_c7_0630_return_output);

-- pc_add_s8_uxn_opcodes_h_l424_c3_b744
pc_add_s8_uxn_opcodes_h_l424_c3_b744 : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment);



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
 t_register_uxn_opcodes_h_l419_c7_4629_return_output,
 n_register_uxn_opcodes_h_l420_c7_b12c_return_output,
 set_uxn_opcodes_h_l421_c9_1f55_return_output,
 BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output,
 result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output,
 BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output,
 result_MUX_uxn_opcodes_h_l423_c7_0630_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_4629_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_4629_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_b12c_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_b12c_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_1f55_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_7f0b_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l421_c9_1f55_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l421_c9_1f55_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_1f55_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l421_c9_1f55_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse := result;
     VAR_n_register_uxn_opcodes_h_l420_c7_b12c_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l421_c9_1f55_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l419_c7_4629_stack_index := VAR_stack_index;
     -- n_register[uxn_opcodes_h_l420_c7_b12c] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l420_c7_b12c_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l420_c7_b12c_stack_index <= VAR_n_register_uxn_opcodes_h_l420_c7_b12c_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l420_c7_b12c_return_output := n_register_uxn_opcodes_h_l420_c7_b12c_return_output;

     -- t_register[uxn_opcodes_h_l419_c7_4629] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l419_c7_4629_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l419_c7_4629_stack_index <= VAR_t_register_uxn_opcodes_h_l419_c7_4629_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l419_c7_4629_return_output := t_register_uxn_opcodes_h_l419_c7_4629_return_output;

     -- set[uxn_opcodes_h_l421_c9_1f55] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l421_c9_1f55_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l421_c9_1f55_stack_index <= VAR_set_uxn_opcodes_h_l421_c9_1f55_stack_index;
     set_uxn_opcodes_h_l421_c9_1f55_ins <= VAR_set_uxn_opcodes_h_l421_c9_1f55_ins;
     set_uxn_opcodes_h_l421_c9_1f55_k <= VAR_set_uxn_opcodes_h_l421_c9_1f55_k;
     set_uxn_opcodes_h_l421_c9_1f55_mul <= VAR_set_uxn_opcodes_h_l421_c9_1f55_mul;
     set_uxn_opcodes_h_l421_c9_1f55_add <= VAR_set_uxn_opcodes_h_l421_c9_1f55_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l421_c9_1f55_return_output := set_uxn_opcodes_h_l421_c9_1f55_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left := VAR_n_register_uxn_opcodes_h_l420_c7_b12c_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l420_c7_b12c_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left := VAR_set_uxn_opcodes_h_l421_c9_1f55_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l421_c9_1f55_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l419_c7_4629_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l423_c11_03e8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_left;
     BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output := BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l424_c13_7f0b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_7f0b_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l419_c7_4629_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l422_c6_bff6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_left;
     BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output := BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_bff6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_03e8_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_7f0b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_0630] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output;

     -- result_MUX[uxn_opcodes_h_l423_c7_0630] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l423_c7_0630_cond <= VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_cond;
     result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue <= VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iftrue;
     result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse <= VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_return_output := result_MUX_uxn_opcodes_h_l423_c7_0630_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_0630_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse := VAR_result_MUX_uxn_opcodes_h_l423_c7_0630_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_f362] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output;

     -- result_MUX[uxn_opcodes_h_l422_c2_ee11] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l422_c2_ee11_cond <= VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_cond;
     result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue <= VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iftrue;
     result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse <= VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output := result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output;

     -- Submodule level 4
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_f362_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l422_c2_ee11_return_output;
     -- pc_add_s8[uxn_opcodes_h_l424_c3_b744] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_b744_adjustment;
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
