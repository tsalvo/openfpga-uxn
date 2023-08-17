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
entity opc_ldz2_0CLK_c4b716c7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldz2_0CLK_c4b716c7;
architecture arch of opc_ldz2_0CLK_c4b716c7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l528_c7_9145]
signal t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l528_c7_9145_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l528_c7_9145_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l530_c9_4006]
signal set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_4006_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l531_c6_abb2]
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_c36b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l531_c2_2020]
signal result_MUX_uxn_opcodes_h_l531_c2_2020_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_2020_return_output : unsigned(0 downto 0);

-- peek2_ram[uxn_opcodes_h_l533_c30_d0ef]
signal peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l533_c3_5182]
signal put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_5182_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_5182_value : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l528_c7_9145
t_register_uxn_opcodes_h_l528_c7_9145 : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l528_c7_9145_stack_index,
t_register_uxn_opcodes_h_l528_c7_9145_return_output);

-- set_uxn_opcodes_h_l530_c9_4006
set_uxn_opcodes_h_l530_c9_4006 : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE,
set_uxn_opcodes_h_l530_c9_4006_stack_index,
set_uxn_opcodes_h_l530_c9_4006_ins,
set_uxn_opcodes_h_l530_c9_4006_k,
set_uxn_opcodes_h_l530_c9_4006_mul,
set_uxn_opcodes_h_l530_c9_4006_add,
set_uxn_opcodes_h_l530_c9_4006_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2
BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left,
BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right,
BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output);

-- result_MUX_uxn_opcodes_h_l531_c2_2020
result_MUX_uxn_opcodes_h_l531_c2_2020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l531_c2_2020_cond,
result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue,
result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse,
result_MUX_uxn_opcodes_h_l531_c2_2020_return_output);

-- peek2_ram_uxn_opcodes_h_l533_c30_d0ef
peek2_ram_uxn_opcodes_h_l533_c30_d0ef : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address,
peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output);

-- put2_stack_uxn_opcodes_h_l533_c3_5182
put2_stack_uxn_opcodes_h_l533_c3_5182 : entity work.put2_stack_0CLK_949539c4 port map (
clk,
put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index,
put2_stack_uxn_opcodes_h_l533_c3_5182_offset,
put2_stack_uxn_opcodes_h_l533_c3_5182_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l528_c7_9145_return_output,
 set_uxn_opcodes_h_l530_c9_4006_return_output,
 BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output,
 result_MUX_uxn_opcodes_h_l531_c2_2020_return_output,
 peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_9145_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_9145_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_b2c4_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_4006_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_value : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l530_c9_4006_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue := to_unsigned(1, 1);
     VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l530_c9_4006_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l530_c9_4006_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l530_c9_4006_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l530_c9_4006_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l528_c7_9145_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l528_c7_9145] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l528_c7_9145_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l528_c7_9145_stack_index <= VAR_t_register_uxn_opcodes_h_l528_c7_9145_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l528_c7_9145_return_output := t_register_uxn_opcodes_h_l528_c7_9145_return_output;

     -- set[uxn_opcodes_h_l530_c9_4006] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l530_c9_4006_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l530_c9_4006_stack_index <= VAR_set_uxn_opcodes_h_l530_c9_4006_stack_index;
     set_uxn_opcodes_h_l530_c9_4006_ins <= VAR_set_uxn_opcodes_h_l530_c9_4006_ins;
     set_uxn_opcodes_h_l530_c9_4006_k <= VAR_set_uxn_opcodes_h_l530_c9_4006_k;
     set_uxn_opcodes_h_l530_c9_4006_mul <= VAR_set_uxn_opcodes_h_l530_c9_4006_mul;
     set_uxn_opcodes_h_l530_c9_4006_add <= VAR_set_uxn_opcodes_h_l530_c9_4006_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l530_c9_4006_return_output := set_uxn_opcodes_h_l530_c9_4006_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left := VAR_set_uxn_opcodes_h_l530_c9_4006_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l530_c9_4006_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l528_c7_9145_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l531_c6_abb2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_left;
     BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output := BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l529_c8_b2c4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_b2c4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l528_c7_9145_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output;
     VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_abb2_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_b2c4_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_b2c4_return_output;
     -- result_MUX[uxn_opcodes_h_l531_c2_2020] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l531_c2_2020_cond <= VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_cond;
     result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue <= VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iftrue;
     result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse <= VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_return_output := result_MUX_uxn_opcodes_h_l531_c2_2020_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_c36b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output;

     -- Submodule level 3
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output;
     VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_c36b_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l531_c2_2020_return_output;
     -- peek2_ram[uxn_opcodes_h_l533_c30_d0ef] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address <= VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output := peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_value := VAR_peek2_ram_uxn_opcodes_h_l533_c30_d0ef_return_output;
     -- put2_stack[uxn_opcodes_h_l533_c3_5182] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index <= VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_stack_index;
     put2_stack_uxn_opcodes_h_l533_c3_5182_offset <= VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_offset;
     put2_stack_uxn_opcodes_h_l533_c3_5182_value <= VAR_put2_stack_uxn_opcodes_h_l533_c3_5182_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
