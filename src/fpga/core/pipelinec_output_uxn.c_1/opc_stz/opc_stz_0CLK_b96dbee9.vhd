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
entity opc_stz_0CLK_b96dbee9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_stz_0CLK_b96dbee9;
architecture arch of opc_stz_0CLK_b96dbee9 is
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
-- t_register[uxn_opcodes_h_l543_c7_1a4f]
signal t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l543_c7_1a4f_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l544_c7_43d8]
signal n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_43d8_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l544_c7_43d8_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l546_c9_9bea]
signal set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l546_c9_9bea_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l547_c6_66e4]
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_e652]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l547_c2_0eef]
signal result_MUX_uxn_opcodes_h_l547_c2_0eef_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output : unsigned(0 downto 0);

-- main_ram_write[uxn_opcodes_h_l549_c3_9123]
signal main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_write_uxn_opcodes_h_l549_c3_9123_address : unsigned(15 downto 0);
signal main_ram_write_uxn_opcodes_h_l549_c3_9123_value : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l543_c7_1a4f
t_register_uxn_opcodes_h_l543_c7_1a4f : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index,
t_register_uxn_opcodes_h_l543_c7_1a4f_return_output);

-- n_register_uxn_opcodes_h_l544_c7_43d8
n_register_uxn_opcodes_h_l544_c7_43d8 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l544_c7_43d8_stack_index,
n_register_uxn_opcodes_h_l544_c7_43d8_return_output);

-- set_uxn_opcodes_h_l546_c9_9bea
set_uxn_opcodes_h_l546_c9_9bea : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE,
set_uxn_opcodes_h_l546_c9_9bea_stack_index,
set_uxn_opcodes_h_l546_c9_9bea_ins,
set_uxn_opcodes_h_l546_c9_9bea_k,
set_uxn_opcodes_h_l546_c9_9bea_mul,
set_uxn_opcodes_h_l546_c9_9bea_add,
set_uxn_opcodes_h_l546_c9_9bea_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4
BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left,
BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right,
BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output);

-- result_MUX_uxn_opcodes_h_l547_c2_0eef
result_MUX_uxn_opcodes_h_l547_c2_0eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l547_c2_0eef_cond,
result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue,
result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse,
result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output);

-- main_ram_write_uxn_opcodes_h_l549_c3_9123
main_ram_write_uxn_opcodes_h_l549_c3_9123 : entity work.main_ram_write_0CLK_b45f1687 port map (
clk,
main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE,
main_ram_write_uxn_opcodes_h_l549_c3_9123_address,
main_ram_write_uxn_opcodes_h_l549_c3_9123_value);



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
 t_register_uxn_opcodes_h_l543_c7_1a4f_return_output,
 n_register_uxn_opcodes_h_l544_c7_43d8_return_output,
 set_uxn_opcodes_h_l546_c9_9bea_return_output,
 BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output,
 result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_43d8_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l544_c7_43d8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_234d_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l546_c9_9bea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_cond : unsigned(0 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_address : unsigned(15 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_value : unsigned(7 downto 0);
 variable VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l546_c9_9bea_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l546_c9_9bea_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l546_c9_9bea_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l546_c9_9bea_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l544_c7_43d8_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l546_c9_9bea_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l546_c9_9bea] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l546_c9_9bea_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l546_c9_9bea_stack_index <= VAR_set_uxn_opcodes_h_l546_c9_9bea_stack_index;
     set_uxn_opcodes_h_l546_c9_9bea_ins <= VAR_set_uxn_opcodes_h_l546_c9_9bea_ins;
     set_uxn_opcodes_h_l546_c9_9bea_k <= VAR_set_uxn_opcodes_h_l546_c9_9bea_k;
     set_uxn_opcodes_h_l546_c9_9bea_mul <= VAR_set_uxn_opcodes_h_l546_c9_9bea_mul;
     set_uxn_opcodes_h_l546_c9_9bea_add <= VAR_set_uxn_opcodes_h_l546_c9_9bea_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l546_c9_9bea_return_output := set_uxn_opcodes_h_l546_c9_9bea_return_output;

     -- n_register[uxn_opcodes_h_l544_c7_43d8] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l544_c7_43d8_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l544_c7_43d8_stack_index <= VAR_n_register_uxn_opcodes_h_l544_c7_43d8_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l544_c7_43d8_return_output := n_register_uxn_opcodes_h_l544_c7_43d8_return_output;

     -- t_register[uxn_opcodes_h_l543_c7_1a4f] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index <= VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_return_output := t_register_uxn_opcodes_h_l543_c7_1a4f_return_output;

     -- Submodule level 1
     VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_value := VAR_n_register_uxn_opcodes_h_l544_c7_43d8_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l544_c7_43d8_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left := VAR_set_uxn_opcodes_h_l546_c9_9bea_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l546_c9_9bea_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_return_output;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l545_c8_234d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_234d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l543_c7_1a4f_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l547_c6_66e4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_left;
     BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output := BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l547_c6_66e4_return_output;
     VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_234d_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l545_c8_234d_return_output;
     -- result_MUX[uxn_opcodes_h_l547_c2_0eef] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l547_c2_0eef_cond <= VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_cond;
     result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue <= VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iftrue;
     result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse <= VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output := result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l548_c1_e652] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output;

     -- Submodule level 3
     VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l548_c1_e652_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l547_c2_0eef_return_output;
     -- main_ram_write[uxn_opcodes_h_l549_c3_9123] LATENCY=0
     -- Clock enable
     main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE <= VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_CLOCK_ENABLE;
     -- Inputs
     main_ram_write_uxn_opcodes_h_l549_c3_9123_address <= VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_address;
     main_ram_write_uxn_opcodes_h_l549_c3_9123_value <= VAR_main_ram_write_uxn_opcodes_h_l549_c3_9123_value;
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
