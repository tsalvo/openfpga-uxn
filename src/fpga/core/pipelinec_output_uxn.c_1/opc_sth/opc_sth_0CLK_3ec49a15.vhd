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
entity opc_sth_0CLK_3ec49a15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth_0CLK_3ec49a15;
architecture arch of opc_sth_0CLK_3ec49a15 is
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
-- t_register[uxn_opcodes_h_l483_c7_5e4b]
signal t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_5e4b_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l484_c9_fa03]
signal set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_fa03_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c6_5afb]
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_007d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l485_c2_f2c6]
signal result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l485_c2_f2c6]
signal tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c21_998f]
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l487_c21_9b08]
signal MUX_uxn_opcodes_h_l487_c21_9b08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_9b08_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_9b08_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_9b08_return_output : unsigned(0 downto 0);

-- push_stack[uxn_opcodes_h_l487_c10_2eca]
signal push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_2eca_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_2eca_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_2eca_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l488_c7_8d54]
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l488_c3_c338]
signal result_MUX_uxn_opcodes_h_l488_c3_c338_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_c338_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l483_c7_5e4b
t_register_uxn_opcodes_h_l483_c7_5e4b : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index,
t_register_uxn_opcodes_h_l483_c7_5e4b_return_output);

-- set_uxn_opcodes_h_l484_c9_fa03
set_uxn_opcodes_h_l484_c9_fa03 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE,
set_uxn_opcodes_h_l484_c9_fa03_stack_index,
set_uxn_opcodes_h_l484_c9_fa03_ins,
set_uxn_opcodes_h_l484_c9_fa03_k,
set_uxn_opcodes_h_l484_c9_fa03_mul,
set_uxn_opcodes_h_l484_c9_fa03_add,
set_uxn_opcodes_h_l484_c9_fa03_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb
BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left,
BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right,
BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output);

-- result_MUX_uxn_opcodes_h_l485_c2_f2c6
result_MUX_uxn_opcodes_h_l485_c2_f2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond,
result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue,
result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse,
result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6
tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond,
tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue,
tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse,
tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c21_998f
BIN_OP_AND_uxn_opcodes_h_l487_c21_998f : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left,
BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right,
BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output);

-- MUX_uxn_opcodes_h_l487_c21_9b08
MUX_uxn_opcodes_h_l487_c21_9b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c21_9b08_cond,
MUX_uxn_opcodes_h_l487_c21_9b08_iftrue,
MUX_uxn_opcodes_h_l487_c21_9b08_iffalse,
MUX_uxn_opcodes_h_l487_c21_9b08_return_output);

-- push_stack_uxn_opcodes_h_l487_c10_2eca
push_stack_uxn_opcodes_h_l487_c10_2eca : entity work.push_stack_0CLK_81ac7b63 port map (
clk,
push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index,
push_stack_uxn_opcodes_h_l487_c10_2eca_ins,
push_stack_uxn_opcodes_h_l487_c10_2eca_value,
push_stack_uxn_opcodes_h_l487_c10_2eca_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54
BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left,
BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right,
BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output);

-- result_MUX_uxn_opcodes_h_l488_c3_c338
result_MUX_uxn_opcodes_h_l488_c3_c338 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l488_c3_c338_cond,
result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue,
result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse,
result_MUX_uxn_opcodes_h_l488_c3_c338_return_output);



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
 t_register_uxn_opcodes_h_l483_c7_5e4b_return_output,
 set_uxn_opcodes_h_l484_c9_fa03_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output,
 result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output,
 tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output,
 MUX_uxn_opcodes_h_l487_c21_9b08_return_output,
 push_stack_uxn_opcodes_h_l487_c10_2eca_return_output,
 BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output,
 result_MUX_uxn_opcodes_h_l488_c3_c338_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_fa03_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_value : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_9b08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_9b08_return_output : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_cond : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iffalse := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l484_c9_fa03_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l484_c9_fa03_add := resize(to_signed(-1, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right := to_unsigned(64, 7);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_fa03_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_fa03_k := VAR_k;
     VAR_set_uxn_opcodes_h_l484_c9_fa03_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l483_c7_5e4b] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index <= VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_return_output := t_register_uxn_opcodes_h_l483_c7_5e4b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l487_c21_998f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output;

     -- set[uxn_opcodes_h_l484_c9_fa03] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l484_c9_fa03_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l484_c9_fa03_stack_index <= VAR_set_uxn_opcodes_h_l484_c9_fa03_stack_index;
     set_uxn_opcodes_h_l484_c9_fa03_ins <= VAR_set_uxn_opcodes_h_l484_c9_fa03_ins;
     set_uxn_opcodes_h_l484_c9_fa03_k <= VAR_set_uxn_opcodes_h_l484_c9_fa03_k;
     set_uxn_opcodes_h_l484_c9_fa03_mul <= VAR_set_uxn_opcodes_h_l484_c9_fa03_mul;
     set_uxn_opcodes_h_l484_c9_fa03_add <= VAR_set_uxn_opcodes_h_l484_c9_fa03_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l484_c9_fa03_return_output := set_uxn_opcodes_h_l484_c9_fa03_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l487_c21_9b08_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_998f_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left := VAR_set_uxn_opcodes_h_l484_c9_fa03_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue := VAR_set_uxn_opcodes_h_l484_c9_fa03_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_value := VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l483_c7_5e4b_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l485_c6_5afb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output;

     -- MUX[uxn_opcodes_h_l487_c21_9b08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c21_9b08_cond <= VAR_MUX_uxn_opcodes_h_l487_c21_9b08_cond;
     MUX_uxn_opcodes_h_l487_c21_9b08_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iftrue;
     MUX_uxn_opcodes_h_l487_c21_9b08_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c21_9b08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c21_9b08_return_output := MUX_uxn_opcodes_h_l487_c21_9b08_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_5afb_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index := VAR_MUX_uxn_opcodes_h_l487_c21_9b08_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_007d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output;

     -- Submodule level 3
     VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_007d_return_output;
     -- push_stack[uxn_opcodes_h_l487_c10_2eca] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index <= VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_stack_index;
     push_stack_uxn_opcodes_h_l487_c10_2eca_ins <= VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_ins;
     push_stack_uxn_opcodes_h_l487_c10_2eca_value <= VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_return_output := push_stack_uxn_opcodes_h_l487_c10_2eca_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left := VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse := VAR_push_stack_uxn_opcodes_h_l487_c10_2eca_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l488_c7_8d54] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_left;
     BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output := BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l485_c2_f2c6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_cond;
     tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output := tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_8d54_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output;
     -- result_MUX[uxn_opcodes_h_l488_c3_c338] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l488_c3_c338_cond <= VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_cond;
     result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue <= VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iftrue;
     result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse <= VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_return_output := result_MUX_uxn_opcodes_h_l488_c3_c338_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse := VAR_result_MUX_uxn_opcodes_h_l488_c3_c338_return_output;
     -- result_MUX[uxn_opcodes_h_l485_c2_f2c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond <= VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_cond;
     result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iftrue;
     result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output := result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l485_c2_f2c6_return_output;
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
