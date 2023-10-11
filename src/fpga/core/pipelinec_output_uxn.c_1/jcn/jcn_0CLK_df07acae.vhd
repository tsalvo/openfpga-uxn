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
-- BIN_OP_EQ[uxn_opcodes_h_l692_c6_0c8a]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l692_c1_794a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c2_27dc]
signal n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l692_c2_27dc]
signal t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c2_27dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l693_c3_69e1[uxn_opcodes_h_l693_c3_69e1]
signal printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_821c]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l697_c7_2104]
signal n8_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l697_c7_2104]
signal t8_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_2104]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_7495]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_d1c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l704_c11_1141]
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l704_c7_4b87]
signal n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_4b87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_33e6]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_6935]
signal n8_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l707_c7_6935]
signal result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_6935]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_6935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_6935]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_6935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l710_c32_10e2]
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l710_c32_9460]
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l710_c32_32a8]
signal MUX_uxn_opcodes_h_l710_c32_32a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_32a8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_32a8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l710_c32_32a8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l712_c15_2f95]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l712_c30_eafc]
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l712_c15_14bf]
signal MUX_uxn_opcodes_h_l712_c15_14bf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_14bf_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_14bf_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l712_c15_14bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_1b5e]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_ab56]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l714_c7_ab56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_ab56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f87d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a
BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c2_27dc
n8_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- t8_MUX_uxn_opcodes_h_l692_c2_27dc
t8_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l692_c2_27dc
result_pc_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

-- printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1
printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1 : entity work.printf_uxn_opcodes_h_l693_c3_69e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c
BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output);

-- n8_MUX_uxn_opcodes_h_l697_c7_2104
n8_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l697_c7_2104_cond,
n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- t8_MUX_uxn_opcodes_h_l697_c7_2104
t8_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l697_c7_2104_cond,
t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_pc_MUX_uxn_opcodes_h_l697_c7_2104
result_pc_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495
BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output);

-- n8_MUX_uxn_opcodes_h_l700_c7_d1c5
n8_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- t8_MUX_uxn_opcodes_h_l700_c7_d1c5
t8_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5
result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141
BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output);

-- n8_MUX_uxn_opcodes_h_l704_c7_4b87
n8_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_pc_MUX_uxn_opcodes_h_l704_c7_4b87
result_pc_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6
BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_6935
n8_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_6935_cond,
n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- result_pc_MUX_uxn_opcodes_h_l707_c7_6935
result_pc_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond,
result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2
BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left,
BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right,
BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l710_c32_9460
BIN_OP_GT_uxn_opcodes_h_l710_c32_9460 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left,
BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right,
BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output);

-- MUX_uxn_opcodes_h_l710_c32_32a8
MUX_uxn_opcodes_h_l710_c32_32a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l710_c32_32a8_cond,
MUX_uxn_opcodes_h_l710_c32_32a8_iftrue,
MUX_uxn_opcodes_h_l710_c32_32a8_iffalse,
MUX_uxn_opcodes_h_l710_c32_32a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95
BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left,
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right,
BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output);

-- MUX_uxn_opcodes_h_l712_c15_14bf
MUX_uxn_opcodes_h_l712_c15_14bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l712_c15_14bf_cond,
MUX_uxn_opcodes_h_l712_c15_14bf_iftrue,
MUX_uxn_opcodes_h_l712_c15_14bf_iffalse,
MUX_uxn_opcodes_h_l712_c15_14bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output,
 n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output,
 n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output,
 n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output,
 n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output,
 BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output,
 MUX_uxn_opcodes_h_l710_c32_32a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output,
 MUX_uxn_opcodes_h_l712_c15_14bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_4013 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_5784 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_4328 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_f340 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_32a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l710_c32_32a8_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_14bf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_3ca3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l712_c15_14bf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l688_l720_DUPLICATE_953e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_4013 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l694_c3_4013;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_5784 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_5784;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_4328 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l702_c3_4328;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_f340 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_f340;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l692_c6_0c8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l710_c32_10e2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_left;
     BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output := BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_1b5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_7495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_4b87_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_821c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c15_2f95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l712_c35_3ca3] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_3ca3_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_33e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l704_c11_1141] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_left;
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output := BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output := result.pc;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left := VAR_BIN_OP_AND_uxn_opcodes_h_l710_c32_10e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c6_0c8a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_821c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_7495_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_1141_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_33e6_return_output;
     VAR_MUX_uxn_opcodes_h_l712_c15_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c15_2f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1b5e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l712_c35_3ca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_f069_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l697_l692_l700_l707_l704_DUPLICATE_b15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l697_l714_l700_l707_l704_DUPLICATE_ad02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_4718_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l697_l692_l714_l700_l704_DUPLICATE_52c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l704_c7_4b87_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l710_c32_9460] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_left;
     BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output := BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l692_c1_794a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output;

     -- t8_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l712_c30_eafc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_ab56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;

     -- n8_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output := n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_ab56] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l714_c7_ab56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l710_c32_32a8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l710_c32_9460_return_output;
     VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l712_c30_eafc_return_output)),16);
     VAR_printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l692_c1_794a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l714_c7_ab56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_t8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- MUX[uxn_opcodes_h_l712_c15_14bf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l712_c15_14bf_cond <= VAR_MUX_uxn_opcodes_h_l712_c15_14bf_cond;
     MUX_uxn_opcodes_h_l712_c15_14bf_iftrue <= VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iftrue;
     MUX_uxn_opcodes_h_l712_c15_14bf_iffalse <= VAR_MUX_uxn_opcodes_h_l712_c15_14bf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l712_c15_14bf_return_output := MUX_uxn_opcodes_h_l712_c15_14bf_return_output;

     -- t8_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output := t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- printf_uxn_opcodes_h_l693_c3_69e1[uxn_opcodes_h_l693_c3_69e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l693_c3_69e1_uxn_opcodes_h_l693_c3_69e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l710_c32_32a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l710_c32_32a8_cond <= VAR_MUX_uxn_opcodes_h_l710_c32_32a8_cond;
     MUX_uxn_opcodes_h_l710_c32_32a8_iftrue <= VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iftrue;
     MUX_uxn_opcodes_h_l710_c32_32a8_iffalse <= VAR_MUX_uxn_opcodes_h_l710_c32_32a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l710_c32_32a8_return_output := MUX_uxn_opcodes_h_l710_c32_32a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := VAR_MUX_uxn_opcodes_h_l710_c32_32a8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue := VAR_MUX_uxn_opcodes_h_l712_c15_14bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- n8_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- t8_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l707_c7_6935] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_cond;
     result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iftrue;
     result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output := result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_n8_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_6935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_4b87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- n8_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output := n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_4b87_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_d1c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_d1c5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l697_c7_2104] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_cond;
     result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iftrue;
     result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output := result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output;

     -- Submodule level 7
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_2104_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l692_c2_27dc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_cond;
     result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output := result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l688_l720_DUPLICATE_953e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l688_l720_DUPLICATE_953e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f87d(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c2_27dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c2_27dc_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l688_l720_DUPLICATE_953e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l688_l720_DUPLICATE_953e_return_output;
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
