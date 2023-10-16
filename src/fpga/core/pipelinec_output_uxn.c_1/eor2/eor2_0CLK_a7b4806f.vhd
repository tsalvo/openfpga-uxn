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
-- Submodules: 107
entity eor2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_a7b4806f;
architecture arch of eor2_0CLK_a7b4806f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1169_c6_9b2c]
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1169_c1_5575]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1169_c2_8d00]
signal t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1170_c3_1dfb[uxn_opcodes_h_l1170_c3_1dfb]
signal printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_97b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1174_c7_dbad]
signal t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_9718]
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1177_c7_78c6]
signal t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_da05]
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1182_c7_3170]
signal n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1182_c7_3170]
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_3170]
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1182_c7_3170]
signal t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_3ad4]
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1185_c7_80a3]
signal t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1186_c3_a394]
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_ff88]
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_d8c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_f10a]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_6c13]
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_264f]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_40f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_ad0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_0a36]
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1201_c3_8992]
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1202_c11_e6e9]
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1204_c30_7cb7]
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5889]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_b412]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_b412]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_b412]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_b412]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_b412]
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1212_c31_3fd9]
signal CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_51b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_2058]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_2058]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left,
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right,
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output);

-- n16_MUX_uxn_opcodes_h_l1169_c2_8d00
n16_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00
tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- t16_MUX_uxn_opcodes_h_l1169_c2_8d00
t16_MUX_uxn_opcodes_h_l1169_c2_8d00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond,
t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue,
t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse,
t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

-- printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb
printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb : entity work.printf_uxn_opcodes_h_l1170_c3_1dfb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1174_c7_dbad
n16_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad
tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- t16_MUX_uxn_opcodes_h_l1174_c7_dbad
t16_MUX_uxn_opcodes_h_l1174_c7_dbad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond,
t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue,
t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse,
t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output);

-- n16_MUX_uxn_opcodes_h_l1177_c7_78c6
n16_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6
tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- t16_MUX_uxn_opcodes_h_l1177_c7_78c6
t16_MUX_uxn_opcodes_h_l1177_c7_78c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond,
t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue,
t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse,
t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output);

-- n16_MUX_uxn_opcodes_h_l1182_c7_3170
n16_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1182_c7_3170
tmp16_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- t16_MUX_uxn_opcodes_h_l1182_c7_3170
t16_MUX_uxn_opcodes_h_l1182_c7_3170 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond,
t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue,
t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse,
t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output);

-- n16_MUX_uxn_opcodes_h_l1185_c7_80a3
n16_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3
tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- t16_MUX_uxn_opcodes_h_l1185_c7_80a3
t16_MUX_uxn_opcodes_h_l1185_c7_80a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond,
t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue,
t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse,
t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394
BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left,
BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right,
BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output);

-- n16_MUX_uxn_opcodes_h_l1189_c7_d8c6
n16_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6
tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output);

-- n16_MUX_uxn_opcodes_h_l1192_c7_6c13
n16_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13
tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_40f3
n16_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3
tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output);

-- n16_MUX_uxn_opcodes_h_l1200_c7_0a36
n16_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36
tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992
BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left,
BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right,
BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left,
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right,
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7
sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins,
sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x,
sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y,
sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9
CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x,
CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56
CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output,
 n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output,
 n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output,
 n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output,
 n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output,
 n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output,
 n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output,
 n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output,
 n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output,
 CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_fbbe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_d598 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_1c2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_013f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_1b95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_72bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ac7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_f9ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_ebc2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_6f91_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_722f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_b412_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_244d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1165_l1219_DUPLICATE_4ec8_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_722f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_722f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_fbbe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_fbbe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_013f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_013f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_1c2c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_1c2c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_1b95 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_1b95;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_ebc2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_ebc2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ac7e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_ac7e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_f9ee := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_f9ee;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_72bb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_72bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_d598 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_d598;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right := to_unsigned(10, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1212_c31_3fd9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output := CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1169_c6_9b2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_da05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_f10a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5889] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_264f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1204_c30_7cb7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_ins;
     sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_x;
     sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output := sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_9718] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_left;
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output := BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_97b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_3ad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_b412_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_ff88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_ad0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_51b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_9b2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_97b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_9718_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_da05_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_3ad4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_ff88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_f10a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_264f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_ad0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_51b5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1178_l1193_l1186_l1201_DUPLICATE_cb10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1177_l1200_DUPLICATE_d28e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1174_l1197_l1192_l1189_l1185_l1214_l1182_l1209_l1177_l1200_DUPLICATE_43c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_1e5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_l1209_l1177_DUPLICATE_1e06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1174_l1197_l1169_l1192_l1189_l1185_l1182_l1209_l1177_DUPLICATE_21b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_b412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_7cb7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1201_c3_8992] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_left;
     BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output := BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_2058] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1212_c21_244d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_244d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_3fd9_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1169_c1_5575] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1186_c3_a394] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_left;
     BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output := BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_2058] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_a394_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_8992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_244d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1194_l1179_DUPLICATE_be56_return_output;
     VAR_printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_5575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_2058_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_2058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- n16_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;

     -- printf_uxn_opcodes_h_l1170_c3_1dfb[uxn_opcodes_h_l1170_c3_1dfb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1170_c3_1dfb_uxn_opcodes_h_l1170_c3_1dfb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1202_c11_e6e9] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_left;
     BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output := BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_b412] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output := result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;

     -- t16_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_b412_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1207_c21_6f91] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_6f91_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_e6e9_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_6f91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_0a36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- n16_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_0a36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_40f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- n16_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_40f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     -- t16_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_6c13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output := result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- n16_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_6c13_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_d8c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- n16_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_d8c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_80a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_80a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_3170] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output := result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- n16_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_3170_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- n16_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_78c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_78c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1174_c7_dbad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_dbad_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1169_c2_8d00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output := result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1165_l1219_DUPLICATE_4ec8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1165_l1219_DUPLICATE_4ec8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_8d00_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1165_l1219_DUPLICATE_4ec8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1165_l1219_DUPLICATE_4ec8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
