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
entity push_stack_0CLK_01fb3068 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end push_stack_0CLK_01fb3068;
architecture arch of push_stack_0CLK_01fb3068 is
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
-- stack_pointer_get[uxn_stack_h_l301_c6_307f]
signal stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l301_c6_f519]
signal BIN_OP_GT_uxn_stack_h_l301_c6_f519_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l301_c6_f519_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l301_c1_a443]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l301_c2_db5a]
signal result_MUX_uxn_stack_h_l301_c2_db5a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_db5a_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_db5a_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_db5a_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l301_c2_db5a]
signal halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l302_c12_e3ff]
signal halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l302_c12_e3ff_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l302_c12_e3ff_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l302_c12_e3ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l309_c6_2495]
signal BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l309_c1_431f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output : unsigned(0 downto 0);

-- stack_pointer_get[uxn_stack_h_l310_c31_56db]
signal stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l310_c3_c1ab]
signal stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l310_c3_c1ab_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l310_c3_c1ab_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l311_c3_e34b]
signal stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l301_c6_307f
stack_pointer_get_uxn_stack_h_l301_c6_307f : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index,
stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output);

-- BIN_OP_GT_uxn_stack_h_l301_c6_f519
BIN_OP_GT_uxn_stack_h_l301_c6_f519 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l301_c6_f519_left,
BIN_OP_GT_uxn_stack_h_l301_c6_f519_right,
BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output);

-- result_MUX_uxn_stack_h_l301_c2_db5a
result_MUX_uxn_stack_h_l301_c2_db5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l301_c2_db5a_cond,
result_MUX_uxn_stack_h_l301_c2_db5a_iftrue,
result_MUX_uxn_stack_h_l301_c2_db5a_iffalse,
result_MUX_uxn_stack_h_l301_c2_db5a_return_output);

-- halt_return_MUX_uxn_stack_h_l301_c2_db5a
halt_return_MUX_uxn_stack_h_l301_c2_db5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond,
halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue,
halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse,
halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output);

-- halt_uxn_stack_h_l302_c12_e3ff
halt_uxn_stack_h_l302_c12_e3ff : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE,
halt_uxn_stack_h_l302_c12_e3ff_ins,
halt_uxn_stack_h_l302_c12_e3ff_err,
halt_uxn_stack_h_l302_c12_e3ff_return_output);

-- BIN_OP_EQ_uxn_stack_h_l309_c6_2495
BIN_OP_EQ_uxn_stack_h_l309_c6_2495 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left,
BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right,
BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output);

-- stack_pointer_get_uxn_stack_h_l310_c31_56db
stack_pointer_get_uxn_stack_h_l310_c31_56db : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index,
stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output);

-- stack_data_set_uxn_stack_h_l310_c3_c1ab
stack_data_set_uxn_stack_h_l310_c3_c1ab : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index,
stack_data_set_uxn_stack_h_l310_c3_c1ab_address,
stack_data_set_uxn_stack_h_l310_c3_c1ab_value);

-- stack_pointer_move_uxn_stack_h_l311_c3_e34b
stack_pointer_move_uxn_stack_h_l311_c3_e34b : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index,
stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment,
stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative);



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
 stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output,
 BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output,
 result_MUX_uxn_stack_h_l301_c2_db5a_return_output,
 halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output,
 halt_uxn_stack_h_l302_c12_e3ff_return_output,
 BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output,
 stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l305_c3_904a : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_db5a_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_db5a_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_e3ff_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_e3ff_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_e3ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_halt_uxn_stack_h_l302_c12_e3ff_err := resize(to_unsigned(2, 2), 8);
     VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment := resize(to_unsigned(1, 1), 8);
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l305_c3_904a := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iffalse := VAR_result_uxn_stack_h_l305_c3_904a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l302_c12_e3ff_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_value := VAR_value;
     -- stack_pointer_get[uxn_stack_h_l301_c6_307f] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output := stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_left := VAR_stack_pointer_get_uxn_stack_h_l301_c6_307f_return_output;
     -- BIN_OP_GT[uxn_stack_h_l301_c6_f519] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l301_c6_f519_left <= VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_left;
     BIN_OP_GT_uxn_stack_h_l301_c6_f519_right <= VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output := BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output;
     VAR_result_MUX_uxn_stack_h_l301_c2_db5a_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_f519_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l301_c1_a443] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output;

     -- halt_return_MUX[uxn_stack_h_l301_c2_db5a] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_cond;
     halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iftrue;
     halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output := halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_a443_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left := VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l301_c2_db5a_return_output;
     -- halt[uxn_stack_h_l302_c12_e3ff] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l302_c12_e3ff_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l302_c12_e3ff_ins <= VAR_halt_uxn_stack_h_l302_c12_e3ff_ins;
     halt_uxn_stack_h_l302_c12_e3ff_err <= VAR_halt_uxn_stack_h_l302_c12_e3ff_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l302_c12_e3ff_return_output := halt_uxn_stack_h_l302_c12_e3ff_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l309_c6_2495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left <= VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_left;
     BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right <= VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output := BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond := VAR_BIN_OP_EQ_uxn_stack_h_l309_c6_2495_return_output;
     VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iftrue := VAR_halt_uxn_stack_h_l302_c12_e3ff_return_output;
     -- result_MUX[uxn_stack_h_l301_c2_db5a] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l301_c2_db5a_cond <= VAR_result_MUX_uxn_stack_h_l301_c2_db5a_cond;
     result_MUX_uxn_stack_h_l301_c2_db5a_iftrue <= VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iftrue;
     result_MUX_uxn_stack_h_l301_c2_db5a_iffalse <= VAR_result_MUX_uxn_stack_h_l301_c2_db5a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l301_c2_db5a_return_output := result_MUX_uxn_stack_h_l301_c2_db5a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l309_c1_431f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l309_c1_431f_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l301_c2_db5a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l301_c2_db5a_return_output;
     -- stack_pointer_move[uxn_stack_h_l311_c3_e34b] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_stack_index;
     stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_adjustment;
     stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l311_c3_e34b_is_negative;
     -- Outputs

     -- stack_pointer_get[uxn_stack_h_l310_c31_56db] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output := stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output;

     -- Submodule level 6
     VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_address := VAR_stack_pointer_get_uxn_stack_h_l310_c31_56db_return_output;
     -- stack_data_set[uxn_stack_h_l310_c3_c1ab] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index <= VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_stack_index;
     stack_data_set_uxn_stack_h_l310_c3_c1ab_address <= VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_address;
     stack_data_set_uxn_stack_h_l310_c3_c1ab_value <= VAR_stack_data_set_uxn_stack_h_l310_c3_c1ab_value;
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
