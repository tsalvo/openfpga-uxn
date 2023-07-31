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
entity opc_stz2_0CLK_4d96a8bf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_stz2_0CLK_4d96a8bf;
architecture arch of opc_stz2_0CLK_4d96a8bf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l559_c7_93fc]
signal t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l559_c7_93fc_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l559_c7_93fc_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l561_c8_f20c]
signal h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l561_c8_f20c_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l562_c9_3521]
signal set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l562_c9_3521_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l563_c6_3e51]
signal BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_a63c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l563_c2_570f]
signal result_MUX_uxn_opcodes_h_l563_c2_570f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l563_c2_570f_return_output : unsigned(0 downto 0);

-- poke2_ram[uxn_opcodes_h_l565_c3_c81a]
signal poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke2_ram_uxn_opcodes_h_l565_c3_c81a_address : unsigned(15 downto 0);
signal poke2_ram_uxn_opcodes_h_l565_c3_c81a_value : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l559_c7_93fc
t_register_uxn_opcodes_h_l559_c7_93fc : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l559_c7_93fc_stack_index,
t_register_uxn_opcodes_h_l559_c7_93fc_return_output);

-- h2_register_uxn_opcodes_h_l561_c8_f20c
h2_register_uxn_opcodes_h_l561_c8_f20c : entity work.h2_register_0CLK_d6ba51db port map (
clk,
h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index,
h2_register_uxn_opcodes_h_l561_c8_f20c_return_output);

-- set_uxn_opcodes_h_l562_c9_3521
set_uxn_opcodes_h_l562_c9_3521 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE,
set_uxn_opcodes_h_l562_c9_3521_stack_index,
set_uxn_opcodes_h_l562_c9_3521_ins,
set_uxn_opcodes_h_l562_c9_3521_k,
set_uxn_opcodes_h_l562_c9_3521_mul,
set_uxn_opcodes_h_l562_c9_3521_add,
set_uxn_opcodes_h_l562_c9_3521_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51
BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left,
BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right,
BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output);

-- result_MUX_uxn_opcodes_h_l563_c2_570f
result_MUX_uxn_opcodes_h_l563_c2_570f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l563_c2_570f_cond,
result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue,
result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse,
result_MUX_uxn_opcodes_h_l563_c2_570f_return_output);

-- poke2_ram_uxn_opcodes_h_l565_c3_c81a
poke2_ram_uxn_opcodes_h_l565_c3_c81a : entity work.poke2_ram_0CLK_cf9aa9fa port map (
clk,
poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE,
poke2_ram_uxn_opcodes_h_l565_c3_c81a_address,
poke2_ram_uxn_opcodes_h_l565_c3_c81a_value);



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
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l559_c7_93fc_return_output,
 h2_register_uxn_opcodes_h_l561_c8_f20c_return_output,
 set_uxn_opcodes_h_l562_c9_3521_return_output,
 BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output,
 result_MUX_uxn_opcodes_h_l563_c2_570f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l559_c7_93fc_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l559_c7_93fc_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l560_c8_3042_return_output : unsigned(15 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l562_c9_3521_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_cond : unsigned(0 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_address : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_value : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l562_c9_3521_mul := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l562_c9_3521_add := resize(to_signed(-3, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l562_c9_3521_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l562_c9_3521_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l562_c9_3521_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l559_c7_93fc_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l562_c9_3521] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l562_c9_3521_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l562_c9_3521_stack_index <= VAR_set_uxn_opcodes_h_l562_c9_3521_stack_index;
     set_uxn_opcodes_h_l562_c9_3521_ins <= VAR_set_uxn_opcodes_h_l562_c9_3521_ins;
     set_uxn_opcodes_h_l562_c9_3521_k <= VAR_set_uxn_opcodes_h_l562_c9_3521_k;
     set_uxn_opcodes_h_l562_c9_3521_mul <= VAR_set_uxn_opcodes_h_l562_c9_3521_mul;
     set_uxn_opcodes_h_l562_c9_3521_add <= VAR_set_uxn_opcodes_h_l562_c9_3521_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l562_c9_3521_return_output := set_uxn_opcodes_h_l562_c9_3521_return_output;

     -- t_register[uxn_opcodes_h_l559_c7_93fc] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l559_c7_93fc_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l559_c7_93fc_stack_index <= VAR_t_register_uxn_opcodes_h_l559_c7_93fc_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l559_c7_93fc_return_output := t_register_uxn_opcodes_h_l559_c7_93fc_return_output;

     -- h2_register[uxn_opcodes_h_l561_c8_f20c] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index <= VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_return_output := h2_register_uxn_opcodes_h_l561_c8_f20c_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_value := VAR_h2_register_uxn_opcodes_h_l561_c8_f20c_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left := VAR_set_uxn_opcodes_h_l562_c9_3521_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l562_c9_3521_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l559_c7_93fc_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l563_c6_3e51] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_left;
     BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output := BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l560_c8_3042] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l560_c8_3042_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l559_c7_93fc_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output;
     VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l563_c6_3e51_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l560_c8_3042_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l560_c8_3042_return_output;
     -- result_MUX[uxn_opcodes_h_l563_c2_570f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l563_c2_570f_cond <= VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_cond;
     result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue <= VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iftrue;
     result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse <= VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_return_output := result_MUX_uxn_opcodes_h_l563_c2_570f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c1_a63c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output;

     -- Submodule level 3
     VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c1_a63c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l563_c2_570f_return_output;
     -- poke2_ram[uxn_opcodes_h_l565_c3_c81a] LATENCY=0
     -- Clock enable
     poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE <= VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_CLOCK_ENABLE;
     -- Inputs
     poke2_ram_uxn_opcodes_h_l565_c3_c81a_address <= VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_address;
     poke2_ram_uxn_opcodes_h_l565_c3_c81a_value <= VAR_poke2_ram_uxn_opcodes_h_l565_c3_c81a_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
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
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
