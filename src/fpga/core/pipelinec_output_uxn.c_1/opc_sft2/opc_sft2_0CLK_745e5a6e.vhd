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
entity opc_sft2_0CLK_745e5a6e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sft2_0CLK_745e5a6e;
architecture arch of opc_sft2_0CLK_745e5a6e is
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
-- t_register[uxn_opcodes_h_l977_c7_eacf]
signal t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l977_c7_eacf_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l977_c7_eacf_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l978_c8_1e39]
signal h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l978_c8_1e39_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l979_c9_6e09]
signal set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l979_c9_6e09_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l980_c6_2a61]
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l981_c1_cef9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l980_c2_7943]
signal result_MUX_uxn_opcodes_h_l980_c2_7943_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l980_c2_7943_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l982_c39_a6e0]
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l982_c31_eb1a]
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l982_c55_facb]
signal CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l982_c31_6fca]
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l982_c3_c68b]
signal put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_c68b_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l982_c3_c68b_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l977_c7_eacf
t_register_uxn_opcodes_h_l977_c7_eacf : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l977_c7_eacf_stack_index,
t_register_uxn_opcodes_h_l977_c7_eacf_return_output);

-- h2_register_uxn_opcodes_h_l978_c8_1e39
h2_register_uxn_opcodes_h_l978_c8_1e39 : entity work.h2_register_0CLK_efc3e079 port map (
clk,
h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index,
h2_register_uxn_opcodes_h_l978_c8_1e39_return_output);

-- set_uxn_opcodes_h_l979_c9_6e09
set_uxn_opcodes_h_l979_c9_6e09 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE,
set_uxn_opcodes_h_l979_c9_6e09_stack_index,
set_uxn_opcodes_h_l979_c9_6e09_ins,
set_uxn_opcodes_h_l979_c9_6e09_k,
set_uxn_opcodes_h_l979_c9_6e09_mul,
set_uxn_opcodes_h_l979_c9_6e09_add,
set_uxn_opcodes_h_l979_c9_6e09_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61
BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left,
BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right,
BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output);

-- result_MUX_uxn_opcodes_h_l980_c2_7943
result_MUX_uxn_opcodes_h_l980_c2_7943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l980_c2_7943_cond,
result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue,
result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse,
result_MUX_uxn_opcodes_h_l980_c2_7943_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0
BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left,
BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right,
BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a
BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left,
BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right,
BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output);

-- CONST_SR_4_uxn_opcodes_h_l982_c55_facb
CONST_SR_4_uxn_opcodes_h_l982_c55_facb : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x,
CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca
BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left,
BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right,
BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output);

-- put2_stack_uxn_opcodes_h_l982_c3_c68b
put2_stack_uxn_opcodes_h_l982_c3_c68b : entity work.put2_stack_0CLK_13efd604 port map (
clk,
put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index,
put2_stack_uxn_opcodes_h_l982_c3_c68b_offset,
put2_stack_uxn_opcodes_h_l982_c3_c68b_value);



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
 t_register_uxn_opcodes_h_l977_c7_eacf_return_output,
 h2_register_uxn_opcodes_h_l978_c8_1e39_return_output,
 set_uxn_opcodes_h_l979_c9_6e09_return_output,
 BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output,
 result_MUX_uxn_opcodes_h_l980_c2_7943_return_output,
 BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output,
 BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output,
 CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output,
 BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_eacf_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l977_c7_eacf_return_output : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l979_c9_6e09_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_set_uxn_opcodes_h_l979_c9_6e09_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right := to_unsigned(15, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l979_c9_6e09_mul := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue := to_unsigned(1, 1);
     VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l979_c9_6e09_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l979_c9_6e09_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index := VAR_stack_index;
     VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l979_c9_6e09_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l977_c7_eacf_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l977_c7_eacf] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l977_c7_eacf_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l977_c7_eacf_stack_index <= VAR_t_register_uxn_opcodes_h_l977_c7_eacf_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l977_c7_eacf_return_output := t_register_uxn_opcodes_h_l977_c7_eacf_return_output;

     -- h2_register[uxn_opcodes_h_l978_c8_1e39] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index <= VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_return_output := h2_register_uxn_opcodes_h_l978_c8_1e39_return_output;

     -- set[uxn_opcodes_h_l979_c9_6e09] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l979_c9_6e09_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l979_c9_6e09_stack_index <= VAR_set_uxn_opcodes_h_l979_c9_6e09_stack_index;
     set_uxn_opcodes_h_l979_c9_6e09_ins <= VAR_set_uxn_opcodes_h_l979_c9_6e09_ins;
     set_uxn_opcodes_h_l979_c9_6e09_k <= VAR_set_uxn_opcodes_h_l979_c9_6e09_k;
     set_uxn_opcodes_h_l979_c9_6e09_mul <= VAR_set_uxn_opcodes_h_l979_c9_6e09_mul;
     set_uxn_opcodes_h_l979_c9_6e09_add <= VAR_set_uxn_opcodes_h_l979_c9_6e09_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l979_c9_6e09_return_output := set_uxn_opcodes_h_l979_c9_6e09_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left := VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_return_output;
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l978_c8_1e39_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left := VAR_set_uxn_opcodes_h_l979_c9_6e09_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l979_c9_6e09_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left := VAR_t_register_uxn_opcodes_h_l977_c7_eacf_return_output;
     VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x := VAR_t_register_uxn_opcodes_h_l977_c7_eacf_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l977_c7_eacf_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l982_c39_a6e0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_left;
     BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output := BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l980_c6_2a61] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_left;
     BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output := BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l982_c55_facb] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x <= VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output := CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right := VAR_BIN_OP_AND_uxn_opcodes_h_l982_c39_a6e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output;
     VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c6_2a61_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right := VAR_CONST_SR_4_uxn_opcodes_h_l982_c55_facb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l981_c1_cef9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output;

     -- result_MUX[uxn_opcodes_h_l980_c2_7943] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l980_c2_7943_cond <= VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_cond;
     result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue <= VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iftrue;
     result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse <= VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_return_output := result_MUX_uxn_opcodes_h_l980_c2_7943_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l982_c31_eb1a] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_left;
     BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output := BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left := VAR_BIN_OP_SR_uxn_opcodes_h_l982_c31_eb1a_return_output;
     VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l981_c1_cef9_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l980_c2_7943_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l982_c31_6fca] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_left;
     BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output := BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_value := VAR_BIN_OP_SL_uxn_opcodes_h_l982_c31_6fca_return_output;
     -- put2_stack[uxn_opcodes_h_l982_c3_c68b] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index <= VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_stack_index;
     put2_stack_uxn_opcodes_h_l982_c3_c68b_offset <= VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_offset;
     put2_stack_uxn_opcodes_h_l982_c3_c68b_value <= VAR_put2_stack_uxn_opcodes_h_l982_c3_c68b_value;
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
