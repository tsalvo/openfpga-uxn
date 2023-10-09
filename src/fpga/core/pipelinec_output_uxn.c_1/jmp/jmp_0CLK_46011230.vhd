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
-- Submodules: 38
entity jmp_0CLK_46011230 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_46011230;
architecture arch of jmp_0CLK_46011230 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l656_c6_77fb]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l656_c1_dfec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l656_c2_5b0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l657_c3_eef3[uxn_opcodes_h_l657_c3_eef3]
signal printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l662_c11_eceb]
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l662_c7_84e0]
signal t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l662_c7_84e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l665_c11_7a96]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l665_c7_5aae]
signal t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_5aae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l669_c32_5b1e]
signal BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l669_c32_e46c]
signal BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l669_c32_0dd6]
signal MUX_uxn_opcodes_h_l669_c32_0dd6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l669_c32_0dd6_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l671_c15_3476]
signal BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l673_c11_42e7]
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l673_c7_7588]
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l673_c7_7588]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l673_c7_7588]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_747d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb
BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output);

-- t8_MUX_uxn_opcodes_h_l656_c2_5b0e
t8_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e
result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e
result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e
result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

-- printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3
printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3 : entity work.printf_uxn_opcodes_h_l657_c3_eef3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb
BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output);

-- t8_MUX_uxn_opcodes_h_l662_c7_84e0
t8_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l662_c7_84e0
result_pc_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0
result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output);

-- t8_MUX_uxn_opcodes_h_l665_c7_5aae
t8_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_pc_MUX_uxn_opcodes_h_l665_c7_5aae
result_pc_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e
BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left,
BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right,
BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c
BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left,
BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right,
BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output);

-- MUX_uxn_opcodes_h_l669_c32_0dd6
MUX_uxn_opcodes_h_l669_c32_0dd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l669_c32_0dd6_cond,
MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue,
MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse,
MUX_uxn_opcodes_h_l669_c32_0dd6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476
BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left,
BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right,
BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7
BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left,
BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right,
BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output,
 t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output,
 t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output,
 t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output,
 BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output,
 MUX_uxn_opcodes_h_l669_c32_0dd6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_86c4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_782b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l662_c7_84e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l671_c3_1b0d : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l666_c8_c4dc_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l665_l662_DUPLICATE_16e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l679_l652_DUPLICATE_6460_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_782b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_782b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_86c4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_86c4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l662_c7_84e0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l665_l662_DUPLICATE_16e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l665_l662_DUPLICATE_16e6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c6_77fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c11_7a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l673_c11_42e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l669_c32_5b1e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_left;
     BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output := BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l662_c11_eceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_left;
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output := BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l666_c8_c4dc] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l666_c8_c4dc_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l669_c32_5b1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c6_77fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_eceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_7a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_42e7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l666_c8_c4dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l666_c8_c4dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_6fbe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l665_l656_l662_DUPLICATE_a94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l673_l662_DUPLICATE_986c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_061f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l673_l662_DUPLICATE_b357_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l665_l662_DUPLICATE_16e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l665_l662_DUPLICATE_16e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l662_c7_84e0_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l669_c32_e46c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_left;
     BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output := BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l671_c15_3476] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_left;
     BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output := BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l656_c1_dfec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l673_c7_7588] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l673_c7_7588] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output;

     -- t8_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l673_c7_7588] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l669_c32_e46c_return_output;
     VAR_result_pc_uxn_opcodes_h_l671_c3_1b0d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l671_c15_3476_return_output)),16);
     VAR_printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l656_c1_dfec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_7588_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_7588_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_7588_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := VAR_result_pc_uxn_opcodes_h_l671_c3_1b0d;
     -- t8_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- printf_uxn_opcodes_h_l657_c3_eef3[uxn_opcodes_h_l657_c3_eef3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l657_c3_eef3_uxn_opcodes_h_l657_c3_eef3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- MUX[uxn_opcodes_h_l669_c32_0dd6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l669_c32_0dd6_cond <= VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_cond;
     MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue <= VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iftrue;
     MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse <= VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_return_output := MUX_uxn_opcodes_h_l669_c32_0dd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue := VAR_MUX_uxn_opcodes_h_l669_c32_0dd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- t8_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_5aae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_5aae_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l662_c7_84e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- Submodule level 5
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l662_c7_84e0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c2_5b0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l679_l652_DUPLICATE_6460 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l679_l652_DUPLICATE_6460_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_747d(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c2_5b0e_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l679_l652_DUPLICATE_6460_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l679_l652_DUPLICATE_6460_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
