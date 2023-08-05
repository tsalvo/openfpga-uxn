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
entity opc_rot_0CLK_4850ef50 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_rot_0CLK_4850ef50;
architecture arch of opc_rot_0CLK_4850ef50 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l179_c7_778e]
signal t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l179_c7_778e_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l179_c7_778e_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l180_c7_c6cc]
signal n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l180_c7_c6cc_return_output : unsigned(7 downto 0);

-- l_register[uxn_opcodes_h_l181_c7_b161]
signal l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l181_c7_b161_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l181_c7_b161_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l182_c9_4452]
signal set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_4452_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l183_c6_2916]
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l184_c1_16c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l183_c2_e2b1]
signal result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_h_l185_c3_3905]
signal put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_3905_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_3905_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_3905_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l186_c3_3736]
signal put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_3736_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_3736_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_3736_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l187_c3_6aa6]
signal put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_6aa6_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_6aa6_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l179_c7_778e
t_register_uxn_opcodes_h_l179_c7_778e : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l179_c7_778e_stack_index,
t_register_uxn_opcodes_h_l179_c7_778e_return_output);

-- n_register_uxn_opcodes_h_l180_c7_c6cc
n_register_uxn_opcodes_h_l180_c7_c6cc : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index,
n_register_uxn_opcodes_h_l180_c7_c6cc_return_output);

-- l_register_uxn_opcodes_h_l181_c7_b161
l_register_uxn_opcodes_h_l181_c7_b161 : entity work.l_register_0CLK_9682be37 port map (
clk,
l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE,
l_register_uxn_opcodes_h_l181_c7_b161_stack_index,
l_register_uxn_opcodes_h_l181_c7_b161_return_output);

-- set_uxn_opcodes_h_l182_c9_4452
set_uxn_opcodes_h_l182_c9_4452 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE,
set_uxn_opcodes_h_l182_c9_4452_stack_index,
set_uxn_opcodes_h_l182_c9_4452_ins,
set_uxn_opcodes_h_l182_c9_4452_k,
set_uxn_opcodes_h_l182_c9_4452_mul,
set_uxn_opcodes_h_l182_c9_4452_add,
set_uxn_opcodes_h_l182_c9_4452_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l183_c6_2916
BIN_OP_GT_uxn_opcodes_h_l183_c6_2916 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left,
BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right,
BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output);

-- result_MUX_uxn_opcodes_h_l183_c2_e2b1
result_MUX_uxn_opcodes_h_l183_c2_e2b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond,
result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue,
result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse,
result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output);

-- put_stack_uxn_opcodes_h_l185_c3_3905
put_stack_uxn_opcodes_h_l185_c3_3905 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l185_c3_3905_stack_index,
put_stack_uxn_opcodes_h_l185_c3_3905_offset,
put_stack_uxn_opcodes_h_l185_c3_3905_value);

-- put_stack_uxn_opcodes_h_l186_c3_3736
put_stack_uxn_opcodes_h_l186_c3_3736 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l186_c3_3736_stack_index,
put_stack_uxn_opcodes_h_l186_c3_3736_offset,
put_stack_uxn_opcodes_h_l186_c3_3736_value);

-- put_stack_uxn_opcodes_h_l187_c3_6aa6
put_stack_uxn_opcodes_h_l187_c3_6aa6 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index,
put_stack_uxn_opcodes_h_l187_c3_6aa6_offset,
put_stack_uxn_opcodes_h_l187_c3_6aa6_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 l8,
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l179_c7_778e_return_output,
 n_register_uxn_opcodes_h_l180_c7_c6cc_return_output,
 l_register_uxn_opcodes_h_l181_c7_b161_return_output,
 set_uxn_opcodes_h_l182_c9_4452_return_output,
 BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output,
 result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_778e_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_778e_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_return_output : unsigned(7 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_b161_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_b161_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_4452_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_3905_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_3905_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_3905_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_3736_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_3736_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_3736_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_l8 := l8;
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_put_stack_uxn_opcodes_h_l186_c3_3736_offset := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_h_l182_c9_4452_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_put_stack_uxn_opcodes_h_l185_c3_3905_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_offset := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l182_c9_4452_mul := resize(to_unsigned(3, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse := VAR_CLOCK_ENABLE;
     VAR_l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l182_c9_4452_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l182_c9_4452_k := VAR_k;
     VAR_l_register_uxn_opcodes_h_l181_c7_b161_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l185_c3_3905_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l186_c3_3736_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l182_c9_4452_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l179_c7_778e_stack_index := VAR_stack_index;
     -- l_register[uxn_opcodes_h_l181_c7_b161] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_h_l181_c7_b161_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_h_l181_c7_b161_stack_index <= VAR_l_register_uxn_opcodes_h_l181_c7_b161_stack_index;
     -- Outputs
     VAR_l_register_uxn_opcodes_h_l181_c7_b161_return_output := l_register_uxn_opcodes_h_l181_c7_b161_return_output;

     -- set[uxn_opcodes_h_l182_c9_4452] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l182_c9_4452_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l182_c9_4452_stack_index <= VAR_set_uxn_opcodes_h_l182_c9_4452_stack_index;
     set_uxn_opcodes_h_l182_c9_4452_ins <= VAR_set_uxn_opcodes_h_l182_c9_4452_ins;
     set_uxn_opcodes_h_l182_c9_4452_k <= VAR_set_uxn_opcodes_h_l182_c9_4452_k;
     set_uxn_opcodes_h_l182_c9_4452_mul <= VAR_set_uxn_opcodes_h_l182_c9_4452_mul;
     set_uxn_opcodes_h_l182_c9_4452_add <= VAR_set_uxn_opcodes_h_l182_c9_4452_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l182_c9_4452_return_output := set_uxn_opcodes_h_l182_c9_4452_return_output;

     -- n_register[uxn_opcodes_h_l180_c7_c6cc] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index <= VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_return_output := n_register_uxn_opcodes_h_l180_c7_c6cc_return_output;

     -- t_register[uxn_opcodes_h_l179_c7_778e] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l179_c7_778e_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l179_c7_778e_stack_index <= VAR_t_register_uxn_opcodes_h_l179_c7_778e_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l179_c7_778e_return_output := t_register_uxn_opcodes_h_l179_c7_778e_return_output;

     -- Submodule level 1
     REG_VAR_l8 := VAR_l_register_uxn_opcodes_h_l181_c7_b161_return_output;
     VAR_put_stack_uxn_opcodes_h_l185_c3_3905_value := VAR_l_register_uxn_opcodes_h_l181_c7_b161_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_return_output;
     VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_value := VAR_n_register_uxn_opcodes_h_l180_c7_c6cc_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left := VAR_set_uxn_opcodes_h_l182_c9_4452_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l182_c9_4452_return_output;
     VAR_put_stack_uxn_opcodes_h_l186_c3_3736_value := VAR_t_register_uxn_opcodes_h_l179_c7_778e_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l179_c7_778e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l183_c6_2916] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_left;
     BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output := BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output;
     VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_2916_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l184_c1_16c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output;

     -- result_MUX[uxn_opcodes_h_l183_c2_e2b1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond <= VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_cond;
     result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iftrue;
     result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output := result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output;
     VAR_put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output;
     VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_16c3_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l183_c2_e2b1_return_output;
     -- put_stack[uxn_opcodes_h_l187_c3_6aa6] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index <= VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_stack_index;
     put_stack_uxn_opcodes_h_l187_c3_6aa6_offset <= VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_offset;
     put_stack_uxn_opcodes_h_l187_c3_6aa6_value <= VAR_put_stack_uxn_opcodes_h_l187_c3_6aa6_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l185_c3_3905] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l185_c3_3905_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l185_c3_3905_stack_index <= VAR_put_stack_uxn_opcodes_h_l185_c3_3905_stack_index;
     put_stack_uxn_opcodes_h_l185_c3_3905_offset <= VAR_put_stack_uxn_opcodes_h_l185_c3_3905_offset;
     put_stack_uxn_opcodes_h_l185_c3_3905_value <= VAR_put_stack_uxn_opcodes_h_l185_c3_3905_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l186_c3_3736] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l186_c3_3736_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l186_c3_3736_stack_index <= VAR_put_stack_uxn_opcodes_h_l186_c3_3736_stack_index;
     put_stack_uxn_opcodes_h_l186_c3_3736_offset <= VAR_put_stack_uxn_opcodes_h_l186_c3_3736_offset;
     put_stack_uxn_opcodes_h_l186_c3_3736_value <= VAR_put_stack_uxn_opcodes_h_l186_c3_3736_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_l8 <= REG_VAR_l8;
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
     l8 <= REG_COMB_l8;
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
