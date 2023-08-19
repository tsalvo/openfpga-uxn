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
-- Submodules: 7
entity opc_inc2_0CLK_9fd64849 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_inc2_0CLK_9fd64849;
architecture arch of opc_inc2_0CLK_9fd64849 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l99_c8_280c]
signal t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_280c_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_280c_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l100_c9_37b8]
signal set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_37b8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l101_c6_ec1c]
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_99ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l101_c2_4c05]
signal result_MUX_uxn_opcodes_h_l101_c2_4c05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_df7f]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output : unsigned(16 downto 0);

-- put2_stack[uxn_opcodes_h_l102_c9_35ee]
signal put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_35ee_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_35ee_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l99_c8_280c
t2_register_uxn_opcodes_h_l99_c8_280c : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l99_c8_280c_stack_index,
t2_register_uxn_opcodes_h_l99_c8_280c_return_output);

-- set_uxn_opcodes_h_l100_c9_37b8
set_uxn_opcodes_h_l100_c9_37b8 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE,
set_uxn_opcodes_h_l100_c9_37b8_stack_index,
set_uxn_opcodes_h_l100_c9_37b8_ins,
set_uxn_opcodes_h_l100_c9_37b8_k,
set_uxn_opcodes_h_l100_c9_37b8_mul,
set_uxn_opcodes_h_l100_c9_37b8_add,
set_uxn_opcodes_h_l100_c9_37b8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c
BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left,
BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right,
BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output);

-- result_MUX_uxn_opcodes_h_l101_c2_4c05
result_MUX_uxn_opcodes_h_l101_c2_4c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l101_c2_4c05_cond,
result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue,
result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse,
result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output);

-- put2_stack_uxn_opcodes_h_l102_c9_35ee
put2_stack_uxn_opcodes_h_l102_c9_35ee : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index,
put2_stack_uxn_opcodes_h_l102_c9_35ee_offset,
put2_stack_uxn_opcodes_h_l102_c9_35ee_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l99_c8_280c_return_output,
 set_uxn_opcodes_h_l100_c9_37b8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output,
 result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_280c_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_280c_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_37b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output : unsigned(16 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l100_c9_37b8_mul := resize(to_unsigned(2, 2), 8);
     VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l100_c9_37b8_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_37b8_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l100_c9_37b8_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l100_c9_37b8_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l99_c8_280c_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l99_c8_280c] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l99_c8_280c_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l99_c8_280c_stack_index <= VAR_t2_register_uxn_opcodes_h_l99_c8_280c_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l99_c8_280c_return_output := t2_register_uxn_opcodes_h_l99_c8_280c_return_output;

     -- set[uxn_opcodes_h_l100_c9_37b8] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l100_c9_37b8_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l100_c9_37b8_stack_index <= VAR_set_uxn_opcodes_h_l100_c9_37b8_stack_index;
     set_uxn_opcodes_h_l100_c9_37b8_ins <= VAR_set_uxn_opcodes_h_l100_c9_37b8_ins;
     set_uxn_opcodes_h_l100_c9_37b8_k <= VAR_set_uxn_opcodes_h_l100_c9_37b8_k;
     set_uxn_opcodes_h_l100_c9_37b8_mul <= VAR_set_uxn_opcodes_h_l100_c9_37b8_mul;
     set_uxn_opcodes_h_l100_c9_37b8_add <= VAR_set_uxn_opcodes_h_l100_c9_37b8_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l100_c9_37b8_return_output := set_uxn_opcodes_h_l100_c9_37b8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left := VAR_set_uxn_opcodes_h_l100_c9_37b8_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l100_c9_37b8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left := VAR_t2_register_uxn_opcodes_h_l99_c8_280c_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l99_c8_280c_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_df7f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l101_c6_ec1c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_left;
     BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output := BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output;
     VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_ec1c_return_output;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_df7f_return_output, 16);
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_99ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output;

     -- result_MUX[uxn_opcodes_h_l101_c2_4c05] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l101_c2_4c05_cond <= VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_cond;
     result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue <= VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iftrue;
     result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse <= VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output := result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_99ae_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l101_c2_4c05_return_output;
     -- put2_stack[uxn_opcodes_h_l102_c9_35ee] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index <= VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_stack_index;
     put2_stack_uxn_opcodes_h_l102_c9_35ee_offset <= VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_offset;
     put2_stack_uxn_opcodes_h_l102_c9_35ee_value <= VAR_put2_stack_uxn_opcodes_h_l102_c9_35ee_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
