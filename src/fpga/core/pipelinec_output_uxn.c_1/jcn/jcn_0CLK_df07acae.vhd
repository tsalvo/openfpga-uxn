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
-- Submodules: 56
entity jcn_0CLK_df07acae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_df07acae;
architecture arch of jcn_0CLK_df07acae is
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
-- BIN_OP_EQ[uxn_opcodes_h_l688_c6_3e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l688_c1_3be8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l688_c2_5a25]
signal t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l688_c2_5a25]
signal result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l688_c2_5a25]
signal n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l689_c3_d593[uxn_opcodes_h_l689_c3_d593]
signal printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_c1d8]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c7_e4ba]
signal n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c11_7aed]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l696_c7_519e]
signal t8_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l696_c7_519e]
signal result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l696_c7_519e]
signal n8_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_12d5]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l700_c7_4fe8]
signal n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l703_c11_11ca]
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l703_c7_616f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l703_c7_616f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l703_c7_616f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l703_c7_616f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l703_c7_616f]
signal result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l703_c7_616f]
signal n8_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l706_c32_56aa]
signal BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l706_c32_b3c6]
signal BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l706_c32_f80d]
signal MUX_uxn_opcodes_h_l706_c32_f80d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l706_c32_f80d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l706_c32_f80d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l706_c32_f80d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l708_c15_ef1b]
signal BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l708_c30_4a1c]
signal BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l708_c15_deef]
signal MUX_uxn_opcodes_h_l708_c15_deef_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l708_c15_deef_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l708_c15_deef_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l708_c15_deef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_43fb]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_9ef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l710_c7_9ef6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_9ef6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af99( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.pc := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a
BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output);

-- t8_MUX_uxn_opcodes_h_l688_c2_5a25
t8_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- result_pc_MUX_uxn_opcodes_h_l688_c2_5a25
result_pc_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- n8_MUX_uxn_opcodes_h_l688_c2_5a25
n8_MUX_uxn_opcodes_h_l688_c2_5a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond,
n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue,
n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse,
n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

-- printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593
printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593 : entity work.printf_uxn_opcodes_h_l689_c3_d593_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8
BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output);

-- t8_MUX_uxn_opcodes_h_l693_c7_e4ba
t8_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba
result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c7_e4ba
n8_MUX_uxn_opcodes_h_l693_c7_e4ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond,
n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue,
n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse,
n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed
BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output);

-- t8_MUX_uxn_opcodes_h_l696_c7_519e
t8_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l696_c7_519e_cond,
t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e
result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l696_c7_519e
result_pc_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond,
result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- n8_MUX_uxn_opcodes_h_l696_c7_519e
n8_MUX_uxn_opcodes_h_l696_c7_519e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l696_c7_519e_cond,
n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue,
n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse,
n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5
BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8
result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- n8_MUX_uxn_opcodes_h_l700_c7_4fe8
n8_MUX_uxn_opcodes_h_l700_c7_4fe8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond,
n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue,
n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse,
n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca
BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left,
BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right,
BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l703_c7_616f
result_pc_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond,
result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- n8_MUX_uxn_opcodes_h_l703_c7_616f
n8_MUX_uxn_opcodes_h_l703_c7_616f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l703_c7_616f_cond,
n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue,
n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse,
n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa
BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left,
BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right,
BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6
BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left,
BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right,
BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output);

-- MUX_uxn_opcodes_h_l706_c32_f80d
MUX_uxn_opcodes_h_l706_c32_f80d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l706_c32_f80d_cond,
MUX_uxn_opcodes_h_l706_c32_f80d_iftrue,
MUX_uxn_opcodes_h_l706_c32_f80d_iffalse,
MUX_uxn_opcodes_h_l706_c32_f80d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b
BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left,
BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right,
BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c
BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left,
BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right,
BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output);

-- MUX_uxn_opcodes_h_l708_c15_deef
MUX_uxn_opcodes_h_l708_c15_deef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l708_c15_deef_cond,
MUX_uxn_opcodes_h_l708_c15_deef_iftrue,
MUX_uxn_opcodes_h_l708_c15_deef_iffalse,
MUX_uxn_opcodes_h_l708_c15_deef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb
BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output,
 t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output,
 t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output,
 t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output,
 MUX_uxn_opcodes_h_l706_c32_f80d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output,
 MUX_uxn_opcodes_h_l708_c15_deef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8fff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_7849 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b396 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_257c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_4fe8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l706_c32_f80d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l706_c32_f80d_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c15_deef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c15_deef_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c15_deef_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l708_c35_9ecb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l708_c15_deef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l684_l716_DUPLICATE_63aa_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_7849 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_7849;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8fff := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l690_c3_8fff;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b396 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b396;
     VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_257c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_257c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l708_c15_deef_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_c1d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l706_c32_56aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_left;
     BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output := BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_12d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l703_c11_11ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c6_3e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_43fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_4fe8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l708_c15_ef1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c11_7aed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l708_c35_9ecb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l708_c35_9ecb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l706_c32_56aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c6_3e4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_c1d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c11_7aed_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_12d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_11ca_return_output;
     VAR_MUX_uxn_opcodes_h_l708_c15_deef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c15_ef1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_43fb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l708_c35_9ecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_a869_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l696_l688_l700_l693_l703_DUPLICATE_abf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l696_l700_l693_l710_l703_DUPLICATE_f196_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_7003_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l696_l688_l700_l693_l710_DUPLICATE_f315_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_4fe8_return_output;
     -- n8_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output := n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l688_c1_3be8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_9ef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l706_c32_b3c6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_left;
     BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output := BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l708_c30_4a1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l710_c7_9ef6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_9ef6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;

     -- t8_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output := t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l706_c32_f80d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l706_c32_b3c6_return_output;
     VAR_MUX_uxn_opcodes_h_l708_c15_deef_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l708_c30_4a1c_return_output)),16);
     VAR_printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l688_c1_3be8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l710_c7_9ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_t8_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- MUX[uxn_opcodes_h_l706_c32_f80d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l706_c32_f80d_cond <= VAR_MUX_uxn_opcodes_h_l706_c32_f80d_cond;
     MUX_uxn_opcodes_h_l706_c32_f80d_iftrue <= VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iftrue;
     MUX_uxn_opcodes_h_l706_c32_f80d_iffalse <= VAR_MUX_uxn_opcodes_h_l706_c32_f80d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l706_c32_f80d_return_output := MUX_uxn_opcodes_h_l706_c32_f80d_return_output;

     -- MUX[uxn_opcodes_h_l708_c15_deef] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l708_c15_deef_cond <= VAR_MUX_uxn_opcodes_h_l708_c15_deef_cond;
     MUX_uxn_opcodes_h_l708_c15_deef_iftrue <= VAR_MUX_uxn_opcodes_h_l708_c15_deef_iftrue;
     MUX_uxn_opcodes_h_l708_c15_deef_iffalse <= VAR_MUX_uxn_opcodes_h_l708_c15_deef_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l708_c15_deef_return_output := MUX_uxn_opcodes_h_l708_c15_deef_return_output;

     -- t8_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- n8_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- printf_uxn_opcodes_h_l689_c3_d593[uxn_opcodes_h_l689_c3_d593] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l689_c3_d593_uxn_opcodes_h_l689_c3_d593_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := VAR_MUX_uxn_opcodes_h_l706_c32_f80d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue := VAR_MUX_uxn_opcodes_h_l708_c15_deef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_t8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- t8_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output := result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l703_c7_616f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- n8_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output := n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_n8_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_616f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l700_c7_4fe8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_cond;
     result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output := result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_n8_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_4fe8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l696_c7_519e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_cond;
     result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output := result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output;

     -- n8_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l696_c7_519e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_e4ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_e4ba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l688_c2_5a25] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_cond;
     result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iftrue;
     result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output := result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l684_l716_DUPLICATE_63aa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l684_l716_DUPLICATE_63aa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af99(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c2_5a25_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l688_c2_5a25_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l684_l716_DUPLICATE_63aa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l684_l716_DUPLICATE_63aa_return_output;
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
