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
entity opc_add2_0CLK_3ec85585 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_add2_0CLK_3ec85585;
architecture arch of opc_add2_0CLK_3ec85585 is
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
-- t2_register[uxn_opcodes_h_l766_c8_8d9f]
signal t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l767_c8_9789]
signal n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l767_c8_9789_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l767_c8_9789_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l768_c9_aa66]
signal set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l768_c9_aa66_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l769_c6_bf4c]
signal BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l770_c1_b11d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l769_c2_099a]
signal result_MUX_uxn_opcodes_h_l769_c2_099a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l769_c2_099a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l771_c30_e16c]
signal BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output : unsigned(16 downto 0);

-- put2_stack[uxn_opcodes_h_l771_c3_c89e]
signal put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l771_c3_c89e_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l771_c3_c89e_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l766_c8_8d9f
t2_register_uxn_opcodes_h_l766_c8_8d9f : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index,
t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output);

-- n2_register_uxn_opcodes_h_l767_c8_9789
n2_register_uxn_opcodes_h_l767_c8_9789 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l767_c8_9789_stack_index,
n2_register_uxn_opcodes_h_l767_c8_9789_return_output);

-- set_uxn_opcodes_h_l768_c9_aa66
set_uxn_opcodes_h_l768_c9_aa66 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE,
set_uxn_opcodes_h_l768_c9_aa66_stack_index,
set_uxn_opcodes_h_l768_c9_aa66_ins,
set_uxn_opcodes_h_l768_c9_aa66_k,
set_uxn_opcodes_h_l768_c9_aa66_mul,
set_uxn_opcodes_h_l768_c9_aa66_add,
set_uxn_opcodes_h_l768_c9_aa66_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c
BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left,
BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right,
BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output);

-- result_MUX_uxn_opcodes_h_l769_c2_099a
result_MUX_uxn_opcodes_h_l769_c2_099a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l769_c2_099a_cond,
result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue,
result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse,
result_MUX_uxn_opcodes_h_l769_c2_099a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c
BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left,
BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right,
BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output);

-- put2_stack_uxn_opcodes_h_l771_c3_c89e
put2_stack_uxn_opcodes_h_l771_c3_c89e : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index,
put2_stack_uxn_opcodes_h_l771_c3_c89e_offset,
put2_stack_uxn_opcodes_h_l771_c3_c89e_value);



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
 t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output,
 n2_register_uxn_opcodes_h_l767_c8_9789_return_output,
 set_uxn_opcodes_h_l768_c9_aa66_return_output,
 BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output,
 result_MUX_uxn_opcodes_h_l769_c2_099a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l767_c8_9789_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l767_c8_9789_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l768_c9_aa66_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output : unsigned(16 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l768_c9_aa66_add := resize(to_signed(-2, 3), 8);
     VAR_set_uxn_opcodes_h_l768_c9_aa66_mul := resize(to_unsigned(4, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_offset := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l768_c9_aa66_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l768_c9_aa66_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l767_c8_9789_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l768_c9_aa66_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l766_c8_8d9f] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index <= VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output := t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output;

     -- n2_register[uxn_opcodes_h_l767_c8_9789] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l767_c8_9789_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l767_c8_9789_stack_index <= VAR_n2_register_uxn_opcodes_h_l767_c8_9789_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l767_c8_9789_return_output := n2_register_uxn_opcodes_h_l767_c8_9789_return_output;

     -- set[uxn_opcodes_h_l768_c9_aa66] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l768_c9_aa66_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l768_c9_aa66_stack_index <= VAR_set_uxn_opcodes_h_l768_c9_aa66_stack_index;
     set_uxn_opcodes_h_l768_c9_aa66_ins <= VAR_set_uxn_opcodes_h_l768_c9_aa66_ins;
     set_uxn_opcodes_h_l768_c9_aa66_k <= VAR_set_uxn_opcodes_h_l768_c9_aa66_k;
     set_uxn_opcodes_h_l768_c9_aa66_mul <= VAR_set_uxn_opcodes_h_l768_c9_aa66_mul;
     set_uxn_opcodes_h_l768_c9_aa66_add <= VAR_set_uxn_opcodes_h_l768_c9_aa66_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l768_c9_aa66_return_output := set_uxn_opcodes_h_l768_c9_aa66_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left := VAR_n2_register_uxn_opcodes_h_l767_c8_9789_return_output;
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l767_c8_9789_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left := VAR_set_uxn_opcodes_h_l768_c9_aa66_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l768_c9_aa66_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right := VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l766_c8_8d9f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l771_c30_e16c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l769_c6_bf4c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_left;
     BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output := BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l769_c6_bf4c_return_output;
     VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l771_c30_e16c_return_output, 16);
     -- result_MUX[uxn_opcodes_h_l769_c2_099a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l769_c2_099a_cond <= VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_cond;
     result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iftrue;
     result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_return_output := result_MUX_uxn_opcodes_h_l769_c2_099a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l770_c1_b11d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l770_c1_b11d_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l769_c2_099a_return_output;
     -- put2_stack[uxn_opcodes_h_l771_c3_c89e] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index <= VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_stack_index;
     put2_stack_uxn_opcodes_h_l771_c3_c89e_offset <= VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_offset;
     put2_stack_uxn_opcodes_h_l771_c3_c89e_value <= VAR_put2_stack_uxn_opcodes_h_l771_c3_c89e_value;
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
