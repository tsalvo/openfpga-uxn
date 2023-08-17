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
entity opc_sta_0CLK_340bf904 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sta_0CLK_340bf904;
architecture arch of opc_sta_0CLK_340bf904 is
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
-- t2_register[uxn_opcodes_h_l665_c8_a368]
signal t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l665_c8_a368_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l665_c8_a368_return_output : unsigned(15 downto 0);

-- l_register[uxn_opcodes_h_l666_c7_d13a]
signal l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l666_c7_d13a_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l666_c7_d13a_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l667_c9_8bb7]
signal set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l667_c9_8bb7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l668_c6_8e19]
signal BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l669_c1_e893]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l668_c2_7056]
signal result_MUX_uxn_opcodes_h_l668_c2_7056_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l668_c2_7056_return_output : unsigned(0 downto 0);

-- poke_ram[uxn_opcodes_h_l670_c3_4d15]
signal poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_h_l670_c3_4d15_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_h_l670_c3_4d15_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l665_c8_a368
t2_register_uxn_opcodes_h_l665_c8_a368 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l665_c8_a368_stack_index,
t2_register_uxn_opcodes_h_l665_c8_a368_return_output);

-- l_register_uxn_opcodes_h_l666_c7_d13a
l_register_uxn_opcodes_h_l666_c7_d13a : entity work.l_register_0CLK_0e5af5c0 port map (
clk,
l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE,
l_register_uxn_opcodes_h_l666_c7_d13a_stack_index,
l_register_uxn_opcodes_h_l666_c7_d13a_return_output);

-- set_uxn_opcodes_h_l667_c9_8bb7
set_uxn_opcodes_h_l667_c9_8bb7 : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE,
set_uxn_opcodes_h_l667_c9_8bb7_stack_index,
set_uxn_opcodes_h_l667_c9_8bb7_ins,
set_uxn_opcodes_h_l667_c9_8bb7_k,
set_uxn_opcodes_h_l667_c9_8bb7_mul,
set_uxn_opcodes_h_l667_c9_8bb7_add,
set_uxn_opcodes_h_l667_c9_8bb7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19
BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left,
BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right,
BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output);

-- result_MUX_uxn_opcodes_h_l668_c2_7056
result_MUX_uxn_opcodes_h_l668_c2_7056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l668_c2_7056_cond,
result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue,
result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse,
result_MUX_uxn_opcodes_h_l668_c2_7056_return_output);

-- poke_ram_uxn_opcodes_h_l670_c3_4d15
poke_ram_uxn_opcodes_h_l670_c3_4d15 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE,
poke_ram_uxn_opcodes_h_l670_c3_4d15_address,
poke_ram_uxn_opcodes_h_l670_c3_4d15_value);



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
 t2_register_uxn_opcodes_h_l665_c8_a368_return_output,
 l_register_uxn_opcodes_h_l666_c7_d13a_return_output,
 set_uxn_opcodes_h_l667_c9_8bb7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output,
 result_MUX_uxn_opcodes_h_l668_c2_7056_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l665_c8_a368_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l665_c8_a368_return_output : unsigned(15 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l666_c7_d13a_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l666_c7_d13a_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l667_c9_8bb7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_cond : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_mul := resize(to_unsigned(3, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_add := resize(to_signed(-3, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse := VAR_CLOCK_ENABLE;
     VAR_l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_k := VAR_k;
     VAR_l_register_uxn_opcodes_h_l666_c7_d13a_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l665_c8_a368_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l667_c9_8bb7] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l667_c9_8bb7_stack_index <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_stack_index;
     set_uxn_opcodes_h_l667_c9_8bb7_ins <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_ins;
     set_uxn_opcodes_h_l667_c9_8bb7_k <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_k;
     set_uxn_opcodes_h_l667_c9_8bb7_mul <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_mul;
     set_uxn_opcodes_h_l667_c9_8bb7_add <= VAR_set_uxn_opcodes_h_l667_c9_8bb7_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l667_c9_8bb7_return_output := set_uxn_opcodes_h_l667_c9_8bb7_return_output;

     -- l_register[uxn_opcodes_h_l666_c7_d13a] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_h_l666_c7_d13a_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_h_l666_c7_d13a_stack_index <= VAR_l_register_uxn_opcodes_h_l666_c7_d13a_stack_index;
     -- Outputs
     VAR_l_register_uxn_opcodes_h_l666_c7_d13a_return_output := l_register_uxn_opcodes_h_l666_c7_d13a_return_output;

     -- t2_register[uxn_opcodes_h_l665_c8_a368] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l665_c8_a368_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l665_c8_a368_stack_index <= VAR_t2_register_uxn_opcodes_h_l665_c8_a368_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l665_c8_a368_return_output := t2_register_uxn_opcodes_h_l665_c8_a368_return_output;

     -- Submodule level 1
     REG_VAR_n8 := VAR_l_register_uxn_opcodes_h_l666_c7_d13a_return_output;
     VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_value := VAR_l_register_uxn_opcodes_h_l666_c7_d13a_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left := VAR_set_uxn_opcodes_h_l667_c9_8bb7_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l667_c9_8bb7_return_output;
     VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_address := VAR_t2_register_uxn_opcodes_h_l665_c8_a368_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l665_c8_a368_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l668_c6_8e19] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_left;
     BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output := BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output;
     VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l668_c6_8e19_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l669_c1_e893] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output;

     -- result_MUX[uxn_opcodes_h_l668_c2_7056] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l668_c2_7056_cond <= VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_cond;
     result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue <= VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iftrue;
     result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse <= VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_return_output := result_MUX_uxn_opcodes_h_l668_c2_7056_return_output;

     -- Submodule level 3
     VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l669_c1_e893_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l668_c2_7056_return_output;
     -- poke_ram[uxn_opcodes_h_l670_c3_4d15] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_h_l670_c3_4d15_address <= VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_address;
     poke_ram_uxn_opcodes_h_l670_c3_4d15_value <= VAR_poke_ram_uxn_opcodes_h_l670_c3_4d15_value;
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
