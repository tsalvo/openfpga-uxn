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
-- Submodules: 41
entity jmp2_0CLK_0b1ee796 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_0b1ee796;
architecture arch of jmp2_0CLK_0b1ee796 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l612_c6_8cbc]
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_6b96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_697e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l612_c2_697e]
signal t16_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l613_c3_7268[uxn_opcodes_h_l613_c3_7268]
signal printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l617_c11_1940]
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_d38d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l617_c7_d38d]
signal t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l620_c11_7efb]
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_21ef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l620_c7_21ef]
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_21ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_21ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_21ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l620_c7_21ef]
signal t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l622_c3_6a97]
signal CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l624_c11_5726]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_eb13]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l624_c7_eb13]
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_eb13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_eb13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_eb13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c7_eb13]
signal t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l625_c3_3094]
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l627_c30_3b06]
signal sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l631_c11_2076]
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_9832]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_9832]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_9832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_660c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc
BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e
result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- t16_MUX_uxn_opcodes_h_l612_c2_697e
t16_MUX_uxn_opcodes_h_l612_c2_697e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l612_c2_697e_cond,
t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue,
t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse,
t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

-- printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268
printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268 : entity work.printf_uxn_opcodes_h_l613_c3_7268_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d
result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- t16_MUX_uxn_opcodes_h_l617_c7_d38d
t16_MUX_uxn_opcodes_h_l617_c7_d38d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond,
t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue,
t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse,
t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb
BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef
result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- t16_MUX_uxn_opcodes_h_l620_c7_21ef
t16_MUX_uxn_opcodes_h_l620_c7_21ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond,
t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue,
t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse,
t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output);

-- CONST_SL_8_uxn_opcodes_h_l622_c3_6a97
CONST_SL_8_uxn_opcodes_h_l622_c3_6a97 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x,
CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726
BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13
result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c7_eb13
t16_MUX_uxn_opcodes_h_l624_c7_eb13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond,
t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue,
t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse,
t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l625_c3_3094
BIN_OP_OR_uxn_opcodes_h_l625_c3_3094 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left,
BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right,
BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output);

-- sp_relative_shift_uxn_opcodes_h_l627_c30_3b06
sp_relative_shift_uxn_opcodes_h_l627_c30_3b06 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins,
sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x,
sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y,
sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076
BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output,
 CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output,
 BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output,
 sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_efde : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_26ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_d38d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_da49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l637_l608_DUPLICATE_5fb3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_26ba := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_26ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_efde := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_efde;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := t16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l612_c6_8cbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l631_c11_2076] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_left;
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output := BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c11_5726] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l627_c30_3b06] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_ins;
     sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_x;
     sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output := sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l620_c11_7efb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_left;
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output := BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_da49 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_da49_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_d38d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l617_c11_1940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_left;
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output := BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_8cbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_7efb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_5726_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_2076_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_da49_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_da49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_f12e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l617_l624_DUPLICATE_9107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l631_l617_l624_DUPLICATE_ee98_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_3528_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l631_l617_DUPLICATE_9987_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_3b06_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l625_c3_3094] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_left;
     BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output := BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_9832] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_6b96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_9832] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l622_c3_6a97] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x <= VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output := CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_9832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3094_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_6a97_return_output;
     VAR_printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_6b96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_9832_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_9832_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_9832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- printf_uxn_opcodes_h_l613_c3_7268[uxn_opcodes_h_l613_c3_7268] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l613_c3_7268_uxn_opcodes_h_l613_c3_7268_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l624_c7_eb13] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_cond;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output := result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l624_c7_eb13_return_output;
     -- t16_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_21ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l620_c7_21ef_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- t16_MUX[uxn_opcodes_h_l617_c7_d38d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_cond;
     t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iftrue;
     t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output := t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l617_c7_d38d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- t16_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output := t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_697e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l612_c2_697e_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l637_l608_DUPLICATE_5fb3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l637_l608_DUPLICATE_5fb3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_660c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_697e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_697e_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l637_l608_DUPLICATE_5fb3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l637_l608_DUPLICATE_5fb3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
