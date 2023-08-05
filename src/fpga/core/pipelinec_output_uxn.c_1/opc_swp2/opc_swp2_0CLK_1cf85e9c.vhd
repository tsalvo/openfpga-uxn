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
entity opc_swp2_0CLK_1cf85e9c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_swp2_0CLK_1cf85e9c;
architecture arch of opc_swp2_0CLK_1cf85e9c is
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
-- t2_register[uxn_opcodes_h_l164_c8_7654]
signal t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l164_c8_7654_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l164_c8_7654_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l165_c8_1683]
signal n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l165_c8_1683_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l165_c8_1683_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l166_c9_4855]
signal set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l166_c9_4855_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l167_c6_3a6f]
signal BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l168_c1_103b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l167_c2_e2f9]
signal result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output : unsigned(0 downto 0);

-- put2_stack[uxn_opcodes_h_l169_c3_a33b]
signal put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l169_c3_a33b_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l169_c3_a33b_value : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l170_c3_4178]
signal put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l170_c3_4178_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l170_c3_4178_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l164_c8_7654
t2_register_uxn_opcodes_h_l164_c8_7654 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l164_c8_7654_stack_index,
t2_register_uxn_opcodes_h_l164_c8_7654_return_output);

-- n2_register_uxn_opcodes_h_l165_c8_1683
n2_register_uxn_opcodes_h_l165_c8_1683 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l165_c8_1683_stack_index,
n2_register_uxn_opcodes_h_l165_c8_1683_return_output);

-- set_uxn_opcodes_h_l166_c9_4855
set_uxn_opcodes_h_l166_c9_4855 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE,
set_uxn_opcodes_h_l166_c9_4855_stack_index,
set_uxn_opcodes_h_l166_c9_4855_ins,
set_uxn_opcodes_h_l166_c9_4855_k,
set_uxn_opcodes_h_l166_c9_4855_mul,
set_uxn_opcodes_h_l166_c9_4855_add,
set_uxn_opcodes_h_l166_c9_4855_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f
BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left,
BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right,
BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output);

-- result_MUX_uxn_opcodes_h_l167_c2_e2f9
result_MUX_uxn_opcodes_h_l167_c2_e2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond,
result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue,
result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse,
result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output);

-- put2_stack_uxn_opcodes_h_l169_c3_a33b
put2_stack_uxn_opcodes_h_l169_c3_a33b : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index,
put2_stack_uxn_opcodes_h_l169_c3_a33b_offset,
put2_stack_uxn_opcodes_h_l169_c3_a33b_value);

-- put2_stack_uxn_opcodes_h_l170_c3_4178
put2_stack_uxn_opcodes_h_l170_c3_4178 : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index,
put2_stack_uxn_opcodes_h_l170_c3_4178_offset,
put2_stack_uxn_opcodes_h_l170_c3_4178_value);



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
 t2_register_uxn_opcodes_h_l164_c8_7654_return_output,
 n2_register_uxn_opcodes_h_l165_c8_1683_return_output,
 set_uxn_opcodes_h_l166_c9_4855_return_output,
 BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output,
 result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l164_c8_7654_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l164_c8_7654_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l165_c8_1683_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l165_c8_1683_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l166_c9_4855_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_value : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_offset := resize(to_unsigned(0, 1), 8);
     VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_offset := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l166_c9_4855_mul := resize(to_unsigned(4, 3), 8);
     VAR_set_uxn_opcodes_h_l166_c9_4855_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l166_c9_4855_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l166_c9_4855_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l165_c8_1683_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l166_c9_4855_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l164_c8_7654_stack_index := VAR_stack_index;
     -- n2_register[uxn_opcodes_h_l165_c8_1683] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l165_c8_1683_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l165_c8_1683_stack_index <= VAR_n2_register_uxn_opcodes_h_l165_c8_1683_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l165_c8_1683_return_output := n2_register_uxn_opcodes_h_l165_c8_1683_return_output;

     -- set[uxn_opcodes_h_l166_c9_4855] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l166_c9_4855_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l166_c9_4855_stack_index <= VAR_set_uxn_opcodes_h_l166_c9_4855_stack_index;
     set_uxn_opcodes_h_l166_c9_4855_ins <= VAR_set_uxn_opcodes_h_l166_c9_4855_ins;
     set_uxn_opcodes_h_l166_c9_4855_k <= VAR_set_uxn_opcodes_h_l166_c9_4855_k;
     set_uxn_opcodes_h_l166_c9_4855_mul <= VAR_set_uxn_opcodes_h_l166_c9_4855_mul;
     set_uxn_opcodes_h_l166_c9_4855_add <= VAR_set_uxn_opcodes_h_l166_c9_4855_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l166_c9_4855_return_output := set_uxn_opcodes_h_l166_c9_4855_return_output;

     -- t2_register[uxn_opcodes_h_l164_c8_7654] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l164_c8_7654_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l164_c8_7654_stack_index <= VAR_t2_register_uxn_opcodes_h_l164_c8_7654_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l164_c8_7654_return_output := t2_register_uxn_opcodes_h_l164_c8_7654_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l165_c8_1683_return_output;
     VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_value := VAR_n2_register_uxn_opcodes_h_l165_c8_1683_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left := VAR_set_uxn_opcodes_h_l166_c9_4855_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l166_c9_4855_return_output;
     VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_value := VAR_t2_register_uxn_opcodes_h_l164_c8_7654_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l164_c8_7654_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l167_c6_3a6f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_left;
     BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output := BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l167_c6_3a6f_return_output;
     -- result_MUX[uxn_opcodes_h_l167_c2_e2f9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond <= VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_cond;
     result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iftrue;
     result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output := result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l168_c1_103b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output;
     VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l168_c1_103b_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l167_c2_e2f9_return_output;
     -- put2_stack[uxn_opcodes_h_l170_c3_4178] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index <= VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_stack_index;
     put2_stack_uxn_opcodes_h_l170_c3_4178_offset <= VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_offset;
     put2_stack_uxn_opcodes_h_l170_c3_4178_value <= VAR_put2_stack_uxn_opcodes_h_l170_c3_4178_value;
     -- Outputs

     -- put2_stack[uxn_opcodes_h_l169_c3_a33b] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index <= VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_stack_index;
     put2_stack_uxn_opcodes_h_l169_c3_a33b_offset <= VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_offset;
     put2_stack_uxn_opcodes_h_l169_c3_a33b_value <= VAR_put2_stack_uxn_opcodes_h_l169_c3_a33b_value;
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
