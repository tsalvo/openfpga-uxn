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
-- Submodules: 12
entity uxn_halt_0CLK_64febee4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 instr : in unsigned(7 downto 0);
 err : in unsigned(7 downto 0);
 addr : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_halt_0CLK_64febee4;
architecture arch of uxn_halt_0CLK_64febee4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal halt_handler : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_halt_handler : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(7 downto 0);

-- Each function instance gets signals
-- peek2_dev[uxn_stack_h_l218_c17_40c5]
signal peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_dev_uxn_stack_h_l218_c17_40c5_address : unsigned(7 downto 0);
signal peek2_dev_uxn_stack_h_l218_c17_40c5_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l220_c1_9b89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l220_c2_13d3]
signal result_MUX_uxn_stack_h_l220_c2_13d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_13d3_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_13d3_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_13d3_return_output : unsigned(7 downto 0);

-- stack_pointer_set[uxn_stack_h_l221_c3_120d]
signal stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l221_c3_120d_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l222_c34_5293]
signal CONST_SR_8_uxn_stack_h_l222_c34_5293_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l222_c3_f836]
signal stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_f836_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_f836_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_f836_value : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l223_c34_c7c5]
signal BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l223_c3_c563]
signal stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_c563_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_c563_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_c563_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l224_c3_dfa8]
signal stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_dfa8_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_dfa8_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l225_c3_6490]
signal stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_6490_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_6490_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_6490_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- peek2_dev_uxn_stack_h_l218_c17_40c5
peek2_dev_uxn_stack_h_l218_c17_40c5 : entity work.peek2_dev_0CLK_ad162598 port map (
clk,
peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE,
peek2_dev_uxn_stack_h_l218_c17_40c5_address,
peek2_dev_uxn_stack_h_l218_c17_40c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output);

-- result_MUX_uxn_stack_h_l220_c2_13d3
result_MUX_uxn_stack_h_l220_c2_13d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l220_c2_13d3_cond,
result_MUX_uxn_stack_h_l220_c2_13d3_iftrue,
result_MUX_uxn_stack_h_l220_c2_13d3_iffalse,
result_MUX_uxn_stack_h_l220_c2_13d3_return_output);

-- stack_pointer_set_uxn_stack_h_l221_c3_120d
stack_pointer_set_uxn_stack_h_l221_c3_120d : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index,
stack_pointer_set_uxn_stack_h_l221_c3_120d_value);

-- CONST_SR_8_uxn_stack_h_l222_c34_5293
CONST_SR_8_uxn_stack_h_l222_c34_5293 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l222_c34_5293_x,
CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output);

-- stack_data_set_uxn_stack_h_l222_c3_f836
stack_data_set_uxn_stack_h_l222_c3_f836 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l222_c3_f836_stack_index,
stack_data_set_uxn_stack_h_l222_c3_f836_index,
stack_data_set_uxn_stack_h_l222_c3_f836_value);

-- BIN_OP_AND_uxn_stack_h_l223_c34_c7c5
BIN_OP_AND_uxn_stack_h_l223_c34_c7c5 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left,
BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right,
BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output);

-- stack_data_set_uxn_stack_h_l223_c3_c563
stack_data_set_uxn_stack_h_l223_c3_c563 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l223_c3_c563_stack_index,
stack_data_set_uxn_stack_h_l223_c3_c563_index,
stack_data_set_uxn_stack_h_l223_c3_c563_value);

-- stack_data_set_uxn_stack_h_l224_c3_dfa8
stack_data_set_uxn_stack_h_l224_c3_dfa8 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index,
stack_data_set_uxn_stack_h_l224_c3_dfa8_index,
stack_data_set_uxn_stack_h_l224_c3_dfa8_value);

-- stack_data_set_uxn_stack_h_l225_c3_6490
stack_data_set_uxn_stack_h_l225_c3_6490 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l225_c3_6490_stack_index,
stack_data_set_uxn_stack_h_l225_c3_6490_index,
stack_data_set_uxn_stack_h_l225_c3_6490_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 instr,
 err,
 addr,
 -- Registers
 halt_handler,
 result,
 -- All submodule outputs
 peek2_dev_uxn_stack_h_l218_c17_40c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output,
 result_MUX_uxn_stack_h_l220_c2_13d3_return_output,
 CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output,
 BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_instr : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_addr : unsigned(15 downto 0);
 variable VAR_halt_handler_uxn_stack_h_l218_c2_074c : unsigned(15 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_address : unsigned(7 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_return_output : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l219_c2_fcfd : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l220_c2_13d3_interm_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l230_c3_adeb : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_13d3_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_13d3_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_f836_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_f836_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_f836_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_f816_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_c563_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_c563_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_c563_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_7133_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_6490_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_6490_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_6490_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_halt_handler : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_halt_handler := halt_handler;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index := to_unsigned(0, 1);
     VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_address := resize(to_unsigned(0, 1), 8);
     VAR_result_uxn_stack_h_l230_c3_adeb := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iffalse := VAR_result_uxn_stack_h_l230_c3_adeb;
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_value := resize(to_unsigned(4, 3), 8);
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l222_c3_f836_index := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l225_c3_6490_index := resize(to_unsigned(3, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_index := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right := to_unsigned(255, 8);
     VAR_result_uxn_stack_h_l219_c2_fcfd := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iftrue := VAR_result_uxn_stack_h_l219_c2_fcfd;
     VAR_stack_data_set_uxn_stack_h_l223_c3_c563_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l223_c3_c563_index := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l222_c3_f836_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l225_c3_6490_stack_index := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_instr := instr;
     VAR_err := err;
     VAR_addr := addr;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left := VAR_addr;
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_x := VAR_addr;
     VAR_stack_data_set_uxn_stack_h_l225_c3_6490_value := VAR_err;
     VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_value := VAR_instr;
     -- peek2_dev[uxn_stack_h_l218_c17_40c5] LATENCY=0
     -- Clock enable
     peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE <= VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_CLOCK_ENABLE;
     -- Inputs
     peek2_dev_uxn_stack_h_l218_c17_40c5_address <= VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_address;
     -- Outputs
     VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_return_output := peek2_dev_uxn_stack_h_l218_c17_40c5_return_output;

     -- BIN_OP_AND[uxn_stack_h_l223_c34_c7c5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left <= VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_left;
     BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right <= VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output := BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output;

     -- CONST_SR_8[uxn_stack_h_l222_c34_5293] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l222_c34_5293_x <= VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output := CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output;

     -- Submodule level 1
     VAR_halt_handler_uxn_stack_h_l218_c2_074c := VAR_peek2_dev_uxn_stack_h_l218_c17_40c5_return_output;
     VAR_MUX_uxn_stack_h_l220_c2_13d3_interm_cond := resize(VAR_halt_handler_uxn_stack_h_l218_c2_074c, 1);
     REG_VAR_halt_handler := VAR_halt_handler_uxn_stack_h_l218_c2_074c;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond := VAR_MUX_uxn_stack_h_l220_c2_13d3_interm_cond;
     VAR_result_MUX_uxn_stack_h_l220_c2_13d3_cond := VAR_MUX_uxn_stack_h_l220_c2_13d3_interm_cond;
     -- CAST_TO_uint8_t[uxn_stack_h_l223_c24_7133] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_7133_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_c7c5_return_output);

     -- result_MUX[uxn_stack_h_l220_c2_13d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l220_c2_13d3_cond <= VAR_result_MUX_uxn_stack_h_l220_c2_13d3_cond;
     result_MUX_uxn_stack_h_l220_c2_13d3_iftrue <= VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iftrue;
     result_MUX_uxn_stack_h_l220_c2_13d3_iffalse <= VAR_result_MUX_uxn_stack_h_l220_c2_13d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l220_c2_13d3_return_output := result_MUX_uxn_stack_h_l220_c2_13d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l220_c1_9b89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l222_c24_f816] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_f816_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_5293_return_output);

     -- Submodule level 2
     VAR_stack_data_set_uxn_stack_h_l222_c3_f836_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_f816_return_output;
     VAR_stack_data_set_uxn_stack_h_l223_c3_c563_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_7133_return_output;
     VAR_stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;
     VAR_stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;
     VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;
     VAR_stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_9b89_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l220_c2_13d3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l220_c2_13d3_return_output;
     -- stack_data_set[uxn_stack_h_l225_c3_6490] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l225_c3_6490_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l225_c3_6490_stack_index <= VAR_stack_data_set_uxn_stack_h_l225_c3_6490_stack_index;
     stack_data_set_uxn_stack_h_l225_c3_6490_index <= VAR_stack_data_set_uxn_stack_h_l225_c3_6490_index;
     stack_data_set_uxn_stack_h_l225_c3_6490_value <= VAR_stack_data_set_uxn_stack_h_l225_c3_6490_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l224_c3_dfa8] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index <= VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_stack_index;
     stack_data_set_uxn_stack_h_l224_c3_dfa8_index <= VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_index;
     stack_data_set_uxn_stack_h_l224_c3_dfa8_value <= VAR_stack_data_set_uxn_stack_h_l224_c3_dfa8_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l222_c3_f836] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l222_c3_f836_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l222_c3_f836_stack_index <= VAR_stack_data_set_uxn_stack_h_l222_c3_f836_stack_index;
     stack_data_set_uxn_stack_h_l222_c3_f836_index <= VAR_stack_data_set_uxn_stack_h_l222_c3_f836_index;
     stack_data_set_uxn_stack_h_l222_c3_f836_value <= VAR_stack_data_set_uxn_stack_h_l222_c3_f836_value;
     -- Outputs

     -- stack_pointer_set[uxn_stack_h_l221_c3_120d] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_stack_index;
     stack_pointer_set_uxn_stack_h_l221_c3_120d_value <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_120d_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l223_c3_c563] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l223_c3_c563_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l223_c3_c563_stack_index <= VAR_stack_data_set_uxn_stack_h_l223_c3_c563_stack_index;
     stack_data_set_uxn_stack_h_l223_c3_c563_index <= VAR_stack_data_set_uxn_stack_h_l223_c3_c563_index;
     stack_data_set_uxn_stack_h_l223_c3_c563_value <= VAR_stack_data_set_uxn_stack_h_l223_c3_c563_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_halt_handler <= REG_VAR_halt_handler;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     halt_handler <= REG_COMB_halt_handler;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
