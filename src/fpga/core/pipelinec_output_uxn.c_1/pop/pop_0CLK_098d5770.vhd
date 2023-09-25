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
-- Submodules: 10
entity pop_0CLK_098d5770 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end pop_0CLK_098d5770;
architecture arch of pop_0CLK_098d5770 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l275_c6_f7d1]
signal BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l275_c1_fd6f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l275_c2_a8e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(0 downto 0);

-- result_sp_MUX[uxn_opcodes_h_l275_c2_a8e4]
signal result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(7 downto 0);
signal result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(7 downto 0);

-- result_is_sp_updated_MUX[uxn_opcodes_h_l275_c2_a8e4]
signal result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l276_c3_8c96[uxn_opcodes_h_l276_c3_8c96]
signal printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l278_c16_5945]
signal BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l278_c35_6277]
signal BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l278_c16_685c]
signal MUX_uxn_opcodes_h_l278_c16_685c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l278_c16_685c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l278_c16_685c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l278_c16_685c_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_80bd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.sp := ref_toks_2;
      base.is_sp_updated := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1
BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left,
BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right,
BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4
result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output);

-- result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4
result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond,
result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue,
result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse,
result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output);

-- result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4
result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond,
result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue,
result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse,
result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output);

-- printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96
printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96 : entity work.printf_uxn_opcodes_h_l276_c3_8c96_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE);

-- BIN_OP_AND_uxn_opcodes_h_l278_c16_5945
BIN_OP_AND_uxn_opcodes_h_l278_c16_5945 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left,
BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right,
BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277
BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left,
BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right,
BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output);

-- MUX_uxn_opcodes_h_l278_c16_685c
MUX_uxn_opcodes_h_l278_c16_685c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l278_c16_685c_cond,
MUX_uxn_opcodes_h_l278_c16_685c_iftrue,
MUX_uxn_opcodes_h_l278_c16_685c_iffalse,
MUX_uxn_opcodes_h_l278_c16_685c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 stack_index,
 ins,
 pc,
 sp,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output,
 result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output,
 result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output,
 MUX_uxn_opcodes_h_l278_c16_685c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_sp_uxn_opcodes_h_l283_c3_ae84 : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(7 downto 0);
 variable VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l278_c16_685c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l278_c16_685c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l278_c16_685c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l278_c16_685c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_80bd_uxn_opcodes_h_l287_l271_DUPLICATE_18cc_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right := to_unsigned(0, 1);
     VAR_result_sp_uxn_opcodes_h_l283_c3_ae84 := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse := VAR_result_sp_uxn_opcodes_h_l283_c3_ae84;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left := VAR_sp;
     VAR_MUX_uxn_opcodes_h_l278_c16_685c_iftrue := VAR_sp;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_MINUS[uxn_opcodes_h_l278_c35_6277] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_left;
     BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output := BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l278_c16_5945] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_left;
     BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output := BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l275_c6_f7d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l278_c16_685c_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l278_c16_5945_return_output, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output;
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output;
     VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l275_c6_f7d1_return_output;
     VAR_MUX_uxn_opcodes_h_l278_c16_685c_iffalse := VAR_BIN_OP_MINUS_uxn_opcodes_h_l278_c35_6277_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l275_c1_fd6f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l275_c2_a8e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output;

     -- result_is_sp_updated_MUX[uxn_opcodes_h_l275_c2_a8e4] LATENCY=0
     -- Inputs
     result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_cond;
     result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue;
     result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse <= VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse;
     -- Outputs
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output := result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output;

     -- MUX[uxn_opcodes_h_l278_c16_685c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l278_c16_685c_cond <= VAR_MUX_uxn_opcodes_h_l278_c16_685c_cond;
     MUX_uxn_opcodes_h_l278_c16_685c_iftrue <= VAR_MUX_uxn_opcodes_h_l278_c16_685c_iftrue;
     MUX_uxn_opcodes_h_l278_c16_685c_iffalse <= VAR_MUX_uxn_opcodes_h_l278_c16_685c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l278_c16_685c_return_output := MUX_uxn_opcodes_h_l278_c16_685c_return_output;

     -- Submodule level 2
     VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue := VAR_MUX_uxn_opcodes_h_l278_c16_685c_return_output;
     VAR_printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l275_c1_fd6f_return_output;
     -- printf_uxn_opcodes_h_l276_c3_8c96[uxn_opcodes_h_l276_c3_8c96] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l276_c3_8c96_uxn_opcodes_h_l276_c3_8c96_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_MUX[uxn_opcodes_h_l275_c2_a8e4] LATENCY=0
     -- Inputs
     result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond <= VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_cond;
     result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue <= VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iftrue;
     result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse <= VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_iffalse;
     -- Outputs
     VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output := result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output;

     -- Submodule level 3
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_80bd_uxn_opcodes_h_l287_l271_DUPLICATE_18cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_80bd_uxn_opcodes_h_l287_l271_DUPLICATE_18cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_80bd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output,
     VAR_result_sp_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output,
     VAR_result_is_sp_updated_MUX_uxn_opcodes_h_l275_c2_a8e4_return_output);

     -- Submodule level 4
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_80bd_uxn_opcodes_h_l287_l271_DUPLICATE_18cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_80bd_uxn_opcodes_h_l287_l271_DUPLICATE_18cc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
