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
-- Submodules: 45
entity jcn_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_85d5529e;
architecture arch of jcn_0CLK_85d5529e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l644_c6_153a]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_e8dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l644_c2_b67e]
signal n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l644_c2_b67e]
signal t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_b67e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l645_c3_3f99[uxn_opcodes_h_l645_c3_3f99]
signal printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l649_c11_6339]
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l649_c7_0d40]
signal n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l649_c7_0d40]
signal t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_0d40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l652_c11_88b9]
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l652_c7_64d9]
signal n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l652_c7_64d9]
signal t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_64d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l652_c7_64d9]
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_64d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_64d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_64d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_e0f3]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l655_c7_135a]
signal n8_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_135a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l655_c7_135a]
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_135a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_135a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_135a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l658_c30_ef14]
signal sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c22_bac2]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_0107]
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l660_c22_1179]
signal MUX_uxn_opcodes_h_l660_c22_1179_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_1179_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_1179_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_1179_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l662_c11_0029]
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_e9e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_e9e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_e9e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5d97( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a
BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output);

-- n8_MUX_uxn_opcodes_h_l644_c2_b67e
n8_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- t8_MUX_uxn_opcodes_h_l644_c2_b67e
t8_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e
result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

-- printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99
printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99 : entity work.printf_uxn_opcodes_h_l645_c3_3f99_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339
BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output);

-- n8_MUX_uxn_opcodes_h_l649_c7_0d40
n8_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- t8_MUX_uxn_opcodes_h_l649_c7_0d40
t8_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40
result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9
BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output);

-- n8_MUX_uxn_opcodes_h_l652_c7_64d9
n8_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- t8_MUX_uxn_opcodes_h_l652_c7_64d9
t8_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9
result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3
BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output);

-- n8_MUX_uxn_opcodes_h_l655_c7_135a
n8_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l655_c7_135a_cond,
n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a
result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l658_c30_ef14
sp_relative_shift_uxn_opcodes_h_l658_c30_ef14 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins,
sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x,
sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y,
sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2
BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output);

-- MUX_uxn_opcodes_h_l660_c22_1179
MUX_uxn_opcodes_h_l660_c22_1179 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l660_c22_1179_cond,
MUX_uxn_opcodes_h_l660_c22_1179_iftrue,
MUX_uxn_opcodes_h_l660_c22_1179_iffalse,
MUX_uxn_opcodes_h_l660_c22_1179_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029
BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output,
 n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output,
 n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output,
 n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output,
 n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output,
 sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output,
 MUX_uxn_opcodes_h_l660_c22_1179_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_c8c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_1107 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_0d40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_1179_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_1179_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_1179_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_3bd0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_1179_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l640_l668_DUPLICATE_b637_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_1107 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_1107;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_c8c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_c8c5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l660_c22_1179_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l660_c22_bac2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l649_c11_6339] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_left;
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output := BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_0d40_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l660_c42_3bd0] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_3bd0_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_e0f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c6_153a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l658_c30_ef14] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_ins;
     sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_x;
     sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output := sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l662_c11_0029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_left;
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output := BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l652_c11_88b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_153a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_6339_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_88b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_e0f3_return_output;
     VAR_MUX_uxn_opcodes_h_l660_c22_1179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_bac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_0029_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_3bd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_acd5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l652_l644_l655_l649_DUPLICATE_08f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l652_l655_l649_l662_DUPLICATE_97e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_ba15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l652_l644_l649_l662_DUPLICATE_3f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_ef14_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_e8dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_0107] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_left;
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output := BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_e9e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- n8_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output := n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_e9e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_e9e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l660_c22_1179_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_0107_return_output)),16);
     VAR_printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_e8dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e9e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_t8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- MUX[uxn_opcodes_h_l660_c22_1179] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l660_c22_1179_cond <= VAR_MUX_uxn_opcodes_h_l660_c22_1179_cond;
     MUX_uxn_opcodes_h_l660_c22_1179_iftrue <= VAR_MUX_uxn_opcodes_h_l660_c22_1179_iftrue;
     MUX_uxn_opcodes_h_l660_c22_1179_iffalse <= VAR_MUX_uxn_opcodes_h_l660_c22_1179_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l660_c22_1179_return_output := MUX_uxn_opcodes_h_l660_c22_1179_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- printf_uxn_opcodes_h_l645_c3_3f99[uxn_opcodes_h_l645_c3_3f99] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l645_c3_3f99_uxn_opcodes_h_l645_c3_3f99_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- t8_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue := VAR_MUX_uxn_opcodes_h_l660_c22_1179_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_n8_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     -- n8_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l655_c7_135a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output := result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_135a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l652_c7_64d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;

     -- n8_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_64d9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l649_c7_0d40] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_cond;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output := result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_0d40_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l644_c2_b67e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output := result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l640_l668_DUPLICATE_b637 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l640_l668_DUPLICATE_b637_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5d97(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_b67e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_b67e_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l640_l668_DUPLICATE_b637_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l640_l668_DUPLICATE_b637_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
