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
entity opc_sth_0CLK_40fc940d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth_0CLK_40fc940d;
architecture arch of opc_sth_0CLK_40fc940d is
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
-- t_register[uxn_opcodes_h_l483_c7_e7a4]
signal t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_e7a4_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l484_c9_d0ad]
signal set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_d0ad_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c6_5dc4]
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_e5d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l485_c2_eed9]
signal tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l485_c2_eed9]
signal result_MUX_uxn_opcodes_h_l485_c2_eed9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c21_c2fa]
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l487_c21_8c71]
signal MUX_uxn_opcodes_h_l487_c21_8c71_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_8c71_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_8c71_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_8c71_return_output : unsigned(0 downto 0);

-- push_stack[uxn_opcodes_h_l487_c10_ca1d]
signal push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_ca1d_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_ca1d_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l488_c7_459d]
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l488_c3_1a45]
signal result_MUX_uxn_opcodes_h_l488_c3_1a45_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l483_c7_e7a4
t_register_uxn_opcodes_h_l483_c7_e7a4 : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index,
t_register_uxn_opcodes_h_l483_c7_e7a4_return_output);

-- set_uxn_opcodes_h_l484_c9_d0ad
set_uxn_opcodes_h_l484_c9_d0ad : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE,
set_uxn_opcodes_h_l484_c9_d0ad_stack_index,
set_uxn_opcodes_h_l484_c9_d0ad_ins,
set_uxn_opcodes_h_l484_c9_d0ad_k,
set_uxn_opcodes_h_l484_c9_d0ad_mul,
set_uxn_opcodes_h_l484_c9_d0ad_add,
set_uxn_opcodes_h_l484_c9_d0ad_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4
BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left,
BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right,
BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l485_c2_eed9
tmp8_MUX_uxn_opcodes_h_l485_c2_eed9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond,
tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue,
tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse,
tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output);

-- result_MUX_uxn_opcodes_h_l485_c2_eed9
result_MUX_uxn_opcodes_h_l485_c2_eed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l485_c2_eed9_cond,
result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue,
result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse,
result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa
BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left,
BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right,
BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output);

-- MUX_uxn_opcodes_h_l487_c21_8c71
MUX_uxn_opcodes_h_l487_c21_8c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c21_8c71_cond,
MUX_uxn_opcodes_h_l487_c21_8c71_iftrue,
MUX_uxn_opcodes_h_l487_c21_8c71_iffalse,
MUX_uxn_opcodes_h_l487_c21_8c71_return_output);

-- push_stack_uxn_opcodes_h_l487_c10_ca1d
push_stack_uxn_opcodes_h_l487_c10_ca1d : entity work.push_stack_0CLK_35cd9fc6 port map (
clk,
push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index,
push_stack_uxn_opcodes_h_l487_c10_ca1d_ins,
push_stack_uxn_opcodes_h_l487_c10_ca1d_value,
push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l488_c7_459d
BIN_OP_GT_uxn_opcodes_h_l488_c7_459d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left,
BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right,
BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output);

-- result_MUX_uxn_opcodes_h_l488_c3_1a45
result_MUX_uxn_opcodes_h_l488_c3_1a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l488_c3_1a45_cond,
result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue,
result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse,
result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output);



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
 t_register_uxn_opcodes_h_l483_c7_e7a4_return_output,
 set_uxn_opcodes_h_l484_c9_d0ad_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output,
 tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output,
 result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output,
 MUX_uxn_opcodes_h_l487_c21_8c71_return_output,
 push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output,
 result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_d0ad_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_cond : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_value : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_8c71_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_8c71_return_output : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_cond : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right := to_unsigned(64, 7);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_k := VAR_k;
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l484_c9_d0ad] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l484_c9_d0ad_stack_index <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_stack_index;
     set_uxn_opcodes_h_l484_c9_d0ad_ins <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_ins;
     set_uxn_opcodes_h_l484_c9_d0ad_k <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_k;
     set_uxn_opcodes_h_l484_c9_d0ad_mul <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_mul;
     set_uxn_opcodes_h_l484_c9_d0ad_add <= VAR_set_uxn_opcodes_h_l484_c9_d0ad_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l484_c9_d0ad_return_output := set_uxn_opcodes_h_l484_c9_d0ad_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l487_c21_c2fa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output;

     -- t_register[uxn_opcodes_h_l483_c7_e7a4] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index <= VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_return_output := t_register_uxn_opcodes_h_l483_c7_e7a4_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l487_c21_8c71_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c2fa_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left := VAR_set_uxn_opcodes_h_l484_c9_d0ad_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue := VAR_set_uxn_opcodes_h_l484_c9_d0ad_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_value := VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l483_c7_e7a4_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l485_c6_5dc4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output;

     -- MUX[uxn_opcodes_h_l487_c21_8c71] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c21_8c71_cond <= VAR_MUX_uxn_opcodes_h_l487_c21_8c71_cond;
     MUX_uxn_opcodes_h_l487_c21_8c71_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iftrue;
     MUX_uxn_opcodes_h_l487_c21_8c71_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c21_8c71_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c21_8c71_return_output := MUX_uxn_opcodes_h_l487_c21_8c71_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5dc4_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index := VAR_MUX_uxn_opcodes_h_l487_c21_8c71_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_e5d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output;

     -- Submodule level 3
     VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_e5d3_return_output;
     -- push_stack[uxn_opcodes_h_l487_c10_ca1d] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index <= VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_stack_index;
     push_stack_uxn_opcodes_h_l487_c10_ca1d_ins <= VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_ins;
     push_stack_uxn_opcodes_h_l487_c10_ca1d_value <= VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output := push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left := VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse := VAR_push_stack_uxn_opcodes_h_l487_c10_ca1d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l488_c7_459d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_left;
     BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output := BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l485_c2_eed9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_cond;
     tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output := tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_459d_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_eed9_return_output;
     -- result_MUX[uxn_opcodes_h_l488_c3_1a45] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l488_c3_1a45_cond <= VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_cond;
     result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue <= VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iftrue;
     result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse <= VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output := result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse := VAR_result_MUX_uxn_opcodes_h_l488_c3_1a45_return_output;
     -- result_MUX[uxn_opcodes_h_l485_c2_eed9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l485_c2_eed9_cond <= VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_cond;
     result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue <= VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iftrue;
     result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse <= VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output := result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l485_c2_eed9_return_output;
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
