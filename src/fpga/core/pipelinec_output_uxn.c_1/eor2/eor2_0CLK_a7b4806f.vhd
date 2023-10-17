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
-- BIN_OP_EQ[uxn_opcodes_h_l1169_c6_43aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1169_c1_b723]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1169_c2_2608]
signal n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1169_c2_2608]
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1169_c2_2608]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1169_c2_2608]
signal t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1170_c3_cc50[uxn_opcodes_h_l1170_c3_cc50]
signal printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_66cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1174_c7_4955]
signal n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1174_c7_4955]
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_4955]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1174_c7_4955]
signal t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_3dbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1177_c7_d9f0]
signal t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_596d]
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1182_c7_b810]
signal n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1182_c7_b810]
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_b810]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1182_c7_b810]
signal t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_2373]
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1185_c7_9fac]
signal t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1186_c3_91d9]
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_fa4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_41b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_41c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_2a5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_be98]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_4f58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_72ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1200_c7_428a]
signal n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1200_c7_428a]
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_428a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1201_c3_5389]
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1202_c11_b83d]
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1204_c30_2202]
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5ab7]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_4de0]
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_4de0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_4de0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_4de0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_4de0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1212_c31_ba85]
signal CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_aebf]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_31cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_31cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output);

-- n16_MUX_uxn_opcodes_h_l1169_c2_2608
n16_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1169_c2_2608
tmp16_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- t16_MUX_uxn_opcodes_h_l1169_c2_2608
t16_MUX_uxn_opcodes_h_l1169_c2_2608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond,
t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue,
t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse,
t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

-- printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50
printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50 : entity work.printf_uxn_opcodes_h_l1170_c3_cc50_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1174_c7_4955
n16_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1174_c7_4955
tmp16_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- t16_MUX_uxn_opcodes_h_l1174_c7_4955
t16_MUX_uxn_opcodes_h_l1174_c7_4955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond,
t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue,
t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse,
t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output);

-- n16_MUX_uxn_opcodes_h_l1177_c7_d9f0
n16_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0
tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1177_c7_d9f0
t16_MUX_uxn_opcodes_h_l1177_c7_d9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond,
t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue,
t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse,
t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output);

-- n16_MUX_uxn_opcodes_h_l1182_c7_b810
n16_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1182_c7_b810
tmp16_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- t16_MUX_uxn_opcodes_h_l1182_c7_b810
t16_MUX_uxn_opcodes_h_l1182_c7_b810 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond,
t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue,
t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse,
t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right,
BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output);

-- n16_MUX_uxn_opcodes_h_l1185_c7_9fac
n16_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac
tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- t16_MUX_uxn_opcodes_h_l1185_c7_9fac
t16_MUX_uxn_opcodes_h_l1185_c7_9fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond,
t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue,
t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse,
t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9
BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left,
BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right,
BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1189_c7_41b2
n16_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2
tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1192_c7_2a5f
n16_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f
tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_4f58
n16_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58
tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output);

-- n16_MUX_uxn_opcodes_h_l1200_c7_428a
n16_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1200_c7_428a
tmp16_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389
BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left,
BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right,
BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left,
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right,
BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1204_c30_2202
sp_relative_shift_uxn_opcodes_h_l1204_c30_2202 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins,
sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x,
sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y,
sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85
CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x,
CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152
CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output,
 n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output,
 n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output,
 n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output,
 n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output,
 n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output,
 n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output,
 n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output,
 n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output,
 CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_53e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_418c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_c271 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_3d73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_94b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_5edb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_0d82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_0b51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_36e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_ac8d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cd33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_4de0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_f8e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1219_l1165_DUPLICATE_9d10_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_418c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_418c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_0d82 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_0d82;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_53e3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1171_c3_53e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_5edb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1190_c3_5edb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_36e7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1206_c3_36e7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_94b0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1187_c3_94b0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_0b51 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1198_c3_0b51;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_3d73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1183_c3_3d73;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cd33 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cd33;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_c271 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_c271;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right := to_unsigned(10, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1169_c6_43aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_be98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1177_c11_3dbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_aebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c11_66cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1212_c31_ba85] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output := CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_4de0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_596d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1189_c11_fa4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1185_c11_2373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_left;
     BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output := BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5ab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1192_c11_41c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1204_c30_2202] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_ins;
     sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_x;
     sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output := sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1200_c11_72ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1169_c6_43aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c11_66cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1177_c11_3dbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_596d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1185_c11_2373_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1189_c11_fa4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1192_c11_41c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_be98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1200_c11_72ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5ab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_aebf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1186_l1193_l1178_l1201_DUPLICATE_c200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1177_l1200_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_a29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1209_l1177_l1200_l1174_l1197_l1192_l1189_l1185_l1214_l1182_DUPLICATE_fe86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_ba6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1214_l1182_DUPLICATE_f3a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1209_l1177_l1174_l1197_l1169_l1192_l1189_l1185_l1182_DUPLICATE_d2c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_c7_4de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1204_c30_2202_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1212_c21_f8e3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_f8e3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1212_c31_ba85_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1169_c1_b723] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_31cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1201_c3_5389] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_left;
     BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output := BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1186_c3_91d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_left;
     BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output := BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_31cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1186_c3_91d9_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1201_c3_5389_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_f8e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1179_l1194_DUPLICATE_2152_return_output;
     VAR_printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1169_c1_b723_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_31cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- printf_uxn_opcodes_h_l1170_c3_cc50[uxn_opcodes_h_l1170_c3_cc50] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1170_c3_cc50_uxn_opcodes_h_l1170_c3_cc50_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1202_c11_b83d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_left;
     BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output := BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_4de0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_4de0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- t16_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1207_c21_ac8d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_ac8d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1202_c11_b83d_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1207_c21_ac8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     -- t16_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- n16_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1200_c7_428a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1200_c7_428a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_4f58] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_4f58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1192_c7_2a5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- n16_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1192_c7_2a5f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1189_c7_41b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1189_c7_41b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- n16_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1185_c7_9fac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1185_c7_9fac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_b810] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output := result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- n16_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_b810_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1177_c7_d9f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1177_c7_d9f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1174_c7_4955] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output := result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c7_4955_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1169_c2_2608] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output := result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1219_l1165_DUPLICATE_9d10 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1219_l1165_DUPLICATE_9d10_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1169_c2_2608_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1169_c2_2608_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1219_l1165_DUPLICATE_9d10_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1219_l1165_DUPLICATE_9d10_return_output;
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
