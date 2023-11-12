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
-- BIN_OP_EQ[uxn_opcodes_h_l644_c6_9ef3]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_b0de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l644_c2_f929]
signal n8_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l644_c2_f929]
signal t8_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_f929]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l645_c3_9e3a[uxn_opcodes_h_l645_c3_9e3a]
signal printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l649_c11_82e8]
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l649_c7_4b97]
signal n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l649_c7_4b97]
signal t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_4b97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l652_c11_ddc8]
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l652_c7_ef94]
signal n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l652_c7_ef94]
signal t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l652_c7_ef94]
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_ef94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_ef94]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_ef94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_ef94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_b93b]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_2ed1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l658_c30_35eb]
signal sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c22_7a32]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_7a9f]
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l660_c22_ae49]
signal MUX_uxn_opcodes_h_l660_c22_ae49_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_ae49_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_ae49_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l660_c22_ae49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l662_c11_1ecc]
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_e537]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_e537]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_e537]
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3
BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output);

-- n8_MUX_uxn_opcodes_h_l644_c2_f929
n8_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l644_c2_f929_cond,
n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- t8_MUX_uxn_opcodes_h_l644_c2_f929
t8_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l644_c2_f929_cond,
t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929
result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

-- printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a
printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a : entity work.printf_uxn_opcodes_h_l645_c3_9e3a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8
BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output);

-- n8_MUX_uxn_opcodes_h_l649_c7_4b97
n8_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- t8_MUX_uxn_opcodes_h_l649_c7_4b97
t8_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97
result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8
BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output);

-- n8_MUX_uxn_opcodes_h_l652_c7_ef94
n8_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- t8_MUX_uxn_opcodes_h_l652_c7_ef94
t8_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94
result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b
BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output);

-- n8_MUX_uxn_opcodes_h_l655_c7_2ed1
n8_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1
result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l658_c30_35eb
sp_relative_shift_uxn_opcodes_h_l658_c30_35eb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins,
sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x,
sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y,
sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right,
BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output);

-- MUX_uxn_opcodes_h_l660_c22_ae49
MUX_uxn_opcodes_h_l660_c22_ae49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l660_c22_ae49_cond,
MUX_uxn_opcodes_h_l660_c22_ae49_iftrue,
MUX_uxn_opcodes_h_l660_c22_ae49_iffalse,
MUX_uxn_opcodes_h_l660_c22_ae49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right,
BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output,
 n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output,
 n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output,
 n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output,
 n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output,
 sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output,
 MUX_uxn_opcodes_h_l660_c22_ae49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_0175 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_8fe3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_4b97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_ae49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_1065_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l660_c22_ae49_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l668_l640_DUPLICATE_127c_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y := resize(to_signed(-2, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_0175 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_0175;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_8fe3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_8fe3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l660_c42_1065] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_1065_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_4b97_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l662_c11_1ecc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_left;
     BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output := BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_b93b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l652_c11_ddc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l649_c11_82e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l658_c30_35eb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_ins;
     sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_x;
     sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output := sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c22_7a32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c6_9ef3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_9ef3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_82e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_ddc8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_b93b_return_output;
     VAR_MUX_uxn_opcodes_h_l660_c22_ae49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c22_7a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l662_c11_1ecc_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l660_c42_1065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_4035_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l644_l655_l649_l652_DUPLICATE_708f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l649_l662_l652_DUPLICATE_d215_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4ac1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l649_l662_l652_DUPLICATE_4fba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l658_c30_35eb_return_output;
     -- t8_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l662_c7_e537] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l660_c37_7a9f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_b0de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- n8_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l662_c7_e537] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l662_c7_e537] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l660_c37_7a9f_return_output)),16);
     VAR_printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_b0de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l662_c7_e537_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l662_c7_e537_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l662_c7_e537_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_t8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- t8_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- printf_uxn_opcodes_h_l645_c3_9e3a[uxn_opcodes_h_l645_c3_9e3a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l645_c3_9e3a_uxn_opcodes_h_l645_c3_9e3a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- n8_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- MUX[uxn_opcodes_h_l660_c22_ae49] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l660_c22_ae49_cond <= VAR_MUX_uxn_opcodes_h_l660_c22_ae49_cond;
     MUX_uxn_opcodes_h_l660_c22_ae49_iftrue <= VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iftrue;
     MUX_uxn_opcodes_h_l660_c22_ae49_iffalse <= VAR_MUX_uxn_opcodes_h_l660_c22_ae49_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l660_c22_ae49_return_output := MUX_uxn_opcodes_h_l660_c22_ae49_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue := VAR_MUX_uxn_opcodes_h_l660_c22_ae49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_n8_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_t8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l655_c7_2ed1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output := result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;

     -- t8_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output := t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- n8_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_n8_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l655_c7_2ed1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l644_c2_f929_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l652_c7_ef94] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_cond;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output := result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;

     -- n8_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output := n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l644_c2_f929_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l652_c7_ef94_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l649_c7_4b97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output := result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_4b97_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l644_c2_f929] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_cond;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output := result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l668_l640_DUPLICATE_127c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l668_l640_DUPLICATE_127c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6245(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_f929_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_f929_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l668_l640_DUPLICATE_127c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l668_l640_DUPLICATE_127c_return_output;
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
