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
entity opc_jcn2_0CLK_d6b79ff3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn2_0CLK_d6b79ff3;
architecture arch of opc_jcn2_0CLK_d6b79ff3 is
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
-- t2_register[uxn_opcodes_h_l434_c8_ffb0]
signal t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output : unsigned(15 downto 0);

-- l_register[uxn_opcodes_h_l435_c7_aea1]
signal l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l435_c7_aea1_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l435_c7_aea1_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l436_c9_c8d2]
signal set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l436_c9_c8d2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l437_c6_35ba]
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_0f91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l437_c2_f324]
signal result_MUX_uxn_opcodes_h_l437_c2_f324_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l437_c2_f324_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l438_c11_b768]
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_d76d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l438_c7_0f91]
signal result_MUX_uxn_opcodes_h_l438_c7_0f91_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l439_c3_cfd7]
signal pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l439_c3_cfd7_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l434_c8_ffb0
t2_register_uxn_opcodes_h_l434_c8_ffb0 : entity work.t2_register_0CLK_4fab5348 port map (
clk,
t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index,
t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output);

-- l_register_uxn_opcodes_h_l435_c7_aea1
l_register_uxn_opcodes_h_l435_c7_aea1 : entity work.l_register_0CLK_31d26cd6 port map (
clk,
l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE,
l_register_uxn_opcodes_h_l435_c7_aea1_stack_index,
l_register_uxn_opcodes_h_l435_c7_aea1_return_output);

-- set_uxn_opcodes_h_l436_c9_c8d2
set_uxn_opcodes_h_l436_c9_c8d2 : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE,
set_uxn_opcodes_h_l436_c9_c8d2_stack_index,
set_uxn_opcodes_h_l436_c9_c8d2_ins,
set_uxn_opcodes_h_l436_c9_c8d2_k,
set_uxn_opcodes_h_l436_c9_c8d2_mul,
set_uxn_opcodes_h_l436_c9_c8d2_add,
set_uxn_opcodes_h_l436_c9_c8d2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba
BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left,
BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right,
BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output);

-- result_MUX_uxn_opcodes_h_l437_c2_f324
result_MUX_uxn_opcodes_h_l437_c2_f324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l437_c2_f324_cond,
result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue,
result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse,
result_MUX_uxn_opcodes_h_l437_c2_f324_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l438_c11_b768
BIN_OP_GT_uxn_opcodes_h_l438_c11_b768 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left,
BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right,
BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output);

-- result_MUX_uxn_opcodes_h_l438_c7_0f91
result_MUX_uxn_opcodes_h_l438_c7_0f91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l438_c7_0f91_cond,
result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue,
result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse,
result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output);

-- pc_set_uxn_opcodes_h_l439_c3_cfd7
pc_set_uxn_opcodes_h_l439_c3_cfd7 : entity work.pc_set_0CLK_b45f1687 port map (
clk,
pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l439_c3_cfd7_value);



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
 t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output,
 l_register_uxn_opcodes_h_l435_c7_aea1_return_output,
 set_uxn_opcodes_h_l436_c9_c8d2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output,
 result_MUX_uxn_opcodes_h_l437_c2_f324_return_output,
 BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output,
 result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output : unsigned(15 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_aea1_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l435_c7_aea1_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l436_c9_c8d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_add := resize(to_signed(-3, 3), 8);
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_mul := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse := VAR_CLOCK_ENABLE;
     VAR_l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_k := VAR_k;
     VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse := result;
     VAR_l_register_uxn_opcodes_h_l435_c7_aea1_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l436_c9_c8d2] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l436_c9_c8d2_stack_index <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_stack_index;
     set_uxn_opcodes_h_l436_c9_c8d2_ins <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_ins;
     set_uxn_opcodes_h_l436_c9_c8d2_k <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_k;
     set_uxn_opcodes_h_l436_c9_c8d2_mul <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_mul;
     set_uxn_opcodes_h_l436_c9_c8d2_add <= VAR_set_uxn_opcodes_h_l436_c9_c8d2_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l436_c9_c8d2_return_output := set_uxn_opcodes_h_l436_c9_c8d2_return_output;

     -- t2_register[uxn_opcodes_h_l434_c8_ffb0] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index <= VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output := t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output;

     -- l_register[uxn_opcodes_h_l435_c7_aea1] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_h_l435_c7_aea1_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_h_l435_c7_aea1_stack_index <= VAR_l_register_uxn_opcodes_h_l435_c7_aea1_stack_index;
     -- Outputs
     VAR_l_register_uxn_opcodes_h_l435_c7_aea1_return_output := l_register_uxn_opcodes_h_l435_c7_aea1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left := VAR_l_register_uxn_opcodes_h_l435_c7_aea1_return_output;
     REG_VAR_n8 := VAR_l_register_uxn_opcodes_h_l435_c7_aea1_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left := VAR_set_uxn_opcodes_h_l436_c9_c8d2_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l436_c9_c8d2_return_output;
     VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_value := VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l434_c8_ffb0_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l437_c6_35ba] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_left;
     BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output := BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l438_c11_b768] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_left;
     BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output := BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output;
     VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l437_c6_35ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output;
     VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l438_c11_b768_return_output;
     -- result_MUX[uxn_opcodes_h_l438_c7_0f91] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l438_c7_0f91_cond <= VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_cond;
     result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue <= VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue;
     result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse <= VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output := result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c7_0f91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c7_0f91_return_output;
     VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse := VAR_result_MUX_uxn_opcodes_h_l438_c7_0f91_return_output;
     -- result_MUX[uxn_opcodes_h_l437_c2_f324] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l437_c2_f324_cond <= VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_cond;
     result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue <= VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iftrue;
     result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse <= VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_return_output := result_MUX_uxn_opcodes_h_l437_c2_f324_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l438_c1_d76d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output;

     -- Submodule level 4
     VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l438_c1_d76d_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l437_c2_f324_return_output;
     -- pc_set[uxn_opcodes_h_l439_c3_cfd7] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l439_c3_cfd7_value <= VAR_pc_set_uxn_opcodes_h_l439_c3_cfd7_value;
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
