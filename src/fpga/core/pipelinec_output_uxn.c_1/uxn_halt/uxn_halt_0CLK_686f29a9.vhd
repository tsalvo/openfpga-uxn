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
entity uxn_halt_0CLK_686f29a9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 instr : in unsigned(7 downto 0);
 err : in unsigned(7 downto 0);
 addr : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_halt_0CLK_686f29a9;
architecture arch of uxn_halt_0CLK_686f29a9 is
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
-- peek2_dev[uxn_stack_h_l243_c17_c9b0]
signal peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_dev_uxn_stack_h_l243_c17_c9b0_address : unsigned(7 downto 0);
signal peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l245_c1_4b00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l245_c2_8001]
signal result_MUX_uxn_stack_h_l245_c2_8001_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l245_c2_8001_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l245_c2_8001_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l245_c2_8001_return_output : unsigned(7 downto 0);

-- stack_pointer_set[uxn_stack_h_l246_c3_f74c]
signal stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l246_c3_f74c_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l247_c34_9e0c]
signal CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l247_c3_bb0c]
signal stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l247_c3_bb0c_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l247_c3_bb0c_value : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l248_c34_6041]
signal BIN_OP_AND_uxn_stack_h_l248_c34_6041_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_stack_h_l248_c34_6041_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l248_c3_e778]
signal stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l248_c3_e778_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l248_c3_e778_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l248_c3_e778_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l249_c3_f6b4]
signal stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l249_c3_f6b4_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l249_c3_f6b4_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l250_c3_a970]
signal stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l250_c3_a970_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l250_c3_a970_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l250_c3_a970_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- peek2_dev_uxn_stack_h_l243_c17_c9b0
peek2_dev_uxn_stack_h_l243_c17_c9b0 : entity work.peek2_dev_0CLK_7bf2eff3 port map (
clk,
peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE,
peek2_dev_uxn_stack_h_l243_c17_c9b0_address,
peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output);

-- result_MUX_uxn_stack_h_l245_c2_8001
result_MUX_uxn_stack_h_l245_c2_8001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l245_c2_8001_cond,
result_MUX_uxn_stack_h_l245_c2_8001_iftrue,
result_MUX_uxn_stack_h_l245_c2_8001_iffalse,
result_MUX_uxn_stack_h_l245_c2_8001_return_output);

-- stack_pointer_set_uxn_stack_h_l246_c3_f74c
stack_pointer_set_uxn_stack_h_l246_c3_f74c : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index,
stack_pointer_set_uxn_stack_h_l246_c3_f74c_value);

-- CONST_SR_8_uxn_stack_h_l247_c34_9e0c
CONST_SR_8_uxn_stack_h_l247_c34_9e0c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x,
CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output);

-- stack_data_set_uxn_stack_h_l247_c3_bb0c
stack_data_set_uxn_stack_h_l247_c3_bb0c : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index,
stack_data_set_uxn_stack_h_l247_c3_bb0c_address,
stack_data_set_uxn_stack_h_l247_c3_bb0c_value);

-- BIN_OP_AND_uxn_stack_h_l248_c34_6041
BIN_OP_AND_uxn_stack_h_l248_c34_6041 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l248_c34_6041_left,
BIN_OP_AND_uxn_stack_h_l248_c34_6041_right,
BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output);

-- stack_data_set_uxn_stack_h_l248_c3_e778
stack_data_set_uxn_stack_h_l248_c3_e778 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l248_c3_e778_stack_index,
stack_data_set_uxn_stack_h_l248_c3_e778_address,
stack_data_set_uxn_stack_h_l248_c3_e778_value);

-- stack_data_set_uxn_stack_h_l249_c3_f6b4
stack_data_set_uxn_stack_h_l249_c3_f6b4 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index,
stack_data_set_uxn_stack_h_l249_c3_f6b4_address,
stack_data_set_uxn_stack_h_l249_c3_f6b4_value);

-- stack_data_set_uxn_stack_h_l250_c3_a970
stack_data_set_uxn_stack_h_l250_c3_a970 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l250_c3_a970_stack_index,
stack_data_set_uxn_stack_h_l250_c3_a970_address,
stack_data_set_uxn_stack_h_l250_c3_a970_value);



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
 peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output,
 result_MUX_uxn_stack_h_l245_c2_8001_return_output,
 CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output,
 BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_instr : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_addr : unsigned(15 downto 0);
 variable VAR_halt_handler_uxn_stack_h_l243_c2_88e5 : unsigned(15 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_address : unsigned(7 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l244_c2_2748 : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l245_c2_8001_interm_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l245_c2_8001_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l245_c2_8001_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l255_c3_1b45 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l245_c2_8001_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l245_c2_8001_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l247_c24_b03c_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l248_c3_e778_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l248_c3_e778_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l248_c3_e778_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l248_c24_beef_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l250_c3_a970_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l250_c3_a970_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l250_c3_a970_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_stack_data_set_uxn_stack_h_l250_c3_a970_address := resize(to_unsigned(3, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l250_c3_a970_stack_index := to_unsigned(0, 1);
     VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_value := resize(to_unsigned(4, 3), 8);
     VAR_result_uxn_stack_h_l255_c3_1b45 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l245_c2_8001_iffalse := VAR_result_uxn_stack_h_l255_c3_1b45;
     VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l248_c3_e778_stack_index := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l244_c2_2748 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l245_c2_8001_iftrue := VAR_result_uxn_stack_h_l244_c2_2748;
     VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_address := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_right := to_unsigned(255, 8);
     VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_address := resize(to_unsigned(2, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index := to_unsigned(0, 1);
     VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_address := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l248_c3_e778_address := resize(to_unsigned(1, 1), 8);
     VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_left := VAR_addr;
     VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x := VAR_addr;
     VAR_stack_data_set_uxn_stack_h_l250_c3_a970_value := VAR_err;
     VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_value := VAR_instr;
     -- peek2_dev[uxn_stack_h_l243_c17_c9b0] LATENCY=0
     -- Clock enable
     peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE <= VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_CLOCK_ENABLE;
     -- Inputs
     peek2_dev_uxn_stack_h_l243_c17_c9b0_address <= VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_address;
     -- Outputs
     VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output := peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output;

     -- BIN_OP_AND[uxn_stack_h_l248_c34_6041] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l248_c34_6041_left <= VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_left;
     BIN_OP_AND_uxn_stack_h_l248_c34_6041_right <= VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output := BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output;

     -- CONST_SR_8[uxn_stack_h_l247_c34_9e0c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x <= VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output := CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output;

     -- Submodule level 1
     VAR_halt_handler_uxn_stack_h_l243_c2_88e5 := VAR_peek2_dev_uxn_stack_h_l243_c17_c9b0_return_output;
     VAR_MUX_uxn_stack_h_l245_c2_8001_interm_cond := resize(VAR_halt_handler_uxn_stack_h_l243_c2_88e5, 1);
     REG_VAR_halt_handler := VAR_halt_handler_uxn_stack_h_l243_c2_88e5;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond := VAR_MUX_uxn_stack_h_l245_c2_8001_interm_cond;
     VAR_result_MUX_uxn_stack_h_l245_c2_8001_cond := VAR_MUX_uxn_stack_h_l245_c2_8001_interm_cond;
     -- CAST_TO_uint8_t[uxn_stack_h_l248_c24_beef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l248_c24_beef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_stack_h_l248_c34_6041_return_output);

     -- result_MUX[uxn_stack_h_l245_c2_8001] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l245_c2_8001_cond <= VAR_result_MUX_uxn_stack_h_l245_c2_8001_cond;
     result_MUX_uxn_stack_h_l245_c2_8001_iftrue <= VAR_result_MUX_uxn_stack_h_l245_c2_8001_iftrue;
     result_MUX_uxn_stack_h_l245_c2_8001_iffalse <= VAR_result_MUX_uxn_stack_h_l245_c2_8001_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l245_c2_8001_return_output := result_MUX_uxn_stack_h_l245_c2_8001_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l247_c24_b03c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l247_c24_b03c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l247_c34_9e0c_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l245_c1_4b00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;

     -- Submodule level 2
     VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l247_c24_b03c_return_output;
     VAR_stack_data_set_uxn_stack_h_l248_c3_e778_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l248_c24_beef_return_output;
     VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;
     VAR_stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;
     VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;
     VAR_stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;
     VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l245_c1_4b00_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l245_c2_8001_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l245_c2_8001_return_output;
     -- stack_data_set[uxn_stack_h_l250_c3_a970] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l250_c3_a970_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l250_c3_a970_stack_index <= VAR_stack_data_set_uxn_stack_h_l250_c3_a970_stack_index;
     stack_data_set_uxn_stack_h_l250_c3_a970_address <= VAR_stack_data_set_uxn_stack_h_l250_c3_a970_address;
     stack_data_set_uxn_stack_h_l250_c3_a970_value <= VAR_stack_data_set_uxn_stack_h_l250_c3_a970_value;
     -- Outputs

     -- stack_pointer_set[uxn_stack_h_l246_c3_f74c] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_stack_index;
     stack_pointer_set_uxn_stack_h_l246_c3_f74c_value <= VAR_stack_pointer_set_uxn_stack_h_l246_c3_f74c_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l249_c3_f6b4] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index <= VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_stack_index;
     stack_data_set_uxn_stack_h_l249_c3_f6b4_address <= VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_address;
     stack_data_set_uxn_stack_h_l249_c3_f6b4_value <= VAR_stack_data_set_uxn_stack_h_l249_c3_f6b4_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l247_c3_bb0c] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index <= VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_stack_index;
     stack_data_set_uxn_stack_h_l247_c3_bb0c_address <= VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_address;
     stack_data_set_uxn_stack_h_l247_c3_bb0c_value <= VAR_stack_data_set_uxn_stack_h_l247_c3_bb0c_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l248_c3_e778] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l248_c3_e778_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l248_c3_e778_stack_index <= VAR_stack_data_set_uxn_stack_h_l248_c3_e778_stack_index;
     stack_data_set_uxn_stack_h_l248_c3_e778_address <= VAR_stack_data_set_uxn_stack_h_l248_c3_e778_address;
     stack_data_set_uxn_stack_h_l248_c3_e778_value <= VAR_stack_data_set_uxn_stack_h_l248_c3_e778_value;
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
