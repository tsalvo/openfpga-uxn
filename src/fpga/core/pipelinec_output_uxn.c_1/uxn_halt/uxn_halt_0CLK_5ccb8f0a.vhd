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
entity uxn_halt_0CLK_5ccb8f0a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 instr : in unsigned(7 downto 0);
 err : in unsigned(7 downto 0);
 addr : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_halt_0CLK_5ccb8f0a;
architecture arch of uxn_halt_0CLK_5ccb8f0a is
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
-- peek2_dev[uxn_stack_h_l249_c17_be7d]
signal peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_dev_uxn_stack_h_l249_c17_be7d_address : unsigned(7 downto 0);
signal peek2_dev_uxn_stack_h_l249_c17_be7d_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l251_c1_e11a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l251_c2_8448]
signal result_MUX_uxn_stack_h_l251_c2_8448_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l251_c2_8448_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l251_c2_8448_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l251_c2_8448_return_output : unsigned(7 downto 0);

-- stack_pointer_set[uxn_stack_h_l252_c3_ba35]
signal stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l252_c3_ba35_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l253_c34_6307]
signal CONST_SR_8_uxn_stack_h_l253_c34_6307_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l253_c3_6be8]
signal stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l253_c3_6be8_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l253_c3_6be8_value : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l254_c34_4e68]
signal BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l254_c3_2b5b]
signal stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l254_c3_2b5b_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l254_c3_2b5b_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l255_c3_ca52]
signal stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l255_c3_ca52_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l255_c3_ca52_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l256_c3_9a45]
signal stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l256_c3_9a45_address : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l256_c3_9a45_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- peek2_dev_uxn_stack_h_l249_c17_be7d
peek2_dev_uxn_stack_h_l249_c17_be7d : entity work.peek2_dev_0CLK_7bf2eff3 port map (
clk,
peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE,
peek2_dev_uxn_stack_h_l249_c17_be7d_address,
peek2_dev_uxn_stack_h_l249_c17_be7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output);

-- result_MUX_uxn_stack_h_l251_c2_8448
result_MUX_uxn_stack_h_l251_c2_8448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l251_c2_8448_cond,
result_MUX_uxn_stack_h_l251_c2_8448_iftrue,
result_MUX_uxn_stack_h_l251_c2_8448_iffalse,
result_MUX_uxn_stack_h_l251_c2_8448_return_output);

-- stack_pointer_set_uxn_stack_h_l252_c3_ba35
stack_pointer_set_uxn_stack_h_l252_c3_ba35 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index,
stack_pointer_set_uxn_stack_h_l252_c3_ba35_value);

-- CONST_SR_8_uxn_stack_h_l253_c34_6307
CONST_SR_8_uxn_stack_h_l253_c34_6307 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l253_c34_6307_x,
CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output);

-- stack_data_set_uxn_stack_h_l253_c3_6be8
stack_data_set_uxn_stack_h_l253_c3_6be8 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index,
stack_data_set_uxn_stack_h_l253_c3_6be8_address,
stack_data_set_uxn_stack_h_l253_c3_6be8_value);

-- BIN_OP_AND_uxn_stack_h_l254_c34_4e68
BIN_OP_AND_uxn_stack_h_l254_c34_4e68 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left,
BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right,
BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output);

-- stack_data_set_uxn_stack_h_l254_c3_2b5b
stack_data_set_uxn_stack_h_l254_c3_2b5b : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index,
stack_data_set_uxn_stack_h_l254_c3_2b5b_address,
stack_data_set_uxn_stack_h_l254_c3_2b5b_value);

-- stack_data_set_uxn_stack_h_l255_c3_ca52
stack_data_set_uxn_stack_h_l255_c3_ca52 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index,
stack_data_set_uxn_stack_h_l255_c3_ca52_address,
stack_data_set_uxn_stack_h_l255_c3_ca52_value);

-- stack_data_set_uxn_stack_h_l256_c3_9a45
stack_data_set_uxn_stack_h_l256_c3_9a45 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index,
stack_data_set_uxn_stack_h_l256_c3_9a45_address,
stack_data_set_uxn_stack_h_l256_c3_9a45_value);



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
 peek2_dev_uxn_stack_h_l249_c17_be7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output,
 result_MUX_uxn_stack_h_l251_c2_8448_return_output,
 CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output,
 BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_instr : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_addr : unsigned(15 downto 0);
 variable VAR_halt_handler_uxn_stack_h_l249_c2_f8b0 : unsigned(15 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_address : unsigned(7 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_return_output : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l250_c2_8eac : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l251_c2_8448_interm_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l251_c2_8448_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l251_c2_8448_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l261_c3_3d20 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l251_c2_8448_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l251_c2_8448_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l253_c24_57fc_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l254_c24_b393_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_uxn_stack_h_l261_c3_3d20 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l251_c2_8448_iffalse := VAR_result_uxn_stack_h_l261_c3_3d20;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_address := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right := to_unsigned(255, 8);
     VAR_result_uxn_stack_h_l250_c2_8eac := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l251_c2_8448_iftrue := VAR_result_uxn_stack_h_l250_c2_8eac;
     VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_address := resize(to_unsigned(2, 2), 8);
     VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_value := resize(to_unsigned(4, 3), 8);
     VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_address := resize(to_unsigned(3, 2), 8);
     VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index := to_unsigned(0, 1);
     VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_address := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_address := resize(to_unsigned(1, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left := VAR_addr;
     VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_x := VAR_addr;
     VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_value := VAR_err;
     VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_value := VAR_instr;
     -- CONST_SR_8[uxn_stack_h_l253_c34_6307] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l253_c34_6307_x <= VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output := CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output;

     -- peek2_dev[uxn_stack_h_l249_c17_be7d] LATENCY=0
     -- Clock enable
     peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE <= VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_CLOCK_ENABLE;
     -- Inputs
     peek2_dev_uxn_stack_h_l249_c17_be7d_address <= VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_address;
     -- Outputs
     VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_return_output := peek2_dev_uxn_stack_h_l249_c17_be7d_return_output;

     -- BIN_OP_AND[uxn_stack_h_l254_c34_4e68] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left <= VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_left;
     BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right <= VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output := BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output;

     -- Submodule level 1
     VAR_halt_handler_uxn_stack_h_l249_c2_f8b0 := VAR_peek2_dev_uxn_stack_h_l249_c17_be7d_return_output;
     VAR_MUX_uxn_stack_h_l251_c2_8448_interm_cond := resize(VAR_halt_handler_uxn_stack_h_l249_c2_f8b0, 1);
     REG_VAR_halt_handler := VAR_halt_handler_uxn_stack_h_l249_c2_f8b0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond := VAR_MUX_uxn_stack_h_l251_c2_8448_interm_cond;
     VAR_result_MUX_uxn_stack_h_l251_c2_8448_cond := VAR_MUX_uxn_stack_h_l251_c2_8448_interm_cond;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l251_c1_e11a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l254_c24_b393] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l254_c24_b393_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_stack_h_l254_c34_4e68_return_output);

     -- result_MUX[uxn_stack_h_l251_c2_8448] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l251_c2_8448_cond <= VAR_result_MUX_uxn_stack_h_l251_c2_8448_cond;
     result_MUX_uxn_stack_h_l251_c2_8448_iftrue <= VAR_result_MUX_uxn_stack_h_l251_c2_8448_iftrue;
     result_MUX_uxn_stack_h_l251_c2_8448_iffalse <= VAR_result_MUX_uxn_stack_h_l251_c2_8448_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l251_c2_8448_return_output := result_MUX_uxn_stack_h_l251_c2_8448_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l253_c24_57fc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l253_c24_57fc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l253_c34_6307_return_output);

     -- Submodule level 2
     VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l253_c24_57fc_return_output;
     VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l254_c24_b393_return_output;
     VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;
     VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;
     VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;
     VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;
     VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l251_c1_e11a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l251_c2_8448_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l251_c2_8448_return_output;
     -- stack_pointer_set[uxn_stack_h_l252_c3_ba35] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_stack_index;
     stack_pointer_set_uxn_stack_h_l252_c3_ba35_value <= VAR_stack_pointer_set_uxn_stack_h_l252_c3_ba35_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l254_c3_2b5b] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index <= VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_stack_index;
     stack_data_set_uxn_stack_h_l254_c3_2b5b_address <= VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_address;
     stack_data_set_uxn_stack_h_l254_c3_2b5b_value <= VAR_stack_data_set_uxn_stack_h_l254_c3_2b5b_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l253_c3_6be8] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index <= VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_stack_index;
     stack_data_set_uxn_stack_h_l253_c3_6be8_address <= VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_address;
     stack_data_set_uxn_stack_h_l253_c3_6be8_value <= VAR_stack_data_set_uxn_stack_h_l253_c3_6be8_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l255_c3_ca52] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index <= VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_stack_index;
     stack_data_set_uxn_stack_h_l255_c3_ca52_address <= VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_address;
     stack_data_set_uxn_stack_h_l255_c3_ca52_value <= VAR_stack_data_set_uxn_stack_h_l255_c3_ca52_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l256_c3_9a45] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index <= VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_stack_index;
     stack_data_set_uxn_stack_h_l256_c3_9a45_address <= VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_address;
     stack_data_set_uxn_stack_h_l256_c3_9a45_value <= VAR_stack_data_set_uxn_stack_h_l256_c3_9a45_value;
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
