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
-- peek2_dev[uxn_stack_h_l218_c17_52a8]
signal peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_dev_uxn_stack_h_l218_c17_52a8_address : unsigned(7 downto 0);
signal peek2_dev_uxn_stack_h_l218_c17_52a8_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l220_c1_35e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l220_c2_70ad]
signal result_MUX_uxn_stack_h_l220_c2_70ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_70ad_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_70ad_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l220_c2_70ad_return_output : unsigned(7 downto 0);

-- stack_pointer_set[uxn_stack_h_l221_c3_b116]
signal stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l221_c3_b116_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l222_c34_d914]
signal CONST_SR_8_uxn_stack_h_l222_c34_d914_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l222_c3_8d37]
signal stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_8d37_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l222_c3_8d37_value : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l223_c34_37da]
signal BIN_OP_AND_uxn_stack_h_l223_c34_37da_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_stack_h_l223_c34_37da_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l223_c3_5438]
signal stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_5438_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_5438_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l223_c3_5438_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l224_c3_c88d]
signal stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_c88d_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l224_c3_c88d_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l225_c3_84d4]
signal stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_84d4_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l225_c3_84d4_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- peek2_dev_uxn_stack_h_l218_c17_52a8
peek2_dev_uxn_stack_h_l218_c17_52a8 : entity work.peek2_dev_0CLK_ad162598 port map (
clk,
peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE,
peek2_dev_uxn_stack_h_l218_c17_52a8_address,
peek2_dev_uxn_stack_h_l218_c17_52a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output);

-- result_MUX_uxn_stack_h_l220_c2_70ad
result_MUX_uxn_stack_h_l220_c2_70ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l220_c2_70ad_cond,
result_MUX_uxn_stack_h_l220_c2_70ad_iftrue,
result_MUX_uxn_stack_h_l220_c2_70ad_iffalse,
result_MUX_uxn_stack_h_l220_c2_70ad_return_output);

-- stack_pointer_set_uxn_stack_h_l221_c3_b116
stack_pointer_set_uxn_stack_h_l221_c3_b116 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index,
stack_pointer_set_uxn_stack_h_l221_c3_b116_value);

-- CONST_SR_8_uxn_stack_h_l222_c34_d914
CONST_SR_8_uxn_stack_h_l222_c34_d914 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l222_c34_d914_x,
CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output);

-- stack_data_set_uxn_stack_h_l222_c3_8d37
stack_data_set_uxn_stack_h_l222_c3_8d37 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index,
stack_data_set_uxn_stack_h_l222_c3_8d37_index,
stack_data_set_uxn_stack_h_l222_c3_8d37_value);

-- BIN_OP_AND_uxn_stack_h_l223_c34_37da
BIN_OP_AND_uxn_stack_h_l223_c34_37da : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l223_c34_37da_left,
BIN_OP_AND_uxn_stack_h_l223_c34_37da_right,
BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output);

-- stack_data_set_uxn_stack_h_l223_c3_5438
stack_data_set_uxn_stack_h_l223_c3_5438 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l223_c3_5438_stack_index,
stack_data_set_uxn_stack_h_l223_c3_5438_index,
stack_data_set_uxn_stack_h_l223_c3_5438_value);

-- stack_data_set_uxn_stack_h_l224_c3_c88d
stack_data_set_uxn_stack_h_l224_c3_c88d : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index,
stack_data_set_uxn_stack_h_l224_c3_c88d_index,
stack_data_set_uxn_stack_h_l224_c3_c88d_value);

-- stack_data_set_uxn_stack_h_l225_c3_84d4
stack_data_set_uxn_stack_h_l225_c3_84d4 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index,
stack_data_set_uxn_stack_h_l225_c3_84d4_index,
stack_data_set_uxn_stack_h_l225_c3_84d4_value);



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
 peek2_dev_uxn_stack_h_l218_c17_52a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output,
 result_MUX_uxn_stack_h_l220_c2_70ad_return_output,
 CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output,
 BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_instr : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_addr : unsigned(15 downto 0);
 variable VAR_halt_handler_uxn_stack_h_l218_c2_c44a : unsigned(15 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_address : unsigned(7 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_return_output : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l219_c2_101a : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l220_c2_70ad_interm_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l230_c3_dfbf : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_70ad_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l220_c2_70ad_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_fa74_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_5438_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_5438_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_5438_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_1b85_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_index := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_index := resize(to_unsigned(3, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index := to_unsigned(0, 1);
     VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_address := resize(to_unsigned(0, 1), 8);
     VAR_result_uxn_stack_h_l230_c3_dfbf := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iffalse := VAR_result_uxn_stack_h_l230_c3_dfbf;
     VAR_result_uxn_stack_h_l219_c2_101a := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iftrue := VAR_result_uxn_stack_h_l219_c2_101a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l223_c3_5438_index := resize(to_unsigned(1, 1), 8);
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_value := resize(to_unsigned(4, 3), 8);
     VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l223_c3_5438_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_index := resize(to_unsigned(2, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_right := to_unsigned(255, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_left := VAR_addr;
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_x := VAR_addr;
     VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_value := VAR_err;
     VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_value := VAR_instr;
     -- BIN_OP_AND[uxn_stack_h_l223_c34_37da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l223_c34_37da_left <= VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_left;
     BIN_OP_AND_uxn_stack_h_l223_c34_37da_right <= VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output := BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output;

     -- CONST_SR_8[uxn_stack_h_l222_c34_d914] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l222_c34_d914_x <= VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output := CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output;

     -- peek2_dev[uxn_stack_h_l218_c17_52a8] LATENCY=0
     -- Clock enable
     peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE <= VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_CLOCK_ENABLE;
     -- Inputs
     peek2_dev_uxn_stack_h_l218_c17_52a8_address <= VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_address;
     -- Outputs
     VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_return_output := peek2_dev_uxn_stack_h_l218_c17_52a8_return_output;

     -- Submodule level 1
     VAR_halt_handler_uxn_stack_h_l218_c2_c44a := VAR_peek2_dev_uxn_stack_h_l218_c17_52a8_return_output;
     VAR_MUX_uxn_stack_h_l220_c2_70ad_interm_cond := resize(VAR_halt_handler_uxn_stack_h_l218_c2_c44a, 1);
     REG_VAR_halt_handler := VAR_halt_handler_uxn_stack_h_l218_c2_c44a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond := VAR_MUX_uxn_stack_h_l220_c2_70ad_interm_cond;
     VAR_result_MUX_uxn_stack_h_l220_c2_70ad_cond := VAR_MUX_uxn_stack_h_l220_c2_70ad_interm_cond;
     -- CAST_TO_uint8_t[uxn_stack_h_l222_c24_fa74] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_fa74_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l222_c34_d914_return_output);

     -- result_MUX[uxn_stack_h_l220_c2_70ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l220_c2_70ad_cond <= VAR_result_MUX_uxn_stack_h_l220_c2_70ad_cond;
     result_MUX_uxn_stack_h_l220_c2_70ad_iftrue <= VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iftrue;
     result_MUX_uxn_stack_h_l220_c2_70ad_iffalse <= VAR_result_MUX_uxn_stack_h_l220_c2_70ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l220_c2_70ad_return_output := result_MUX_uxn_stack_h_l220_c2_70ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l220_c1_35e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l223_c24_1b85] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_1b85_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_stack_h_l223_c34_37da_return_output);

     -- Submodule level 2
     VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l222_c24_fa74_return_output;
     VAR_stack_data_set_uxn_stack_h_l223_c3_5438_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l223_c24_1b85_return_output;
     VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;
     VAR_stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;
     VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;
     VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;
     VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l220_c1_35e6_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l220_c2_70ad_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l220_c2_70ad_return_output;
     -- stack_data_set[uxn_stack_h_l222_c3_8d37] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index <= VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_stack_index;
     stack_data_set_uxn_stack_h_l222_c3_8d37_index <= VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_index;
     stack_data_set_uxn_stack_h_l222_c3_8d37_value <= VAR_stack_data_set_uxn_stack_h_l222_c3_8d37_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l225_c3_84d4] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index <= VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_stack_index;
     stack_data_set_uxn_stack_h_l225_c3_84d4_index <= VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_index;
     stack_data_set_uxn_stack_h_l225_c3_84d4_value <= VAR_stack_data_set_uxn_stack_h_l225_c3_84d4_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l223_c3_5438] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l223_c3_5438_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l223_c3_5438_stack_index <= VAR_stack_data_set_uxn_stack_h_l223_c3_5438_stack_index;
     stack_data_set_uxn_stack_h_l223_c3_5438_index <= VAR_stack_data_set_uxn_stack_h_l223_c3_5438_index;
     stack_data_set_uxn_stack_h_l223_c3_5438_value <= VAR_stack_data_set_uxn_stack_h_l223_c3_5438_value;
     -- Outputs

     -- stack_pointer_set[uxn_stack_h_l221_c3_b116] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_stack_index;
     stack_pointer_set_uxn_stack_h_l221_c3_b116_value <= VAR_stack_pointer_set_uxn_stack_h_l221_c3_b116_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l224_c3_c88d] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index <= VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_stack_index;
     stack_data_set_uxn_stack_h_l224_c3_c88d_index <= VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_index;
     stack_data_set_uxn_stack_h_l224_c3_c88d_value <= VAR_stack_data_set_uxn_stack_h_l224_c3_c88d_value;
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
