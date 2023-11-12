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
-- BIN_OP_EQ[uxn_opcodes_h_l612_c6_0dca]
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_4598]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l612_c2_a98d]
signal t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_a98d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l613_c3_a77e[uxn_opcodes_h_l613_c3_a77e]
signal printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l617_c11_cf8b]
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l617_c7_4128]
signal t16_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_4128]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l620_c11_4edf]
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l620_c7_9876]
signal t16_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l620_c7_9876]
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_9876]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_9876]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_9876]
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_9876]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l622_c3_377c]
signal CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l624_c11_b7c8]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c7_c142]
signal t16_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l624_c7_c142]
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_c142]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_c142]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_c142]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_c142]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l625_c3_dc31]
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l627_c30_bd50]
signal sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l631_c11_8ae7]
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_2157]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_2157]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_2157]
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6245( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca
BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output);

-- t16_MUX_uxn_opcodes_h_l612_c2_a98d
t16_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

-- printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e
printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e : entity work.printf_uxn_opcodes_h_l613_c3_a77e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b
BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output);

-- t16_MUX_uxn_opcodes_h_l617_c7_4128
t16_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l617_c7_4128_cond,
t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128
result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf
BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output);

-- t16_MUX_uxn_opcodes_h_l620_c7_9876
t16_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l620_c7_9876_cond,
t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876
result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output);

-- CONST_SL_8_uxn_opcodes_h_l622_c3_377c
CONST_SL_8_uxn_opcodes_h_l622_c3_377c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x,
CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8
BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c7_c142
t16_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c7_c142_cond,
t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142
result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31
BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left,
BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right,
BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output);

-- sp_relative_shift_uxn_opcodes_h_l627_c30_bd50
sp_relative_shift_uxn_opcodes_h_l627_c30_bd50 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins,
sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x,
sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y,
sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7
BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output,
 t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output,
 t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output,
 t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output,
 CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output,
 t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output,
 BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output,
 sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_49d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_b1d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_4128_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_9168_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l608_l637_DUPLICATE_71be_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_49d2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_49d2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_b1d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_b1d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y := resize(to_signed(-2, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l624_c11_b7c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_4128_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l612_c6_0dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_left;
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output := BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l617_c11_cf8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l631_c11_8ae7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_left;
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output := BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l620_c11_4edf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_left;
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output := BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_9168 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_9168_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l627_c30_bd50] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_ins;
     sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_x;
     sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output := sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_0dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_cf8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_4edf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_b7c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_8ae7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_9168_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l621_l625_DUPLICATE_9168_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_0856_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_59f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_06d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_ff8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_9fcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_bd50_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_2157] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l625_c3_dc31] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_left;
     BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output := BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l622_c3_377c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output := CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_2157] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_2157] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_4598] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_dc31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_377c_return_output;
     VAR_printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_4598_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_2157_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_2157_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_2157_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output := result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- printf_uxn_opcodes_h_l613_c3_a77e[uxn_opcodes_h_l613_c3_a77e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l613_c3_a77e_uxn_opcodes_h_l613_c3_a77e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- t16_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output := t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_c142] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse := VAR_t16_MUX_uxn_opcodes_h_l624_c7_c142_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- t16_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output := t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output := result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_9876] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse := VAR_t16_MUX_uxn_opcodes_h_l620_c7_9876_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- t16_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output := t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_4128] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l617_c7_4128_return_output;
     -- t16_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_a98d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l612_c2_a98d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l608_l637_DUPLICATE_71be LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l608_l637_DUPLICATE_71be_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6245(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a98d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a98d_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l608_l637_DUPLICATE_71be_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l608_l637_DUPLICATE_71be_return_output;
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
