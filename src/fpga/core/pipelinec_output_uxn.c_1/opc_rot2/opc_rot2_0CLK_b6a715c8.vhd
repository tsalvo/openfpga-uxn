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
entity opc_rot2_0CLK_b6a715c8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_rot2_0CLK_b6a715c8;
architecture arch of opc_rot2_0CLK_b6a715c8 is
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
-- t2_register[uxn_opcodes_h_l197_c8_a626]
signal t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l197_c8_a626_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l197_c8_a626_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l198_c8_2684]
signal n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l198_c8_2684_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l198_c8_2684_return_output : unsigned(15 downto 0);

-- l2_register[uxn_opcodes_h_l199_c8_d735]
signal l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE : unsigned(0 downto 0);
signal l2_register_uxn_opcodes_h_l199_c8_d735_stack_index : unsigned(0 downto 0);
signal l2_register_uxn_opcodes_h_l199_c8_d735_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l200_c9_f7a9]
signal set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l200_c9_f7a9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l201_c6_2214]
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l202_c1_7a6e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l201_c2_0aa4]
signal result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output : unsigned(0 downto 0);

-- put2_stack[uxn_opcodes_h_l203_c3_2886]
signal put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_2886_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l203_c3_2886_value : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l204_c3_1d42]
signal put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_1d42_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l204_c3_1d42_value : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l205_c3_570f]
signal put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_570f_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l205_c3_570f_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l197_c8_a626
t2_register_uxn_opcodes_h_l197_c8_a626 : entity work.t2_register_0CLK_4fab5348 port map (
clk,
t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l197_c8_a626_stack_index,
t2_register_uxn_opcodes_h_l197_c8_a626_return_output);

-- n2_register_uxn_opcodes_h_l198_c8_2684
n2_register_uxn_opcodes_h_l198_c8_2684 : entity work.n2_register_0CLK_4fab5348 port map (
clk,
n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l198_c8_2684_stack_index,
n2_register_uxn_opcodes_h_l198_c8_2684_return_output);

-- l2_register_uxn_opcodes_h_l199_c8_d735
l2_register_uxn_opcodes_h_l199_c8_d735 : entity work.l2_register_0CLK_4fab5348 port map (
clk,
l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE,
l2_register_uxn_opcodes_h_l199_c8_d735_stack_index,
l2_register_uxn_opcodes_h_l199_c8_d735_return_output);

-- set_uxn_opcodes_h_l200_c9_f7a9
set_uxn_opcodes_h_l200_c9_f7a9 : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE,
set_uxn_opcodes_h_l200_c9_f7a9_stack_index,
set_uxn_opcodes_h_l200_c9_f7a9_ins,
set_uxn_opcodes_h_l200_c9_f7a9_k,
set_uxn_opcodes_h_l200_c9_f7a9_mul,
set_uxn_opcodes_h_l200_c9_f7a9_add,
set_uxn_opcodes_h_l200_c9_f7a9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l201_c6_2214
BIN_OP_GT_uxn_opcodes_h_l201_c6_2214 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left,
BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right,
BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output);

-- result_MUX_uxn_opcodes_h_l201_c2_0aa4
result_MUX_uxn_opcodes_h_l201_c2_0aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond,
result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue,
result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse,
result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output);

-- put2_stack_uxn_opcodes_h_l203_c3_2886
put2_stack_uxn_opcodes_h_l203_c3_2886 : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index,
put2_stack_uxn_opcodes_h_l203_c3_2886_offset,
put2_stack_uxn_opcodes_h_l203_c3_2886_value);

-- put2_stack_uxn_opcodes_h_l204_c3_1d42
put2_stack_uxn_opcodes_h_l204_c3_1d42 : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index,
put2_stack_uxn_opcodes_h_l204_c3_1d42_offset,
put2_stack_uxn_opcodes_h_l204_c3_1d42_value);

-- put2_stack_uxn_opcodes_h_l205_c3_570f
put2_stack_uxn_opcodes_h_l205_c3_570f : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index,
put2_stack_uxn_opcodes_h_l205_c3_570f_offset,
put2_stack_uxn_opcodes_h_l205_c3_570f_value);



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
 t2_register_uxn_opcodes_h_l197_c8_a626_return_output,
 n2_register_uxn_opcodes_h_l198_c8_2684_return_output,
 l2_register_uxn_opcodes_h_l199_c8_d735_return_output,
 set_uxn_opcodes_h_l200_c9_f7a9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output,
 result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_a626_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l197_c8_a626_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_2684_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l198_c8_2684_return_output : unsigned(15 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_d735_stack_index : unsigned(0 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l2_register_uxn_opcodes_h_l199_c8_d735_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l200_c9_f7a9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_offset := resize(to_unsigned(4, 3), 8);
     VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_offset := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_mul := resize(to_unsigned(6, 3), 8);
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue := to_unsigned(1, 1);
     VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_offset := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse := VAR_CLOCK_ENABLE;
     VAR_l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_k := VAR_k;
     VAR_l2_register_uxn_opcodes_h_l199_c8_d735_stack_index := VAR_stack_index;
     VAR_n2_register_uxn_opcodes_h_l198_c8_2684_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l197_c8_a626_stack_index := VAR_stack_index;
     -- l2_register[uxn_opcodes_h_l199_c8_d735] LATENCY=0
     -- Clock enable
     l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE <= VAR_l2_register_uxn_opcodes_h_l199_c8_d735_CLOCK_ENABLE;
     -- Inputs
     l2_register_uxn_opcodes_h_l199_c8_d735_stack_index <= VAR_l2_register_uxn_opcodes_h_l199_c8_d735_stack_index;
     -- Outputs
     VAR_l2_register_uxn_opcodes_h_l199_c8_d735_return_output := l2_register_uxn_opcodes_h_l199_c8_d735_return_output;

     -- set[uxn_opcodes_h_l200_c9_f7a9] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l200_c9_f7a9_stack_index <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_stack_index;
     set_uxn_opcodes_h_l200_c9_f7a9_ins <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_ins;
     set_uxn_opcodes_h_l200_c9_f7a9_k <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_k;
     set_uxn_opcodes_h_l200_c9_f7a9_mul <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_mul;
     set_uxn_opcodes_h_l200_c9_f7a9_add <= VAR_set_uxn_opcodes_h_l200_c9_f7a9_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l200_c9_f7a9_return_output := set_uxn_opcodes_h_l200_c9_f7a9_return_output;

     -- n2_register[uxn_opcodes_h_l198_c8_2684] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l198_c8_2684_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l198_c8_2684_stack_index <= VAR_n2_register_uxn_opcodes_h_l198_c8_2684_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l198_c8_2684_return_output := n2_register_uxn_opcodes_h_l198_c8_2684_return_output;

     -- t2_register[uxn_opcodes_h_l197_c8_a626] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l197_c8_a626_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l197_c8_a626_stack_index <= VAR_t2_register_uxn_opcodes_h_l197_c8_a626_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l197_c8_a626_return_output := t2_register_uxn_opcodes_h_l197_c8_a626_return_output;

     -- Submodule level 1
     REG_VAR_l16 := VAR_l2_register_uxn_opcodes_h_l199_c8_d735_return_output;
     VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_value := VAR_l2_register_uxn_opcodes_h_l199_c8_d735_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l198_c8_2684_return_output;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_value := VAR_n2_register_uxn_opcodes_h_l198_c8_2684_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left := VAR_set_uxn_opcodes_h_l200_c9_f7a9_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l200_c9_f7a9_return_output;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_value := VAR_t2_register_uxn_opcodes_h_l197_c8_a626_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l197_c8_a626_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l201_c6_2214] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_left;
     BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output := BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output;
     VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l201_c6_2214_return_output;
     -- result_MUX[uxn_opcodes_h_l201_c2_0aa4] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond <= VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_cond;
     result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue <= VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iftrue;
     result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse <= VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output := result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l202_c1_7a6e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output;
     VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output;
     VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l202_c1_7a6e_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l201_c2_0aa4_return_output;
     -- put2_stack[uxn_opcodes_h_l204_c3_1d42] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index <= VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_stack_index;
     put2_stack_uxn_opcodes_h_l204_c3_1d42_offset <= VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_offset;
     put2_stack_uxn_opcodes_h_l204_c3_1d42_value <= VAR_put2_stack_uxn_opcodes_h_l204_c3_1d42_value;
     -- Outputs

     -- put2_stack[uxn_opcodes_h_l203_c3_2886] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index <= VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_stack_index;
     put2_stack_uxn_opcodes_h_l203_c3_2886_offset <= VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_offset;
     put2_stack_uxn_opcodes_h_l203_c3_2886_value <= VAR_put2_stack_uxn_opcodes_h_l203_c3_2886_value;
     -- Outputs

     -- put2_stack[uxn_opcodes_h_l205_c3_570f] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index <= VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_stack_index;
     put2_stack_uxn_opcodes_h_l205_c3_570f_offset <= VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_offset;
     put2_stack_uxn_opcodes_h_l205_c3_570f_value <= VAR_put2_stack_uxn_opcodes_h_l205_c3_570f_value;
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
