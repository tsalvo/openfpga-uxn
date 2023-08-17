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
-- Submodules: 11
entity opc_str_0CLK_81c67800 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_str_0CLK_81c67800;
architecture arch of opc_str_0CLK_81c67800 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l605_c7_a495]
signal t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l605_c7_a495_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l605_c7_a495_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l606_c7_74d0]
signal n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l606_c7_74d0_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l606_c7_74d0_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l607_c9_473a]
signal set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l607_c9_473a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l608_c6_6f75]
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c1_5d78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l608_c2_dd9a]
signal result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l608_c2_dd9a]
signal t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output : unsigned(15 downto 0);

-- pc_get[uxn_opcodes_h_l610_c9_98e2]
signal pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l610_c9_98e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l610_c9_f9f1]
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output : signed(17 downto 0);

-- poke_ram[uxn_opcodes_h_l611_c3_7063]
signal poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_h_l611_c3_7063_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_h_l611_c3_7063_value : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l605_c7_a495
t_register_uxn_opcodes_h_l605_c7_a495 : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l605_c7_a495_stack_index,
t_register_uxn_opcodes_h_l605_c7_a495_return_output);

-- n_register_uxn_opcodes_h_l606_c7_74d0
n_register_uxn_opcodes_h_l606_c7_74d0 : entity work.n_register_0CLK_31d26cd6 port map (
clk,
n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l606_c7_74d0_stack_index,
n_register_uxn_opcodes_h_l606_c7_74d0_return_output);

-- set_uxn_opcodes_h_l607_c9_473a
set_uxn_opcodes_h_l607_c9_473a : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE,
set_uxn_opcodes_h_l607_c9_473a_stack_index,
set_uxn_opcodes_h_l607_c9_473a_ins,
set_uxn_opcodes_h_l607_c9_473a_k,
set_uxn_opcodes_h_l607_c9_473a_mul,
set_uxn_opcodes_h_l607_c9_473a_add,
set_uxn_opcodes_h_l607_c9_473a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75
BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left,
BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right,
BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output);

-- result_MUX_uxn_opcodes_h_l608_c2_dd9a
result_MUX_uxn_opcodes_h_l608_c2_dd9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond,
result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue,
result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse,
result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output);

-- t16_MUX_uxn_opcodes_h_l608_c2_dd9a
t16_MUX_uxn_opcodes_h_l608_c2_dd9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond,
t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue,
t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse,
t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output);

-- pc_get_uxn_opcodes_h_l610_c9_98e2
pc_get_uxn_opcodes_h_l610_c9_98e2 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l610_c9_98e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left,
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right,
BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output);

-- poke_ram_uxn_opcodes_h_l611_c3_7063
poke_ram_uxn_opcodes_h_l611_c3_7063 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE,
poke_ram_uxn_opcodes_h_l611_c3_7063_address,
poke_ram_uxn_opcodes_h_l611_c3_7063_value);



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
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l605_c7_a495_return_output,
 n_register_uxn_opcodes_h_l606_c7_74d0_return_output,
 set_uxn_opcodes_h_l607_c9_473a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output,
 result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output,
 t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output,
 pc_get_uxn_opcodes_h_l610_c9_98e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_a495_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l605_c7_a495_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_74d0_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l606_c7_74d0_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l607_c9_473a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l610_c3_dd39 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_a8c4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output : signed(17 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l607_c9_473a_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l607_c9_473a_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l607_c9_473a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l607_c9_473a_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l606_c7_74d0_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l607_c9_473a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l605_c7_a495_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue := t16;
     -- set[uxn_opcodes_h_l607_c9_473a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l607_c9_473a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l607_c9_473a_stack_index <= VAR_set_uxn_opcodes_h_l607_c9_473a_stack_index;
     set_uxn_opcodes_h_l607_c9_473a_ins <= VAR_set_uxn_opcodes_h_l607_c9_473a_ins;
     set_uxn_opcodes_h_l607_c9_473a_k <= VAR_set_uxn_opcodes_h_l607_c9_473a_k;
     set_uxn_opcodes_h_l607_c9_473a_mul <= VAR_set_uxn_opcodes_h_l607_c9_473a_mul;
     set_uxn_opcodes_h_l607_c9_473a_add <= VAR_set_uxn_opcodes_h_l607_c9_473a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l607_c9_473a_return_output := set_uxn_opcodes_h_l607_c9_473a_return_output;

     -- t_register[uxn_opcodes_h_l605_c7_a495] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l605_c7_a495_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l605_c7_a495_stack_index <= VAR_t_register_uxn_opcodes_h_l605_c7_a495_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l605_c7_a495_return_output := t_register_uxn_opcodes_h_l605_c7_a495_return_output;

     -- n_register[uxn_opcodes_h_l606_c7_74d0] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l606_c7_74d0_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l606_c7_74d0_stack_index <= VAR_n_register_uxn_opcodes_h_l606_c7_74d0_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l606_c7_74d0_return_output := n_register_uxn_opcodes_h_l606_c7_74d0_return_output;

     -- Submodule level 1
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l606_c7_74d0_return_output;
     VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_value := VAR_n_register_uxn_opcodes_h_l606_c7_74d0_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left := VAR_set_uxn_opcodes_h_l607_c9_473a_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l607_c9_473a_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l605_c7_a495_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l608_c6_6f75] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_left;
     BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output := BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l610_c21_a8c4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_a8c4_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l605_c7_a495_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output;
     VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l608_c6_6f75_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l610_c21_a8c4_return_output;
     -- result_MUX[uxn_opcodes_h_l608_c2_dd9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond <= VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_cond;
     result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue;
     result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output := result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l609_c1_5d78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output;

     -- Submodule level 3
     VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output;
     VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l609_c1_5d78_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output;
     -- pc_get[uxn_opcodes_h_l610_c9_98e2] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_return_output := pc_get_uxn_opcodes_h_l610_c9_98e2_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l610_c9_98e2_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l610_c9_f9f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l610_c3_dd39 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l610_c9_f9f1_return_output)),16);
     VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_address := VAR_t16_uxn_opcodes_h_l610_c3_dd39;
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse := VAR_t16_uxn_opcodes_h_l610_c3_dd39;
     -- t16_MUX[uxn_opcodes_h_l608_c2_dd9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_cond;
     t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iftrue;
     t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output := t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output;

     -- poke_ram[uxn_opcodes_h_l611_c3_7063] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_h_l611_c3_7063_address <= VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_address;
     poke_ram_uxn_opcodes_h_l611_c3_7063_value <= VAR_poke_ram_uxn_opcodes_h_l611_c3_7063_value;
     -- Outputs

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l608_c2_dd9a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
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
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
