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
-- peek2_dev[uxn_stack_h_l230_c17_51a8]
signal peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_dev_uxn_stack_h_l230_c17_51a8_address : unsigned(7 downto 0);
signal peek2_dev_uxn_stack_h_l230_c17_51a8_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l232_c1_e79d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l232_c2_83bc]
signal result_MUX_uxn_stack_h_l232_c2_83bc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l232_c2_83bc_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l232_c2_83bc_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l232_c2_83bc_return_output : unsigned(7 downto 0);

-- stack_pointer_set[uxn_stack_h_l233_c3_f22e]
signal stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l233_c3_f22e_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_stack_h_l234_c34_b50b]
signal CONST_SR_8_uxn_stack_h_l234_c34_b50b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l234_c3_6ce1]
signal stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l234_c3_6ce1_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l234_c3_6ce1_value : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l235_c34_edca]
signal BIN_OP_AND_uxn_stack_h_l235_c34_edca_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_stack_h_l235_c34_edca_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l235_c3_648c]
signal stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l235_c3_648c_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l235_c3_648c_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l235_c3_648c_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l236_c3_2114]
signal stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l236_c3_2114_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l236_c3_2114_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l236_c3_2114_value : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l237_c3_8d82]
signal stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l237_c3_8d82_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l237_c3_8d82_value : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- peek2_dev_uxn_stack_h_l230_c17_51a8
peek2_dev_uxn_stack_h_l230_c17_51a8 : entity work.peek2_dev_0CLK_ad162598 port map (
clk,
peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE,
peek2_dev_uxn_stack_h_l230_c17_51a8_address,
peek2_dev_uxn_stack_h_l230_c17_51a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output);

-- result_MUX_uxn_stack_h_l232_c2_83bc
result_MUX_uxn_stack_h_l232_c2_83bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l232_c2_83bc_cond,
result_MUX_uxn_stack_h_l232_c2_83bc_iftrue,
result_MUX_uxn_stack_h_l232_c2_83bc_iffalse,
result_MUX_uxn_stack_h_l232_c2_83bc_return_output);

-- stack_pointer_set_uxn_stack_h_l233_c3_f22e
stack_pointer_set_uxn_stack_h_l233_c3_f22e : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index,
stack_pointer_set_uxn_stack_h_l233_c3_f22e_value);

-- CONST_SR_8_uxn_stack_h_l234_c34_b50b
CONST_SR_8_uxn_stack_h_l234_c34_b50b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l234_c34_b50b_x,
CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output);

-- stack_data_set_uxn_stack_h_l234_c3_6ce1
stack_data_set_uxn_stack_h_l234_c3_6ce1 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index,
stack_data_set_uxn_stack_h_l234_c3_6ce1_index,
stack_data_set_uxn_stack_h_l234_c3_6ce1_value);

-- BIN_OP_AND_uxn_stack_h_l235_c34_edca
BIN_OP_AND_uxn_stack_h_l235_c34_edca : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l235_c34_edca_left,
BIN_OP_AND_uxn_stack_h_l235_c34_edca_right,
BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output);

-- stack_data_set_uxn_stack_h_l235_c3_648c
stack_data_set_uxn_stack_h_l235_c3_648c : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l235_c3_648c_stack_index,
stack_data_set_uxn_stack_h_l235_c3_648c_index,
stack_data_set_uxn_stack_h_l235_c3_648c_value);

-- stack_data_set_uxn_stack_h_l236_c3_2114
stack_data_set_uxn_stack_h_l236_c3_2114 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l236_c3_2114_stack_index,
stack_data_set_uxn_stack_h_l236_c3_2114_index,
stack_data_set_uxn_stack_h_l236_c3_2114_value);

-- stack_data_set_uxn_stack_h_l237_c3_8d82
stack_data_set_uxn_stack_h_l237_c3_8d82 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index,
stack_data_set_uxn_stack_h_l237_c3_8d82_index,
stack_data_set_uxn_stack_h_l237_c3_8d82_value);



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
 peek2_dev_uxn_stack_h_l230_c17_51a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output,
 result_MUX_uxn_stack_h_l232_c2_83bc_return_output,
 CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output,
 BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_instr : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_addr : unsigned(15 downto 0);
 variable VAR_halt_handler_uxn_stack_h_l230_c2_0bc4 : unsigned(15 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_address : unsigned(7 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_return_output : unsigned(15 downto 0);
 variable VAR_result_uxn_stack_h_l231_c2_4542 : unsigned(7 downto 0);
 variable VAR_MUX_uxn_stack_h_l232_c2_83bc_interm_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l242_c3_9861 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l232_c2_83bc_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l232_c2_83bc_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l234_c24_694b_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l235_c3_648c_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l235_c3_648c_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l235_c3_648c_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l235_c24_9f25_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l236_c3_2114_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l236_c3_2114_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l236_c3_2114_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_right := to_unsigned(255, 8);
     VAR_result_uxn_stack_h_l231_c2_4542 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iftrue := VAR_result_uxn_stack_h_l231_c2_4542;
     VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index := to_unsigned(0, 1);
     VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_address := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l235_c3_648c_index := resize(to_unsigned(1, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_index := resize(to_unsigned(3, 2), 8);
     VAR_result_uxn_stack_h_l242_c3_9861 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iffalse := VAR_result_uxn_stack_h_l242_c3_9861;
     VAR_stack_data_set_uxn_stack_h_l235_c3_648c_stack_index := to_unsigned(0, 1);
     VAR_stack_data_set_uxn_stack_h_l236_c3_2114_index := resize(to_unsigned(2, 2), 8);
     VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index := to_unsigned(0, 1);
     VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_value := resize(to_unsigned(4, 3), 8);
     VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_index := resize(to_unsigned(0, 1), 8);
     VAR_stack_data_set_uxn_stack_h_l236_c3_2114_stack_index := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_left := VAR_addr;
     VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_x := VAR_addr;
     VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_value := VAR_err;
     VAR_stack_data_set_uxn_stack_h_l236_c3_2114_value := VAR_instr;
     -- CONST_SR_8[uxn_stack_h_l234_c34_b50b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l234_c34_b50b_x <= VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output := CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output;

     -- BIN_OP_AND[uxn_stack_h_l235_c34_edca] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l235_c34_edca_left <= VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_left;
     BIN_OP_AND_uxn_stack_h_l235_c34_edca_right <= VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output := BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output;

     -- peek2_dev[uxn_stack_h_l230_c17_51a8] LATENCY=0
     -- Clock enable
     peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE <= VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_CLOCK_ENABLE;
     -- Inputs
     peek2_dev_uxn_stack_h_l230_c17_51a8_address <= VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_address;
     -- Outputs
     VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_return_output := peek2_dev_uxn_stack_h_l230_c17_51a8_return_output;

     -- Submodule level 1
     VAR_halt_handler_uxn_stack_h_l230_c2_0bc4 := VAR_peek2_dev_uxn_stack_h_l230_c17_51a8_return_output;
     VAR_MUX_uxn_stack_h_l232_c2_83bc_interm_cond := resize(VAR_halt_handler_uxn_stack_h_l230_c2_0bc4, 1);
     REG_VAR_halt_handler := VAR_halt_handler_uxn_stack_h_l230_c2_0bc4;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond := VAR_MUX_uxn_stack_h_l232_c2_83bc_interm_cond;
     VAR_result_MUX_uxn_stack_h_l232_c2_83bc_cond := VAR_MUX_uxn_stack_h_l232_c2_83bc_interm_cond;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l232_c1_e79d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;

     -- result_MUX[uxn_stack_h_l232_c2_83bc] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l232_c2_83bc_cond <= VAR_result_MUX_uxn_stack_h_l232_c2_83bc_cond;
     result_MUX_uxn_stack_h_l232_c2_83bc_iftrue <= VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iftrue;
     result_MUX_uxn_stack_h_l232_c2_83bc_iffalse <= VAR_result_MUX_uxn_stack_h_l232_c2_83bc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l232_c2_83bc_return_output := result_MUX_uxn_stack_h_l232_c2_83bc_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l234_c24_694b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l234_c24_694b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l234_c34_b50b_return_output);

     -- CAST_TO_uint8_t[uxn_stack_h_l235_c24_9f25] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l235_c24_9f25_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_stack_h_l235_c34_edca_return_output);

     -- Submodule level 2
     VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l234_c24_694b_return_output;
     VAR_stack_data_set_uxn_stack_h_l235_c3_648c_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l235_c24_9f25_return_output;
     VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;
     VAR_stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;
     VAR_stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;
     VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;
     VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l232_c1_e79d_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l232_c2_83bc_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l232_c2_83bc_return_output;
     -- stack_data_set[uxn_stack_h_l235_c3_648c] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l235_c3_648c_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l235_c3_648c_stack_index <= VAR_stack_data_set_uxn_stack_h_l235_c3_648c_stack_index;
     stack_data_set_uxn_stack_h_l235_c3_648c_index <= VAR_stack_data_set_uxn_stack_h_l235_c3_648c_index;
     stack_data_set_uxn_stack_h_l235_c3_648c_value <= VAR_stack_data_set_uxn_stack_h_l235_c3_648c_value;
     -- Outputs

     -- stack_pointer_set[uxn_stack_h_l233_c3_f22e] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_stack_index;
     stack_pointer_set_uxn_stack_h_l233_c3_f22e_value <= VAR_stack_pointer_set_uxn_stack_h_l233_c3_f22e_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l237_c3_8d82] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index <= VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_stack_index;
     stack_data_set_uxn_stack_h_l237_c3_8d82_index <= VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_index;
     stack_data_set_uxn_stack_h_l237_c3_8d82_value <= VAR_stack_data_set_uxn_stack_h_l237_c3_8d82_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l236_c3_2114] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l236_c3_2114_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l236_c3_2114_stack_index <= VAR_stack_data_set_uxn_stack_h_l236_c3_2114_stack_index;
     stack_data_set_uxn_stack_h_l236_c3_2114_index <= VAR_stack_data_set_uxn_stack_h_l236_c3_2114_index;
     stack_data_set_uxn_stack_h_l236_c3_2114_value <= VAR_stack_data_set_uxn_stack_h_l236_c3_2114_value;
     -- Outputs

     -- stack_data_set[uxn_stack_h_l234_c3_6ce1] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index <= VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_stack_index;
     stack_data_set_uxn_stack_h_l234_c3_6ce1_index <= VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_index;
     stack_data_set_uxn_stack_h_l234_c3_6ce1_value <= VAR_stack_data_set_uxn_stack_h_l234_c3_6ce1_value;
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
