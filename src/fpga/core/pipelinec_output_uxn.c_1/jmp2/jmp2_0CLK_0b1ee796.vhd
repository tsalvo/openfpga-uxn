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
-- BIN_OP_EQ[uxn_opcodes_h_l612_c6_fc32]
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_9dab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_a475]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l612_c2_a475]
signal t16_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l613_c3_c0de[uxn_opcodes_h_l613_c3_c0de]
signal printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l617_c11_1388]
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_6515]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l617_c7_6515]
signal t16_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l620_c11_646a]
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_4a86]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_4a86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_4a86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l620_c7_4a86]
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_4a86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l620_c7_4a86]
signal t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l622_c3_ce9d]
signal CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l624_c11_38bb]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_3f97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_3f97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_3f97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l624_c7_3f97]
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_3f97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c7_3f97]
signal t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l625_c3_3448]
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l627_c30_c949]
signal sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l631_c11_99f1]
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_073f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_073f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_073f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a132( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32
BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right,
BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- t16_MUX_uxn_opcodes_h_l612_c2_a475
t16_MUX_uxn_opcodes_h_l612_c2_a475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l612_c2_a475_cond,
t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue,
t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse,
t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

-- printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de
printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de : entity work.printf_uxn_opcodes_h_l613_c3_c0de_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right,
BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515
result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- t16_MUX_uxn_opcodes_h_l617_c7_6515
t16_MUX_uxn_opcodes_h_l617_c7_6515 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l617_c7_6515_cond,
t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue,
t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse,
t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a
BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right,
BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86
result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- t16_MUX_uxn_opcodes_h_l620_c7_4a86
t16_MUX_uxn_opcodes_h_l620_c7_4a86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond,
t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue,
t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse,
t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output);

-- CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d
CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x,
CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb
BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97
result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c7_3f97
t16_MUX_uxn_opcodes_h_l624_c7_3f97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond,
t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue,
t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse,
t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l625_c3_3448
BIN_OP_OR_uxn_opcodes_h_l625_c3_3448 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left,
BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right,
BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output);

-- sp_relative_shift_uxn_opcodes_h_l627_c30_c949
sp_relative_shift_uxn_opcodes_h_l627_c30_c949 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins,
sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x,
sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y,
sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1
BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right,
BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output,
 CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output,
 sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_d195 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_20d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_6515_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l621_DUPLICATE_c897_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l608_l637_DUPLICATE_efb5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_20d7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l618_c3_20d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_d195 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l614_c3_d195;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l620_c11_646a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_left;
     BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output := BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l612_c6_fc32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_left;
     BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output := BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_6515_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l631_c11_99f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l627_c30_c949] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_ins;
     sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_x;
     sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y <= VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output := sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l617_c11_1388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_left;
     BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output := BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c11_38bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l621_DUPLICATE_c897 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l621_DUPLICATE_c897_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l612_c6_fc32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l617_c11_1388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l620_c11_646a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c11_38bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l631_c11_99f1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l621_DUPLICATE_c897_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l625_l621_DUPLICATE_c897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_8494_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l620_l612_l624_l617_DUPLICATE_45ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l620_l624_l617_l631_DUPLICATE_9453_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_035d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l620_l612_l617_l631_DUPLICATE_a8ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l627_c30_c949_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l625_c3_3448] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_left;
     BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output := BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l631_c7_073f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l631_c7_073f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l622_c3_ce9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output := CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l631_c7_073f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l612_c1_9dab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l625_c3_3448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l622_c3_ce9d_return_output;
     VAR_printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l612_c1_9dab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l631_c7_073f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l631_c7_073f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l631_c7_073f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     -- printf_uxn_opcodes_h_l613_c3_c0de[uxn_opcodes_h_l613_c3_c0de] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l613_c3_c0de_uxn_opcodes_h_l613_c3_c0de_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- t16_MUX[uxn_opcodes_h_l624_c7_3f97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_cond;
     t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output := t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse := VAR_t16_MUX_uxn_opcodes_h_l624_c7_3f97_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- t16_MUX[uxn_opcodes_h_l620_c7_4a86] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_cond;
     t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iftrue;
     t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output := t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse := VAR_t16_MUX_uxn_opcodes_h_l620_c7_4a86_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output := result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- t16_MUX[uxn_opcodes_h_l617_c7_6515] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l617_c7_6515_cond <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_cond;
     t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iftrue;
     t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output := t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse := VAR_t16_MUX_uxn_opcodes_h_l617_c7_6515_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- t16_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output := t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l612_c2_a475] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l612_c2_a475_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l608_l637_DUPLICATE_efb5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l608_l637_DUPLICATE_efb5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a132(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l612_c2_a475_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l612_c2_a475_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l608_l637_DUPLICATE_efb5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l608_l637_DUPLICATE_efb5_return_output;
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
