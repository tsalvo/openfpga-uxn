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
entity opc_stz_0CLK_bd9499a8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_stz_0CLK_bd9499a8;
architecture arch of opc_stz_0CLK_bd9499a8 is
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
-- t_register[uxn_opcodes_h_l543_c7_51bd]
signal t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_51bd_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_51bd_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l544_c7_6872]
signal n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_6872_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_6872_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l546_c9_7c2f]
signal set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_7c2f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l547_c6_cdf1]
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_4a44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l547_c2_aead]
signal result_MUX_uxn_opcodes_h_l547_c2_aead_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_aead_return_output : unsigned(0 downto 0);

-- poke_ram[uxn_opcodes_h_l549_c3_ce1e]
signal poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_h_l549_c3_ce1e_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_h_l549_c3_ce1e_value : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l543_c7_51bd
t_register_uxn_opcodes_h_l543_c7_51bd : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l543_c7_51bd_stack_index,
t_register_uxn_opcodes_h_l543_c7_51bd_return_output);

-- n_register_uxn_opcodes_h_l544_c7_6872
n_register_uxn_opcodes_h_l544_c7_6872 : entity work.n_register_0CLK_0e5af5c0 port map (
clk,
n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l544_c7_6872_stack_index,
n_register_uxn_opcodes_h_l544_c7_6872_return_output);

-- set_uxn_opcodes_h_l546_c9_7c2f
set_uxn_opcodes_h_l546_c9_7c2f : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE,
set_uxn_opcodes_h_l546_c9_7c2f_stack_index,
set_uxn_opcodes_h_l546_c9_7c2f_ins,
set_uxn_opcodes_h_l546_c9_7c2f_k,
set_uxn_opcodes_h_l546_c9_7c2f_mul,
set_uxn_opcodes_h_l546_c9_7c2f_add,
set_uxn_opcodes_h_l546_c9_7c2f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1
BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left,
BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right,
BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output);

-- result_MUX_uxn_opcodes_h_l547_c2_aead
result_MUX_uxn_opcodes_h_l547_c2_aead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l547_c2_aead_cond,
result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue,
result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse,
result_MUX_uxn_opcodes_h_l547_c2_aead_return_output);

-- poke_ram_uxn_opcodes_h_l549_c3_ce1e
poke_ram_uxn_opcodes_h_l549_c3_ce1e : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE,
poke_ram_uxn_opcodes_h_l549_c3_ce1e_address,
poke_ram_uxn_opcodes_h_l549_c3_ce1e_value);



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
 t_register_uxn_opcodes_h_l543_c7_51bd_return_output,
 n_register_uxn_opcodes_h_l544_c7_6872_return_output,
 set_uxn_opcodes_h_l546_c9_7c2f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output,
 result_MUX_uxn_opcodes_h_l547_c2_aead_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_51bd_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_51bd_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_6872_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_6872_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_f430_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_7c2f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_cond : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_add := resize(to_signed(-2, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l544_c7_6872_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l543_c7_51bd_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l543_c7_51bd] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l543_c7_51bd_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l543_c7_51bd_stack_index <= VAR_t_register_uxn_opcodes_h_l543_c7_51bd_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l543_c7_51bd_return_output := t_register_uxn_opcodes_h_l543_c7_51bd_return_output;

     -- n_register[uxn_opcodes_h_l544_c7_6872] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l544_c7_6872_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l544_c7_6872_stack_index <= VAR_n_register_uxn_opcodes_h_l544_c7_6872_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l544_c7_6872_return_output := n_register_uxn_opcodes_h_l544_c7_6872_return_output;

     -- set[uxn_opcodes_h_l546_c9_7c2f] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l546_c9_7c2f_stack_index <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_stack_index;
     set_uxn_opcodes_h_l546_c9_7c2f_ins <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_ins;
     set_uxn_opcodes_h_l546_c9_7c2f_k <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_k;
     set_uxn_opcodes_h_l546_c9_7c2f_mul <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_mul;
     set_uxn_opcodes_h_l546_c9_7c2f_add <= VAR_set_uxn_opcodes_h_l546_c9_7c2f_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l546_c9_7c2f_return_output := set_uxn_opcodes_h_l546_c9_7c2f_return_output;

     -- Submodule level 1
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l544_c7_6872_return_output;
     VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_value := VAR_n_register_uxn_opcodes_h_l544_c7_6872_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left := VAR_set_uxn_opcodes_h_l546_c9_7c2f_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l546_c9_7c2f_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l543_c7_51bd_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l547_c6_cdf1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_left;
     BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output := BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l545_c8_f430] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_f430_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l543_c7_51bd_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output;
     VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_cdf1_return_output;
     VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_f430_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_f430_return_output;
     -- result_MUX[uxn_opcodes_h_l547_c2_aead] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l547_c2_aead_cond <= VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_cond;
     result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue <= VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iftrue;
     result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse <= VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_return_output := result_MUX_uxn_opcodes_h_l547_c2_aead_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_4a44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output;

     -- Submodule level 3
     VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_4a44_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l547_c2_aead_return_output;
     -- poke_ram[uxn_opcodes_h_l549_c3_ce1e] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_h_l549_c3_ce1e_address <= VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_address;
     poke_ram_uxn_opcodes_h_l549_c3_ce1e_value <= VAR_poke_ram_uxn_opcodes_h_l549_c3_ce1e_value;
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
