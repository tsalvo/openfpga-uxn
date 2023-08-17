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
entity opc_dup_0CLK_86b8f17f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dup_0CLK_86b8f17f;
architecture arch of opc_dup_0CLK_86b8f17f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l214_c7_5ce3]
signal t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l214_c7_5ce3_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l215_c9_d147]
signal set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l215_c9_d147_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l216_c6_7157]
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l217_c1_333f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l216_c2_5018]
signal result_MUX_uxn_opcodes_h_l216_c2_5018_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l216_c2_5018_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_h_l218_c3_a611]
signal put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_a611_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_a611_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l218_c3_a611_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l219_c3_b2af]
signal put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_b2af_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l219_c3_b2af_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l214_c7_5ce3
t_register_uxn_opcodes_h_l214_c7_5ce3 : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index,
t_register_uxn_opcodes_h_l214_c7_5ce3_return_output);

-- set_uxn_opcodes_h_l215_c9_d147
set_uxn_opcodes_h_l215_c9_d147 : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE,
set_uxn_opcodes_h_l215_c9_d147_stack_index,
set_uxn_opcodes_h_l215_c9_d147_ins,
set_uxn_opcodes_h_l215_c9_d147_k,
set_uxn_opcodes_h_l215_c9_d147_mul,
set_uxn_opcodes_h_l215_c9_d147_add,
set_uxn_opcodes_h_l215_c9_d147_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l216_c6_7157
BIN_OP_GT_uxn_opcodes_h_l216_c6_7157 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left,
BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right,
BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output);

-- result_MUX_uxn_opcodes_h_l216_c2_5018
result_MUX_uxn_opcodes_h_l216_c2_5018 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l216_c2_5018_cond,
result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue,
result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse,
result_MUX_uxn_opcodes_h_l216_c2_5018_return_output);

-- put_stack_uxn_opcodes_h_l218_c3_a611
put_stack_uxn_opcodes_h_l218_c3_a611 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l218_c3_a611_stack_index,
put_stack_uxn_opcodes_h_l218_c3_a611_offset,
put_stack_uxn_opcodes_h_l218_c3_a611_value);

-- put_stack_uxn_opcodes_h_l219_c3_b2af
put_stack_uxn_opcodes_h_l219_c3_b2af : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index,
put_stack_uxn_opcodes_h_l219_c3_b2af_offset,
put_stack_uxn_opcodes_h_l219_c3_b2af_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l214_c7_5ce3_return_output,
 set_uxn_opcodes_h_l215_c9_d147_return_output,
 BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output,
 result_MUX_uxn_opcodes_h_l216_c2_5018_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l215_c9_d147_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_a611_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_a611_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_a611_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_offset := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_h_l215_c9_d147_mul := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l215_c9_d147_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l218_c3_a611_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l215_c9_d147_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l215_c9_d147_k := VAR_k;
     VAR_put_stack_uxn_opcodes_h_l218_c3_a611_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l215_c9_d147_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l214_c7_5ce3] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index <= VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_return_output := t_register_uxn_opcodes_h_l214_c7_5ce3_return_output;

     -- set[uxn_opcodes_h_l215_c9_d147] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l215_c9_d147_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l215_c9_d147_stack_index <= VAR_set_uxn_opcodes_h_l215_c9_d147_stack_index;
     set_uxn_opcodes_h_l215_c9_d147_ins <= VAR_set_uxn_opcodes_h_l215_c9_d147_ins;
     set_uxn_opcodes_h_l215_c9_d147_k <= VAR_set_uxn_opcodes_h_l215_c9_d147_k;
     set_uxn_opcodes_h_l215_c9_d147_mul <= VAR_set_uxn_opcodes_h_l215_c9_d147_mul;
     set_uxn_opcodes_h_l215_c9_d147_add <= VAR_set_uxn_opcodes_h_l215_c9_d147_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l215_c9_d147_return_output := set_uxn_opcodes_h_l215_c9_d147_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left := VAR_set_uxn_opcodes_h_l215_c9_d147_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l215_c9_d147_return_output;
     VAR_put_stack_uxn_opcodes_h_l218_c3_a611_value := VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_return_output;
     VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_value := VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l214_c7_5ce3_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l216_c6_7157] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_left;
     BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output := BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output;
     VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l216_c6_7157_return_output;
     -- result_MUX[uxn_opcodes_h_l216_c2_5018] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l216_c2_5018_cond <= VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_cond;
     result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue <= VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iftrue;
     result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse <= VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_return_output := result_MUX_uxn_opcodes_h_l216_c2_5018_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l217_c1_333f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output;
     VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l217_c1_333f_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l216_c2_5018_return_output;
     -- put_stack[uxn_opcodes_h_l219_c3_b2af] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index <= VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_stack_index;
     put_stack_uxn_opcodes_h_l219_c3_b2af_offset <= VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_offset;
     put_stack_uxn_opcodes_h_l219_c3_b2af_value <= VAR_put_stack_uxn_opcodes_h_l219_c3_b2af_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l218_c3_a611] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l218_c3_a611_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l218_c3_a611_stack_index <= VAR_put_stack_uxn_opcodes_h_l218_c3_a611_stack_index;
     put_stack_uxn_opcodes_h_l218_c3_a611_offset <= VAR_put_stack_uxn_opcodes_h_l218_c3_a611_offset;
     put_stack_uxn_opcodes_h_l218_c3_a611_value <= VAR_put_stack_uxn_opcodes_h_l218_c3_a611_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
