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
entity opc_inc2_0CLK_406fd05a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_inc2_0CLK_406fd05a;
architecture arch of opc_inc2_0CLK_406fd05a is
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
-- t2_register[uxn_opcodes_h_l99_c8_4f03]
signal t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_4f03_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l100_c9_155d]
signal set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_155d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l101_c6_059d]
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_5d28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l101_c2_8d0e]
signal result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_320f]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output : unsigned(16 downto 0);

-- put2_stack[uxn_opcodes_h_l102_c9_05bd]
signal put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_05bd_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_05bd_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l99_c8_4f03
t2_register_uxn_opcodes_h_l99_c8_4f03 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index,
t2_register_uxn_opcodes_h_l99_c8_4f03_return_output);

-- set_uxn_opcodes_h_l100_c9_155d
set_uxn_opcodes_h_l100_c9_155d : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE,
set_uxn_opcodes_h_l100_c9_155d_stack_index,
set_uxn_opcodes_h_l100_c9_155d_ins,
set_uxn_opcodes_h_l100_c9_155d_k,
set_uxn_opcodes_h_l100_c9_155d_mul,
set_uxn_opcodes_h_l100_c9_155d_add,
set_uxn_opcodes_h_l100_c9_155d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l101_c6_059d
BIN_OP_GT_uxn_opcodes_h_l101_c6_059d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left,
BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right,
BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output);

-- result_MUX_uxn_opcodes_h_l101_c2_8d0e
result_MUX_uxn_opcodes_h_l101_c2_8d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond,
result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue,
result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse,
result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output);

-- put2_stack_uxn_opcodes_h_l102_c9_05bd
put2_stack_uxn_opcodes_h_l102_c9_05bd : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index,
put2_stack_uxn_opcodes_h_l102_c9_05bd_offset,
put2_stack_uxn_opcodes_h_l102_c9_05bd_value);



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
 t2_register_uxn_opcodes_h_l99_c8_4f03_return_output,
 set_uxn_opcodes_h_l100_c9_155d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output,
 result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_155d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output : unsigned(16 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l100_c9_155d_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_set_uxn_opcodes_h_l100_c9_155d_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_155d_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l100_c9_155d_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l100_c9_155d_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l99_c8_4f03] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index <= VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_return_output := t2_register_uxn_opcodes_h_l99_c8_4f03_return_output;

     -- set[uxn_opcodes_h_l100_c9_155d] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l100_c9_155d_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l100_c9_155d_stack_index <= VAR_set_uxn_opcodes_h_l100_c9_155d_stack_index;
     set_uxn_opcodes_h_l100_c9_155d_ins <= VAR_set_uxn_opcodes_h_l100_c9_155d_ins;
     set_uxn_opcodes_h_l100_c9_155d_k <= VAR_set_uxn_opcodes_h_l100_c9_155d_k;
     set_uxn_opcodes_h_l100_c9_155d_mul <= VAR_set_uxn_opcodes_h_l100_c9_155d_mul;
     set_uxn_opcodes_h_l100_c9_155d_add <= VAR_set_uxn_opcodes_h_l100_c9_155d_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l100_c9_155d_return_output := set_uxn_opcodes_h_l100_c9_155d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left := VAR_set_uxn_opcodes_h_l100_c9_155d_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l100_c9_155d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left := VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l99_c8_4f03_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_320f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l101_c6_059d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_left;
     BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output := BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_059d_return_output;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_320f_return_output, 16);
     -- result_MUX[uxn_opcodes_h_l101_c2_8d0e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond <= VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_cond;
     result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue <= VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iftrue;
     result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse <= VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output := result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_5d28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_5d28_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l101_c2_8d0e_return_output;
     -- put2_stack[uxn_opcodes_h_l102_c9_05bd] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index <= VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_stack_index;
     put2_stack_uxn_opcodes_h_l102_c9_05bd_offset <= VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_offset;
     put2_stack_uxn_opcodes_h_l102_c9_05bd_value <= VAR_put2_stack_uxn_opcodes_h_l102_c9_05bd_value;
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
