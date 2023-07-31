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
entity opc_sft_0CLK_db76791a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sft_0CLK_db76791a;
architecture arch of opc_sft_0CLK_db76791a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l962_c7_eb63]
signal t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l962_c7_eb63_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l962_c7_eb63_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l963_c7_ae50]
signal n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l963_c7_ae50_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l963_c7_ae50_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l964_c9_818a]
signal set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l964_c9_818a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l965_c6_a724]
signal BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l966_c1_497a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l965_c2_34b0]
signal result_MUX_uxn_opcodes_h_l965_c2_34b0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l967_c37_3f05]
signal BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l967_c30_dd8d]
signal BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l967_c53_c502]
signal CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l967_c30_c247]
signal BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l967_c3_bafd]
signal put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l967_c3_bafd_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l967_c3_bafd_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l962_c7_eb63
t_register_uxn_opcodes_h_l962_c7_eb63 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l962_c7_eb63_stack_index,
t_register_uxn_opcodes_h_l962_c7_eb63_return_output);

-- n_register_uxn_opcodes_h_l963_c7_ae50
n_register_uxn_opcodes_h_l963_c7_ae50 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l963_c7_ae50_stack_index,
n_register_uxn_opcodes_h_l963_c7_ae50_return_output);

-- set_uxn_opcodes_h_l964_c9_818a
set_uxn_opcodes_h_l964_c9_818a : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE,
set_uxn_opcodes_h_l964_c9_818a_stack_index,
set_uxn_opcodes_h_l964_c9_818a_ins,
set_uxn_opcodes_h_l964_c9_818a_k,
set_uxn_opcodes_h_l964_c9_818a_mul,
set_uxn_opcodes_h_l964_c9_818a_add,
set_uxn_opcodes_h_l964_c9_818a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l965_c6_a724
BIN_OP_GT_uxn_opcodes_h_l965_c6_a724 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left,
BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right,
BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output);

-- result_MUX_uxn_opcodes_h_l965_c2_34b0
result_MUX_uxn_opcodes_h_l965_c2_34b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l965_c2_34b0_cond,
result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue,
result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse,
result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05
BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left,
BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right,
BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d
BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left,
BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right,
BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l967_c53_c502
CONST_SR_4_uxn_opcodes_h_l967_c53_c502 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x,
CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l967_c30_c247
BIN_OP_SL_uxn_opcodes_h_l967_c30_c247 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left,
BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right,
BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output);

-- put_stack_uxn_opcodes_h_l967_c3_bafd
put_stack_uxn_opcodes_h_l967_c3_bafd : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index,
put_stack_uxn_opcodes_h_l967_c3_bafd_offset,
put_stack_uxn_opcodes_h_l967_c3_bafd_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l962_c7_eb63_return_output,
 n_register_uxn_opcodes_h_l963_c7_ae50_return_output,
 set_uxn_opcodes_h_l964_c9_818a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output,
 result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output,
 BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output,
 CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output,
 BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l962_c7_eb63_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l962_c7_eb63_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l963_c7_ae50_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l963_c7_ae50_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l964_c9_818a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue := to_unsigned(1, 1);
     VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l964_c9_818a_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right := to_unsigned(15, 4);
     VAR_set_uxn_opcodes_h_l964_c9_818a_add := resize(to_signed(-1, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l964_c9_818a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l964_c9_818a_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l963_c7_ae50_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l964_c9_818a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l962_c7_eb63_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l964_c9_818a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l964_c9_818a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l964_c9_818a_stack_index <= VAR_set_uxn_opcodes_h_l964_c9_818a_stack_index;
     set_uxn_opcodes_h_l964_c9_818a_ins <= VAR_set_uxn_opcodes_h_l964_c9_818a_ins;
     set_uxn_opcodes_h_l964_c9_818a_k <= VAR_set_uxn_opcodes_h_l964_c9_818a_k;
     set_uxn_opcodes_h_l964_c9_818a_mul <= VAR_set_uxn_opcodes_h_l964_c9_818a_mul;
     set_uxn_opcodes_h_l964_c9_818a_add <= VAR_set_uxn_opcodes_h_l964_c9_818a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l964_c9_818a_return_output := set_uxn_opcodes_h_l964_c9_818a_return_output;

     -- n_register[uxn_opcodes_h_l963_c7_ae50] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l963_c7_ae50_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l963_c7_ae50_stack_index <= VAR_n_register_uxn_opcodes_h_l963_c7_ae50_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l963_c7_ae50_return_output := n_register_uxn_opcodes_h_l963_c7_ae50_return_output;

     -- t_register[uxn_opcodes_h_l962_c7_eb63] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l962_c7_eb63_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l962_c7_eb63_stack_index <= VAR_t_register_uxn_opcodes_h_l962_c7_eb63_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l962_c7_eb63_return_output := t_register_uxn_opcodes_h_l962_c7_eb63_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left := VAR_n_register_uxn_opcodes_h_l963_c7_ae50_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l963_c7_ae50_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left := VAR_set_uxn_opcodes_h_l964_c9_818a_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l964_c9_818a_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left := VAR_t_register_uxn_opcodes_h_l962_c7_eb63_return_output;
     VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x := VAR_t_register_uxn_opcodes_h_l962_c7_eb63_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l962_c7_eb63_return_output;
     -- CONST_SR_4[uxn_opcodes_h_l967_c53_c502] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x <= VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output := CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l967_c37_3f05] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_left;
     BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output := BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l965_c6_a724] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_left;
     BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output := BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l967_c37_3f05_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output;
     VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l965_c6_a724_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right := VAR_CONST_SR_4_uxn_opcodes_h_l967_c53_c502_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l967_c30_dd8d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_left;
     BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output := BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l966_c1_497a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output;

     -- result_MUX[uxn_opcodes_h_l965_c2_34b0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l965_c2_34b0_cond <= VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_cond;
     result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue <= VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iftrue;
     result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse <= VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output := result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left := VAR_BIN_OP_SR_uxn_opcodes_h_l967_c30_dd8d_return_output;
     VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l966_c1_497a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l965_c2_34b0_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l967_c30_c247] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_left;
     BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output := BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output;

     -- Submodule level 4
     VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_value := VAR_BIN_OP_SL_uxn_opcodes_h_l967_c30_c247_return_output;
     -- put_stack[uxn_opcodes_h_l967_c3_bafd] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index <= VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_stack_index;
     put_stack_uxn_opcodes_h_l967_c3_bafd_offset <= VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_offset;
     put_stack_uxn_opcodes_h_l967_c3_bafd_value <= VAR_put_stack_uxn_opcodes_h_l967_c3_bafd_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
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
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
