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
entity opc_sft2_0CLK_effe98ec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sft2_0CLK_effe98ec;
architecture arch of opc_sft2_0CLK_effe98ec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l977_c7_ac80]
signal t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l977_c7_ac80_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l977_c7_ac80_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l978_c8_2ef9]
signal h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l979_c9_bed3]
signal set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_bed3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l980_c6_c7e4]
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l981_c1_d0c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l980_c2_5cba]
signal result_MUX_uxn_opcodes_h_l980_c2_5cba_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l982_c39_412e]
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l982_c31_6577]
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l982_c55_a996]
signal CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l982_c31_b8a8]
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l982_c3_f6da]
signal put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_f6da_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_f6da_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l977_c7_ac80
t_register_uxn_opcodes_h_l977_c7_ac80 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l977_c7_ac80_stack_index,
t_register_uxn_opcodes_h_l977_c7_ac80_return_output);

-- h2_register_uxn_opcodes_h_l978_c8_2ef9
h2_register_uxn_opcodes_h_l978_c8_2ef9 : entity work.h2_register_0CLK_d6ba51db port map (
clk,
h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index,
h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output);

-- set_uxn_opcodes_h_l979_c9_bed3
set_uxn_opcodes_h_l979_c9_bed3 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE,
set_uxn_opcodes_h_l979_c9_bed3_stack_index,
set_uxn_opcodes_h_l979_c9_bed3_ins,
set_uxn_opcodes_h_l979_c9_bed3_k,
set_uxn_opcodes_h_l979_c9_bed3_mul,
set_uxn_opcodes_h_l979_c9_bed3_add,
set_uxn_opcodes_h_l979_c9_bed3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4
BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left,
BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right,
BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output);

-- result_MUX_uxn_opcodes_h_l980_c2_5cba
result_MUX_uxn_opcodes_h_l980_c2_5cba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l980_c2_5cba_cond,
result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue,
result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse,
result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l982_c39_412e
BIN_OP_AND_uxn_opcodes_h_l982_c39_412e : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left,
BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right,
BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l982_c31_6577
BIN_OP_SR_uxn_opcodes_h_l982_c31_6577 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left,
BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right,
BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output);

-- CONST_SR_4_uxn_opcodes_h_l982_c55_a996
CONST_SR_4_uxn_opcodes_h_l982_c55_a996 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x,
CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8
BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left,
BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right,
BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output);

-- put2_stack_uxn_opcodes_h_l982_c3_f6da
put2_stack_uxn_opcodes_h_l982_c3_f6da : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index,
put2_stack_uxn_opcodes_h_l982_c3_f6da_offset,
put2_stack_uxn_opcodes_h_l982_c3_f6da_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l977_c7_ac80_return_output,
 h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output,
 set_uxn_opcodes_h_l979_c9_bed3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output,
 result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output,
 BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output,
 BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output,
 CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output,
 BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_ac80_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_ac80_return_output : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_bed3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l979_c9_bed3_add := resize(to_signed(-1, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right := to_unsigned(15, 4);
     VAR_set_uxn_opcodes_h_l979_c9_bed3_mul := resize(to_unsigned(3, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l979_c9_bed3_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l979_c9_bed3_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l979_c9_bed3_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l977_c7_ac80_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l979_c9_bed3] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l979_c9_bed3_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l979_c9_bed3_stack_index <= VAR_set_uxn_opcodes_h_l979_c9_bed3_stack_index;
     set_uxn_opcodes_h_l979_c9_bed3_ins <= VAR_set_uxn_opcodes_h_l979_c9_bed3_ins;
     set_uxn_opcodes_h_l979_c9_bed3_k <= VAR_set_uxn_opcodes_h_l979_c9_bed3_k;
     set_uxn_opcodes_h_l979_c9_bed3_mul <= VAR_set_uxn_opcodes_h_l979_c9_bed3_mul;
     set_uxn_opcodes_h_l979_c9_bed3_add <= VAR_set_uxn_opcodes_h_l979_c9_bed3_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l979_c9_bed3_return_output := set_uxn_opcodes_h_l979_c9_bed3_return_output;

     -- t_register[uxn_opcodes_h_l977_c7_ac80] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l977_c7_ac80_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l977_c7_ac80_stack_index <= VAR_t_register_uxn_opcodes_h_l977_c7_ac80_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l977_c7_ac80_return_output := t_register_uxn_opcodes_h_l977_c7_ac80_return_output;

     -- h2_register[uxn_opcodes_h_l978_c8_2ef9] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index <= VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output := h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left := VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output;
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l978_c8_2ef9_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left := VAR_set_uxn_opcodes_h_l979_c9_bed3_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l979_c9_bed3_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left := VAR_t_register_uxn_opcodes_h_l977_c7_ac80_return_output;
     VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x := VAR_t_register_uxn_opcodes_h_l977_c7_ac80_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l977_c7_ac80_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l980_c6_c7e4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_left;
     BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output := BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l982_c55_a996] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x <= VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output := CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l982_c39_412e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_left;
     BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output := BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right := VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_412e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output;
     VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_c7e4_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right := VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_a996_return_output;
     -- result_MUX[uxn_opcodes_h_l980_c2_5cba] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l980_c2_5cba_cond <= VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_cond;
     result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue <= VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iftrue;
     result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse <= VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output := result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l981_c1_d0c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l982_c31_6577] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_left;
     BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output := BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left := VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_6577_return_output;
     VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_d0c0_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l980_c2_5cba_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l982_c31_b8a8] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_left;
     BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output := BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_value := VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_b8a8_return_output;
     -- put2_stack[uxn_opcodes_h_l982_c3_f6da] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index <= VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_stack_index;
     put2_stack_uxn_opcodes_h_l982_c3_f6da_offset <= VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_offset;
     put2_stack_uxn_opcodes_h_l982_c3_f6da_value <= VAR_put2_stack_uxn_opcodes_h_l982_c3_f6da_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
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
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
