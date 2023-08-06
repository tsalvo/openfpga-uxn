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
entity push_stack_0CLK_81ac7b63 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end push_stack_0CLK_81ac7b63;
architecture arch of push_stack_0CLK_81ac7b63 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal halt_return : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_halt_return : unsigned(0 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l270_c6_40dd]
signal stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l270_c6_9d06]
signal BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l270_c1_2687]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l270_c2_43fb]
signal result_MUX_uxn_stack_h_l270_c2_43fb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l270_c2_43fb_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l270_c2_43fb_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l270_c2_43fb_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l270_c2_43fb]
signal halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l271_c12_806f]
signal halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l271_c12_806f_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l271_c12_806f_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l271_c12_806f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l278_c6_fe40]
signal BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l278_c1_1634]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output : unsigned(0 downto 0);

-- stack_pointer_get[uxn_stack_h_l279_c31_14a0]
signal stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l279_c3_2ca8]
signal stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l279_c3_2ca8_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l279_c3_2ca8_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l280_c3_66c0]
signal stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l270_c6_40dd
stack_pointer_get_uxn_stack_h_l270_c6_40dd : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index,
stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output);

-- BIN_OP_GT_uxn_stack_h_l270_c6_9d06
BIN_OP_GT_uxn_stack_h_l270_c6_9d06 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left,
BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right,
BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output);

-- result_MUX_uxn_stack_h_l270_c2_43fb
result_MUX_uxn_stack_h_l270_c2_43fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l270_c2_43fb_cond,
result_MUX_uxn_stack_h_l270_c2_43fb_iftrue,
result_MUX_uxn_stack_h_l270_c2_43fb_iffalse,
result_MUX_uxn_stack_h_l270_c2_43fb_return_output);

-- halt_return_MUX_uxn_stack_h_l270_c2_43fb
halt_return_MUX_uxn_stack_h_l270_c2_43fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond,
halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue,
halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse,
halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output);

-- halt_uxn_stack_h_l271_c12_806f
halt_uxn_stack_h_l271_c12_806f : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE,
halt_uxn_stack_h_l271_c12_806f_ins,
halt_uxn_stack_h_l271_c12_806f_err,
halt_uxn_stack_h_l271_c12_806f_return_output);

-- BIN_OP_EQ_uxn_stack_h_l278_c6_fe40
BIN_OP_EQ_uxn_stack_h_l278_c6_fe40 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left,
BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right,
BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output);

-- stack_pointer_get_uxn_stack_h_l279_c31_14a0
stack_pointer_get_uxn_stack_h_l279_c31_14a0 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index,
stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output);

-- stack_data_set_uxn_stack_h_l279_c3_2ca8
stack_data_set_uxn_stack_h_l279_c3_2ca8 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index,
stack_data_set_uxn_stack_h_l279_c3_2ca8_index,
stack_data_set_uxn_stack_h_l279_c3_2ca8_value);

-- stack_pointer_move_uxn_stack_h_l280_c3_66c0
stack_pointer_move_uxn_stack_h_l280_c3_66c0 : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index,
stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment,
stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 value,
 -- Registers
 result,
 halt_return,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output,
 BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output,
 result_MUX_uxn_stack_h_l270_c2_43fb_return_output,
 halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output,
 halt_uxn_stack_h_l271_c12_806f_return_output,
 BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output,
 stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l274_c3_bd8d : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l270_c2_43fb_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l270_c2_43fb_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l271_c12_806f_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l271_c12_806f_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l271_c12_806f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_halt_return : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_halt_return := halt_return;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment := resize(to_unsigned(1, 1), 8);
     VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right := to_unsigned(254, 8);
     VAR_result_uxn_stack_h_l274_c3_bd8d := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iffalse := VAR_result_uxn_stack_h_l274_c3_bd8d;
     VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l271_c12_806f_err := resize(to_unsigned(2, 2), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_value := value;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l271_c12_806f_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_value := VAR_value;
     -- stack_pointer_get[uxn_stack_h_l270_c6_40dd] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output := stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left := VAR_stack_pointer_get_uxn_stack_h_l270_c6_40dd_return_output;
     -- BIN_OP_GT[uxn_stack_h_l270_c6_9d06] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left <= VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_left;
     BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right <= VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output := BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond := VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond := VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output;
     VAR_result_MUX_uxn_stack_h_l270_c2_43fb_cond := VAR_BIN_OP_GT_uxn_stack_h_l270_c6_9d06_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l270_c1_2687] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output;

     -- halt_return_MUX[uxn_stack_h_l270_c2_43fb] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond <= VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_cond;
     halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iftrue;
     halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output := halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l270_c1_2687_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left := VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l270_c2_43fb_return_output;
     -- halt[uxn_stack_h_l271_c12_806f] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l271_c12_806f_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l271_c12_806f_ins <= VAR_halt_uxn_stack_h_l271_c12_806f_ins;
     halt_uxn_stack_h_l271_c12_806f_err <= VAR_halt_uxn_stack_h_l271_c12_806f_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l271_c12_806f_return_output := halt_uxn_stack_h_l271_c12_806f_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l278_c6_fe40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left <= VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_left;
     BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right <= VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output := BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond := VAR_BIN_OP_EQ_uxn_stack_h_l278_c6_fe40_return_output;
     VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iftrue := VAR_halt_uxn_stack_h_l271_c12_806f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l278_c1_1634] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output;

     -- result_MUX[uxn_stack_h_l270_c2_43fb] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l270_c2_43fb_cond <= VAR_result_MUX_uxn_stack_h_l270_c2_43fb_cond;
     result_MUX_uxn_stack_h_l270_c2_43fb_iftrue <= VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iftrue;
     result_MUX_uxn_stack_h_l270_c2_43fb_iffalse <= VAR_result_MUX_uxn_stack_h_l270_c2_43fb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l270_c2_43fb_return_output := result_MUX_uxn_stack_h_l270_c2_43fb_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l278_c1_1634_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l270_c2_43fb_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l270_c2_43fb_return_output;
     -- stack_pointer_move[uxn_stack_h_l280_c3_66c0] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_stack_index;
     stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_adjustment;
     stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l280_c3_66c0_is_negative;
     -- Outputs

     -- stack_pointer_get[uxn_stack_h_l279_c31_14a0] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output := stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output;

     -- Submodule level 6
     VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_index := VAR_stack_pointer_get_uxn_stack_h_l279_c31_14a0_return_output;
     -- stack_data_set[uxn_stack_h_l279_c3_2ca8] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index <= VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_stack_index;
     stack_data_set_uxn_stack_h_l279_c3_2ca8_index <= VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_index;
     stack_data_set_uxn_stack_h_l279_c3_2ca8_value <= VAR_stack_data_set_uxn_stack_h_l279_c3_2ca8_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_halt_return <= REG_VAR_halt_return;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     halt_return <= REG_COMB_halt_return;
 end if;
 end if;
end process;

end arch;
