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
entity opc_sta2_0CLK_5153798f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sta2_0CLK_5153798f;
architecture arch of opc_sta2_0CLK_5153798f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l680_c8_be0e]
signal t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l680_c8_be0e_return_output : unsigned(15 downto 0);

-- n2_register[uxn_opcodes_h_l681_c8_0c78]
signal n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_h_l681_c8_0c78_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l682_c9_56bc]
signal set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l682_c9_56bc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l683_c6_aa5d]
signal BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l684_c1_98cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l683_c2_c79a]
signal result_MUX_uxn_opcodes_h_l683_c2_c79a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output : unsigned(0 downto 0);

-- poke2_ram[uxn_opcodes_h_l685_c3_861f]
signal poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke2_ram_uxn_opcodes_h_l685_c3_861f_address : unsigned(15 downto 0);
signal poke2_ram_uxn_opcodes_h_l685_c3_861f_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l680_c8_be0e
t2_register_uxn_opcodes_h_l680_c8_be0e : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index,
t2_register_uxn_opcodes_h_l680_c8_be0e_return_output);

-- n2_register_uxn_opcodes_h_l681_c8_0c78
n2_register_uxn_opcodes_h_l681_c8_0c78 : entity work.n2_register_0CLK_d6ba51db port map (
clk,
n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE,
n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index,
n2_register_uxn_opcodes_h_l681_c8_0c78_return_output);

-- set_uxn_opcodes_h_l682_c9_56bc
set_uxn_opcodes_h_l682_c9_56bc : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE,
set_uxn_opcodes_h_l682_c9_56bc_stack_index,
set_uxn_opcodes_h_l682_c9_56bc_ins,
set_uxn_opcodes_h_l682_c9_56bc_k,
set_uxn_opcodes_h_l682_c9_56bc_mul,
set_uxn_opcodes_h_l682_c9_56bc_add,
set_uxn_opcodes_h_l682_c9_56bc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d
BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left,
BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right,
BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output);

-- result_MUX_uxn_opcodes_h_l683_c2_c79a
result_MUX_uxn_opcodes_h_l683_c2_c79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l683_c2_c79a_cond,
result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue,
result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse,
result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output);

-- poke2_ram_uxn_opcodes_h_l685_c3_861f
poke2_ram_uxn_opcodes_h_l685_c3_861f : entity work.poke2_ram_0CLK_cf9aa9fa port map (
clk,
poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE,
poke2_ram_uxn_opcodes_h_l685_c3_861f_address,
poke2_ram_uxn_opcodes_h_l685_c3_861f_value);



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
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l680_c8_be0e_return_output,
 n2_register_uxn_opcodes_h_l681_c8_0c78_return_output,
 set_uxn_opcodes_h_l682_c9_56bc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output,
 result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_return_output : unsigned(15 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l682_c9_56bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_cond : unsigned(0 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_address : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_value : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l682_c9_56bc_mul := resize(to_unsigned(4, 3), 8);
     VAR_set_uxn_opcodes_h_l682_c9_56bc_add := resize(to_signed(-4, 4), 8);
     VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse := VAR_CLOCK_ENABLE;
     VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l682_c9_56bc_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l682_c9_56bc_k := VAR_k;
     VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l682_c9_56bc_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index := VAR_stack_index;
     -- n2_register[uxn_opcodes_h_l681_c8_0c78] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index <= VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_stack_index;
     -- Outputs
     VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_return_output := n2_register_uxn_opcodes_h_l681_c8_0c78_return_output;

     -- t2_register[uxn_opcodes_h_l680_c8_be0e] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index <= VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_return_output := t2_register_uxn_opcodes_h_l680_c8_be0e_return_output;

     -- set[uxn_opcodes_h_l682_c9_56bc] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l682_c9_56bc_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l682_c9_56bc_stack_index <= VAR_set_uxn_opcodes_h_l682_c9_56bc_stack_index;
     set_uxn_opcodes_h_l682_c9_56bc_ins <= VAR_set_uxn_opcodes_h_l682_c9_56bc_ins;
     set_uxn_opcodes_h_l682_c9_56bc_k <= VAR_set_uxn_opcodes_h_l682_c9_56bc_k;
     set_uxn_opcodes_h_l682_c9_56bc_mul <= VAR_set_uxn_opcodes_h_l682_c9_56bc_mul;
     set_uxn_opcodes_h_l682_c9_56bc_add <= VAR_set_uxn_opcodes_h_l682_c9_56bc_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l682_c9_56bc_return_output := set_uxn_opcodes_h_l682_c9_56bc_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_value := VAR_n2_register_uxn_opcodes_h_l681_c8_0c78_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left := VAR_set_uxn_opcodes_h_l682_c9_56bc_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l682_c9_56bc_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_address := VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l680_c8_be0e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l683_c6_aa5d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_left;
     BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output := BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output;
     VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l683_c6_aa5d_return_output;
     -- result_MUX[uxn_opcodes_h_l683_c2_c79a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l683_c2_c79a_cond <= VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_cond;
     result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iftrue;
     result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output := result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l684_c1_98cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output;

     -- Submodule level 3
     VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l684_c1_98cb_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l683_c2_c79a_return_output;
     -- poke2_ram[uxn_opcodes_h_l685_c3_861f] LATENCY=0
     -- Clock enable
     poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE <= VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_CLOCK_ENABLE;
     -- Inputs
     poke2_ram_uxn_opcodes_h_l685_c3_861f_address <= VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_address;
     poke2_ram_uxn_opcodes_h_l685_c3_861f_value <= VAR_poke2_ram_uxn_opcodes_h_l685_c3_861f_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
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
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
