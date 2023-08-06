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
-- Submodules: 9
entity opc_gth_0CLK_4bcf4f80 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_gth_0CLK_4bcf4f80;
architecture arch of opc_gth_0CLK_4bcf4f80 is
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
-- t_register[uxn_opcodes_h_l334_c7_2856]
signal t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l334_c7_2856_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l334_c7_2856_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l335_c7_fd88]
signal n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l335_c7_fd88_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l335_c7_fd88_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l336_c9_84d6]
signal set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l336_c9_84d6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l337_c6_016f]
signal BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l338_c1_5844]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l337_c2_54c6]
signal result_MUX_uxn_opcodes_h_l337_c2_54c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l339_c29_4c39]
signal BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l339_c29_95e3]
signal MUX_uxn_opcodes_h_l339_c29_95e3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l339_c29_95e3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l339_c29_95e3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l339_c29_95e3_return_output : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l339_c3_4105]
signal put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l339_c3_4105_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l339_c3_4105_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l339_c3_4105_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l334_c7_2856
t_register_uxn_opcodes_h_l334_c7_2856 : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l334_c7_2856_stack_index,
t_register_uxn_opcodes_h_l334_c7_2856_return_output);

-- n_register_uxn_opcodes_h_l335_c7_fd88
n_register_uxn_opcodes_h_l335_c7_fd88 : entity work.n_register_0CLK_9682be37 port map (
clk,
n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l335_c7_fd88_stack_index,
n_register_uxn_opcodes_h_l335_c7_fd88_return_output);

-- set_uxn_opcodes_h_l336_c9_84d6
set_uxn_opcodes_h_l336_c9_84d6 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE,
set_uxn_opcodes_h_l336_c9_84d6_stack_index,
set_uxn_opcodes_h_l336_c9_84d6_ins,
set_uxn_opcodes_h_l336_c9_84d6_k,
set_uxn_opcodes_h_l336_c9_84d6_mul,
set_uxn_opcodes_h_l336_c9_84d6_add,
set_uxn_opcodes_h_l336_c9_84d6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l337_c6_016f
BIN_OP_GT_uxn_opcodes_h_l337_c6_016f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left,
BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right,
BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output);

-- result_MUX_uxn_opcodes_h_l337_c2_54c6
result_MUX_uxn_opcodes_h_l337_c2_54c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l337_c2_54c6_cond,
result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue,
result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse,
result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39
BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left,
BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right,
BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output);

-- MUX_uxn_opcodes_h_l339_c29_95e3
MUX_uxn_opcodes_h_l339_c29_95e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l339_c29_95e3_cond,
MUX_uxn_opcodes_h_l339_c29_95e3_iftrue,
MUX_uxn_opcodes_h_l339_c29_95e3_iffalse,
MUX_uxn_opcodes_h_l339_c29_95e3_return_output);

-- put_stack_uxn_opcodes_h_l339_c3_4105
put_stack_uxn_opcodes_h_l339_c3_4105 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l339_c3_4105_stack_index,
put_stack_uxn_opcodes_h_l339_c3_4105_offset,
put_stack_uxn_opcodes_h_l339_c3_4105_value);



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
 t_register_uxn_opcodes_h_l334_c7_2856_return_output,
 n_register_uxn_opcodes_h_l335_c7_fd88_return_output,
 set_uxn_opcodes_h_l336_c9_84d6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output,
 result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output,
 MUX_uxn_opcodes_h_l339_c29_95e3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l334_c7_2856_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l334_c7_2856_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l335_c7_fd88_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l335_c7_fd88_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l336_c9_84d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l339_c3_4105_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l339_c3_4105_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l339_c3_4105_value : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l339_c29_95e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l339_c29_95e3_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_put_stack_uxn_opcodes_h_l339_c3_4105_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_h_l336_c9_84d6_add := resize(to_signed(-1, 2), 8);
     VAR_set_uxn_opcodes_h_l336_c9_84d6_mul := resize(to_unsigned(2, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l336_c9_84d6_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l336_c9_84d6_k := VAR_k;
     VAR_n_register_uxn_opcodes_h_l335_c7_fd88_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l339_c3_4105_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l336_c9_84d6_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l334_c7_2856_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l336_c9_84d6] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l336_c9_84d6_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l336_c9_84d6_stack_index <= VAR_set_uxn_opcodes_h_l336_c9_84d6_stack_index;
     set_uxn_opcodes_h_l336_c9_84d6_ins <= VAR_set_uxn_opcodes_h_l336_c9_84d6_ins;
     set_uxn_opcodes_h_l336_c9_84d6_k <= VAR_set_uxn_opcodes_h_l336_c9_84d6_k;
     set_uxn_opcodes_h_l336_c9_84d6_mul <= VAR_set_uxn_opcodes_h_l336_c9_84d6_mul;
     set_uxn_opcodes_h_l336_c9_84d6_add <= VAR_set_uxn_opcodes_h_l336_c9_84d6_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l336_c9_84d6_return_output := set_uxn_opcodes_h_l336_c9_84d6_return_output;

     -- n_register[uxn_opcodes_h_l335_c7_fd88] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l335_c7_fd88_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l335_c7_fd88_stack_index <= VAR_n_register_uxn_opcodes_h_l335_c7_fd88_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l335_c7_fd88_return_output := n_register_uxn_opcodes_h_l335_c7_fd88_return_output;

     -- t_register[uxn_opcodes_h_l334_c7_2856] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l334_c7_2856_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l334_c7_2856_stack_index <= VAR_t_register_uxn_opcodes_h_l334_c7_2856_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l334_c7_2856_return_output := t_register_uxn_opcodes_h_l334_c7_2856_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left := VAR_n_register_uxn_opcodes_h_l335_c7_fd88_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l335_c7_fd88_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left := VAR_set_uxn_opcodes_h_l336_c9_84d6_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l336_c9_84d6_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right := VAR_t_register_uxn_opcodes_h_l334_c7_2856_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l334_c7_2856_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l337_c6_016f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_left;
     BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output := BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l339_c29_4c39] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_left;
     BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output := BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output;
     VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l337_c6_016f_return_output;
     VAR_MUX_uxn_opcodes_h_l339_c29_95e3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l339_c29_4c39_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l338_c1_5844] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output;

     -- result_MUX[uxn_opcodes_h_l337_c2_54c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l337_c2_54c6_cond <= VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_cond;
     result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue <= VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iftrue;
     result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse <= VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output := result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output;

     -- MUX[uxn_opcodes_h_l339_c29_95e3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l339_c29_95e3_cond <= VAR_MUX_uxn_opcodes_h_l339_c29_95e3_cond;
     MUX_uxn_opcodes_h_l339_c29_95e3_iftrue <= VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iftrue;
     MUX_uxn_opcodes_h_l339_c29_95e3_iffalse <= VAR_MUX_uxn_opcodes_h_l339_c29_95e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l339_c29_95e3_return_output := MUX_uxn_opcodes_h_l339_c29_95e3_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l338_c1_5844_return_output;
     VAR_put_stack_uxn_opcodes_h_l339_c3_4105_value := VAR_MUX_uxn_opcodes_h_l339_c29_95e3_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l337_c2_54c6_return_output;
     -- put_stack[uxn_opcodes_h_l339_c3_4105] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l339_c3_4105_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l339_c3_4105_stack_index <= VAR_put_stack_uxn_opcodes_h_l339_c3_4105_stack_index;
     put_stack_uxn_opcodes_h_l339_c3_4105_offset <= VAR_put_stack_uxn_opcodes_h_l339_c3_4105_offset;
     put_stack_uxn_opcodes_h_l339_c3_4105_value <= VAR_put_stack_uxn_opcodes_h_l339_c3_4105_value;
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
