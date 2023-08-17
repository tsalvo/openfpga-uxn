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
entity opc_jcn_0CLK_dfb9cfec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn_0CLK_dfb9cfec;
architecture arch of opc_jcn_0CLK_dfb9cfec is
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
-- t_register[uxn_opcodes_h_l419_c7_8ec1]
signal t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l419_c7_8ec1_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l420_c7_332e]
signal n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_332e_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l420_c7_332e_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l421_c9_23ff]
signal set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l421_c9_23ff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l422_c6_4710]
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_eaa1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l422_c2_7fef]
signal result_MUX_uxn_opcodes_h_l422_c2_7fef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l423_c11_3abc]
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_764c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l423_c7_eaa1]
signal result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l424_c3_256f]
signal pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l419_c7_8ec1
t_register_uxn_opcodes_h_l419_c7_8ec1 : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index,
t_register_uxn_opcodes_h_l419_c7_8ec1_return_output);

-- n_register_uxn_opcodes_h_l420_c7_332e
n_register_uxn_opcodes_h_l420_c7_332e : entity work.n_register_0CLK_0e5af5c0 port map (
clk,
n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l420_c7_332e_stack_index,
n_register_uxn_opcodes_h_l420_c7_332e_return_output);

-- set_uxn_opcodes_h_l421_c9_23ff
set_uxn_opcodes_h_l421_c9_23ff : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE,
set_uxn_opcodes_h_l421_c9_23ff_stack_index,
set_uxn_opcodes_h_l421_c9_23ff_ins,
set_uxn_opcodes_h_l421_c9_23ff_k,
set_uxn_opcodes_h_l421_c9_23ff_mul,
set_uxn_opcodes_h_l421_c9_23ff_add,
set_uxn_opcodes_h_l421_c9_23ff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l422_c6_4710
BIN_OP_GT_uxn_opcodes_h_l422_c6_4710 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left,
BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right,
BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output);

-- result_MUX_uxn_opcodes_h_l422_c2_7fef
result_MUX_uxn_opcodes_h_l422_c2_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l422_c2_7fef_cond,
result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue,
result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse,
result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc
BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left,
BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right,
BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output);

-- result_MUX_uxn_opcodes_h_l423_c7_eaa1
result_MUX_uxn_opcodes_h_l423_c7_eaa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond,
result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue,
result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse,
result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output);

-- pc_add_s8_uxn_opcodes_h_l424_c3_256f
pc_add_s8_uxn_opcodes_h_l424_c3_256f : entity work.pc_add_s8_0CLK_8573165f port map (
clk,
pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment);



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
 t_register_uxn_opcodes_h_l419_c7_8ec1_return_output,
 n_register_uxn_opcodes_h_l420_c7_332e_return_output,
 set_uxn_opcodes_h_l421_c9_23ff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output,
 result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output,
 BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output,
 result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_332e_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l420_c7_332e_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l421_c9_23ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_d299_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l421_c9_23ff_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l421_c9_23ff_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l421_c9_23ff_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l421_c9_23ff_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse := result;
     VAR_n_register_uxn_opcodes_h_l420_c7_332e_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l421_c9_23ff_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index := VAR_stack_index;
     -- n_register[uxn_opcodes_h_l420_c7_332e] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l420_c7_332e_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l420_c7_332e_stack_index <= VAR_n_register_uxn_opcodes_h_l420_c7_332e_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l420_c7_332e_return_output := n_register_uxn_opcodes_h_l420_c7_332e_return_output;

     -- t_register[uxn_opcodes_h_l419_c7_8ec1] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index <= VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_return_output := t_register_uxn_opcodes_h_l419_c7_8ec1_return_output;

     -- set[uxn_opcodes_h_l421_c9_23ff] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l421_c9_23ff_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l421_c9_23ff_stack_index <= VAR_set_uxn_opcodes_h_l421_c9_23ff_stack_index;
     set_uxn_opcodes_h_l421_c9_23ff_ins <= VAR_set_uxn_opcodes_h_l421_c9_23ff_ins;
     set_uxn_opcodes_h_l421_c9_23ff_k <= VAR_set_uxn_opcodes_h_l421_c9_23ff_k;
     set_uxn_opcodes_h_l421_c9_23ff_mul <= VAR_set_uxn_opcodes_h_l421_c9_23ff_mul;
     set_uxn_opcodes_h_l421_c9_23ff_add <= VAR_set_uxn_opcodes_h_l421_c9_23ff_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l421_c9_23ff_return_output := set_uxn_opcodes_h_l421_c9_23ff_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left := VAR_n_register_uxn_opcodes_h_l420_c7_332e_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l420_c7_332e_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left := VAR_set_uxn_opcodes_h_l421_c9_23ff_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l421_c9_23ff_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l422_c6_4710] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_left;
     BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output := BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l423_c11_3abc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_left;
     BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output := BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l424_c13_d299] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_d299_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l419_c7_8ec1_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l422_c6_4710_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output;
     VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l423_c11_3abc_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l424_c13_d299_return_output;
     -- result_MUX[uxn_opcodes_h_l423_c7_eaa1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond <= VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_cond;
     result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue;
     result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output := result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c7_eaa1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse := VAR_result_MUX_uxn_opcodes_h_l423_c7_eaa1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l423_c1_764c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output;

     -- result_MUX[uxn_opcodes_h_l422_c2_7fef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l422_c2_7fef_cond <= VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_cond;
     result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue <= VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iftrue;
     result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse <= VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output := result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output;

     -- Submodule level 4
     VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l423_c1_764c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l422_c2_7fef_return_output;
     -- pc_add_s8[uxn_opcodes_h_l424_c3_256f] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l424_c3_256f_adjustment;
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
