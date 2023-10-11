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
entity pop_0CLK_10d8c973 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end pop_0CLK_10d8c973;
architecture arch of pop_0CLK_10d8c973 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l267_c6_06f9]
signal BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l267_c1_a70b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l267_c2_bf1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l267_c2_bf1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l267_c2_bf1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : signed(7 downto 0);

-- printf_uxn_opcodes_h_l268_c3_9b50[uxn_opcodes_h_l268_c3_9b50]
signal printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l270_c32_a5a8]
signal BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l270_c32_6bce]
signal BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l270_c32_cac5]
signal MUX_uxn_opcodes_h_l270_c32_cac5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l270_c32_cac5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l270_c32_cac5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l270_c32_cac5_return_output : signed(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9
BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left,
BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right,
BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d
result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d
result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output);

-- printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50
printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50 : entity work.printf_uxn_opcodes_h_l268_c3_9b50_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE);

-- BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8
BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left,
BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right,
BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce
BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left,
BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right,
BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output);

-- MUX_uxn_opcodes_h_l270_c32_cac5
MUX_uxn_opcodes_h_l270_c32_cac5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l270_c32_cac5_cond,
MUX_uxn_opcodes_h_l270_c32_cac5_iftrue,
MUX_uxn_opcodes_h_l270_c32_cac5_iffalse,
MUX_uxn_opcodes_h_l270_c32_cac5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output,
 MUX_uxn_opcodes_h_l270_c32_cac5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l267_c2_bf1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l270_c32_cac5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l270_c32_cac5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6_uxn_opcodes_h_l263_l278_DUPLICATE_3b1f_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left := VAR_phase;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_AND[uxn_opcodes_h_l270_c32_a5a8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_left;
     BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output := BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l267_c2_bf1d] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l267_c2_bf1d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l267_c6_06f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left := VAR_BIN_OP_AND_uxn_opcodes_h_l270_c32_a5a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l267_c6_06f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l267_c2_bf1d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l270_c32_6bce] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_left;
     BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output := BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l267_c2_bf1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l267_c1_a70b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l267_c2_bf1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l270_c32_cac5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l270_c32_6bce_return_output;
     VAR_printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l267_c1_a70b_return_output;
     -- MUX[uxn_opcodes_h_l270_c32_cac5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l270_c32_cac5_cond <= VAR_MUX_uxn_opcodes_h_l270_c32_cac5_cond;
     MUX_uxn_opcodes_h_l270_c32_cac5_iftrue <= VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iftrue;
     MUX_uxn_opcodes_h_l270_c32_cac5_iffalse <= VAR_MUX_uxn_opcodes_h_l270_c32_cac5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l270_c32_cac5_return_output := MUX_uxn_opcodes_h_l270_c32_cac5_return_output;

     -- printf_uxn_opcodes_h_l268_c3_9b50[uxn_opcodes_h_l268_c3_9b50] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l268_c3_9b50_uxn_opcodes_h_l268_c3_9b50_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue := VAR_MUX_uxn_opcodes_h_l270_c32_cac5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l267_c2_bf1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6_uxn_opcodes_h_l263_l278_DUPLICATE_3b1f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6_uxn_opcodes_h_l263_l278_DUPLICATE_3b1f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l267_c2_bf1d_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6_uxn_opcodes_h_l263_l278_DUPLICATE_3b1f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5bf6_uxn_opcodes_h_l263_l278_DUPLICATE_3b1f_return_output;
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
