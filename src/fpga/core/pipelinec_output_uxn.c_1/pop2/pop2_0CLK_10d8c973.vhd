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
entity pop2_0CLK_10d8c973 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end pop2_0CLK_10d8c973;
architecture arch of pop2_0CLK_10d8c973 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l282_c6_10be]
signal BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l282_c1_3c37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l282_c2_ace9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l282_c2_ace9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l282_c2_ace9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : signed(7 downto 0);

-- printf_uxn_opcodes_h_l283_c3_b28c[uxn_opcodes_h_l283_c3_b28c]
signal printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l285_c32_640f]
signal BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l285_c32_443d]
signal BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l285_c32_3dce]
signal MUX_uxn_opcodes_h_l285_c32_3dce_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l285_c32_3dce_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l285_c32_3dce_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l285_c32_3dce_return_output : signed(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c950( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be
BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left,
BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right,
BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9
result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9
result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9
result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output);

-- printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c
printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c : entity work.printf_uxn_opcodes_h_l283_c3_b28c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE);

-- BIN_OP_AND_uxn_opcodes_h_l285_c32_640f
BIN_OP_AND_uxn_opcodes_h_l285_c32_640f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left,
BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right,
BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l285_c32_443d
BIN_OP_GT_uxn_opcodes_h_l285_c32_443d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left,
BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right,
BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output);

-- MUX_uxn_opcodes_h_l285_c32_3dce
MUX_uxn_opcodes_h_l285_c32_3dce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l285_c32_3dce_cond,
MUX_uxn_opcodes_h_l285_c32_3dce_iftrue,
MUX_uxn_opcodes_h_l285_c32_3dce_iffalse,
MUX_uxn_opcodes_h_l285_c32_3dce_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output,
 MUX_uxn_opcodes_h_l285_c32_3dce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l282_c2_ace9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l285_c32_3dce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l285_c32_3dce_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c950_uxn_opcodes_h_l293_l279_DUPLICATE_5bce_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left := VAR_phase;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l282_c2_ace9] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l282_c2_ace9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l282_c6_10be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_left;
     BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output := BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l285_c32_640f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_left;
     BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output := BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l285_c32_640f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l282_c6_10be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l282_c2_ace9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l282_c2_ace9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l285_c32_443d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_left;
     BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output := BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l282_c2_ace9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l282_c1_3c37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l285_c32_3dce_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l285_c32_443d_return_output;
     VAR_printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l282_c1_3c37_return_output;
     -- MUX[uxn_opcodes_h_l285_c32_3dce] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l285_c32_3dce_cond <= VAR_MUX_uxn_opcodes_h_l285_c32_3dce_cond;
     MUX_uxn_opcodes_h_l285_c32_3dce_iftrue <= VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iftrue;
     MUX_uxn_opcodes_h_l285_c32_3dce_iffalse <= VAR_MUX_uxn_opcodes_h_l285_c32_3dce_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l285_c32_3dce_return_output := MUX_uxn_opcodes_h_l285_c32_3dce_return_output;

     -- printf_uxn_opcodes_h_l283_c3_b28c[uxn_opcodes_h_l283_c3_b28c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l283_c3_b28c_uxn_opcodes_h_l283_c3_b28c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue := VAR_MUX_uxn_opcodes_h_l285_c32_3dce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l282_c2_ace9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c950_uxn_opcodes_h_l293_l279_DUPLICATE_5bce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c950_uxn_opcodes_h_l293_l279_DUPLICATE_5bce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c950(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l282_c2_ace9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l282_c2_ace9_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c950_uxn_opcodes_h_l293_l279_DUPLICATE_5bce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c950_uxn_opcodes_h_l293_l279_DUPLICATE_5bce_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
