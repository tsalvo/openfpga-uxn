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
entity opc_stz_0CLK_f0550f9f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_stz_0CLK_f0550f9f;
architecture arch of opc_stz_0CLK_f0550f9f is
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
-- t_register[uxn_opcodes_h_l543_c7_d719]
signal t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_d719_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_d719_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l544_c7_ae43]
signal n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_ae43_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_ae43_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l546_c9_c2d1]
signal set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_c2d1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l547_c6_3097]
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_44b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l547_c2_5f37]
signal result_MUX_uxn_opcodes_h_l547_c2_5f37_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output : unsigned(0 downto 0);

-- poke_ram[uxn_opcodes_h_l549_c3_17c9]
signal poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_h_l549_c3_17c9_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_h_l549_c3_17c9_value : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l543_c7_d719
t_register_uxn_opcodes_h_l543_c7_d719 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l543_c7_d719_stack_index,
t_register_uxn_opcodes_h_l543_c7_d719_return_output);

-- n_register_uxn_opcodes_h_l544_c7_ae43
n_register_uxn_opcodes_h_l544_c7_ae43 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l544_c7_ae43_stack_index,
n_register_uxn_opcodes_h_l544_c7_ae43_return_output);

-- set_uxn_opcodes_h_l546_c9_c2d1
set_uxn_opcodes_h_l546_c9_c2d1 : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE,
set_uxn_opcodes_h_l546_c9_c2d1_stack_index,
set_uxn_opcodes_h_l546_c9_c2d1_ins,
set_uxn_opcodes_h_l546_c9_c2d1_k,
set_uxn_opcodes_h_l546_c9_c2d1_mul,
set_uxn_opcodes_h_l546_c9_c2d1_add,
set_uxn_opcodes_h_l546_c9_c2d1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l547_c6_3097
BIN_OP_GT_uxn_opcodes_h_l547_c6_3097 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left,
BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right,
BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output);

-- result_MUX_uxn_opcodes_h_l547_c2_5f37
result_MUX_uxn_opcodes_h_l547_c2_5f37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l547_c2_5f37_cond,
result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue,
result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse,
result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output);

-- poke_ram_uxn_opcodes_h_l549_c3_17c9
poke_ram_uxn_opcodes_h_l549_c3_17c9 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE,
poke_ram_uxn_opcodes_h_l549_c3_17c9_address,
poke_ram_uxn_opcodes_h_l549_c3_17c9_value);



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
 t_register_uxn_opcodes_h_l543_c7_d719_return_output,
 n_register_uxn_opcodes_h_l544_c7_ae43_return_output,
 set_uxn_opcodes_h_l546_c9_c2d1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output,
 result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_d719_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_d719_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_ae43_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_ae43_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_8aac_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_cond : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l544_c7_ae43_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l543_c7_d719_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l546_c9_c2d1] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l546_c9_c2d1_stack_index <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_stack_index;
     set_uxn_opcodes_h_l546_c9_c2d1_ins <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_ins;
     set_uxn_opcodes_h_l546_c9_c2d1_k <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_k;
     set_uxn_opcodes_h_l546_c9_c2d1_mul <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_mul;
     set_uxn_opcodes_h_l546_c9_c2d1_add <= VAR_set_uxn_opcodes_h_l546_c9_c2d1_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l546_c9_c2d1_return_output := set_uxn_opcodes_h_l546_c9_c2d1_return_output;

     -- t_register[uxn_opcodes_h_l543_c7_d719] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l543_c7_d719_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l543_c7_d719_stack_index <= VAR_t_register_uxn_opcodes_h_l543_c7_d719_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l543_c7_d719_return_output := t_register_uxn_opcodes_h_l543_c7_d719_return_output;

     -- n_register[uxn_opcodes_h_l544_c7_ae43] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l544_c7_ae43_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l544_c7_ae43_stack_index <= VAR_n_register_uxn_opcodes_h_l544_c7_ae43_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l544_c7_ae43_return_output := n_register_uxn_opcodes_h_l544_c7_ae43_return_output;

     -- Submodule level 1
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l544_c7_ae43_return_output;
     VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_value := VAR_n_register_uxn_opcodes_h_l544_c7_ae43_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left := VAR_set_uxn_opcodes_h_l546_c9_c2d1_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l546_c9_c2d1_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l543_c7_d719_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l547_c6_3097] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_left;
     BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output := BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l545_c8_8aac] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_8aac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l543_c7_d719_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output;
     VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_3097_return_output;
     VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_8aac_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_8aac_return_output;
     -- result_MUX[uxn_opcodes_h_l547_c2_5f37] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l547_c2_5f37_cond <= VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_cond;
     result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue <= VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iftrue;
     result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse <= VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output := result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_44b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output;

     -- Submodule level 3
     VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_44b1_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l547_c2_5f37_return_output;
     -- poke_ram[uxn_opcodes_h_l549_c3_17c9] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_h_l549_c3_17c9_address <= VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_address;
     poke_ram_uxn_opcodes_h_l549_c3_17c9_value <= VAR_poke_ram_uxn_opcodes_h_l549_c3_17c9_value;
     -- Outputs

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
