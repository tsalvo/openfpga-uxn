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
-- BIN_OP_EQ[uxn_opcodes_h_l1174_c6_1b3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1174_c1_3855]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1174_c2_da4a]
signal n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1175_c3_2547[uxn_opcodes_h_l1175_c3_2547]
signal printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_f78a]
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1179_c7_1d1b]
signal n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_013a]
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1182_c7_adaf]
signal n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1187_c11_ae07]
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1187_c7_5991]
signal t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1187_c7_5991]
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1187_c7_5991]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1187_c7_5991]
signal n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1190_c11_0e66]
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1190_c7_f21f]
signal n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1191_c3_334e]
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_c5e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1194_c7_e20b]
signal n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_3a6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c7_0b2e]
signal n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_8fbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1202_c7_141f]
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_141f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1202_c7_141f]
signal n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_f6e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1205_c7_734a]
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_734a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1205_c7_734a]
signal n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1206_c3_8ebc]
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1207_c11_9e32]
signal BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1209_c30_de5d]
signal sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_9a87]
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_a4fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_a4fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_a4fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_a4fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_a4fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1217_c31_0732]
signal CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_44fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_0df2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_0df2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output);

-- t16_MUX_uxn_opcodes_h_l1174_c2_da4a
t16_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a
tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- n16_MUX_uxn_opcodes_h_l1174_c2_da4a
n16_MUX_uxn_opcodes_h_l1174_c2_da4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond,
n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue,
n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse,
n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

-- printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547
printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547 : entity work.printf_uxn_opcodes_h_l1175_c3_2547_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right,
BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output);

-- t16_MUX_uxn_opcodes_h_l1179_c7_1d1b
t16_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b
tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- n16_MUX_uxn_opcodes_h_l1179_c7_1d1b
n16_MUX_uxn_opcodes_h_l1179_c7_1d1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond,
n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue,
n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse,
n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output);

-- t16_MUX_uxn_opcodes_h_l1182_c7_adaf
t16_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf
tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- n16_MUX_uxn_opcodes_h_l1182_c7_adaf
n16_MUX_uxn_opcodes_h_l1182_c7_adaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond,
n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue,
n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse,
n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left,
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right,
BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output);

-- t16_MUX_uxn_opcodes_h_l1187_c7_5991
t16_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1187_c7_5991
tmp16_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991
result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- n16_MUX_uxn_opcodes_h_l1187_c7_5991
n16_MUX_uxn_opcodes_h_l1187_c7_5991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond,
n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue,
n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse,
n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left,
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right,
BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output);

-- t16_MUX_uxn_opcodes_h_l1190_c7_f21f
t16_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f
tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f
result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- n16_MUX_uxn_opcodes_h_l1190_c7_f21f
n16_MUX_uxn_opcodes_h_l1190_c7_f21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond,
n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue,
n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse,
n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e
BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left,
BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right,
BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b
tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b
result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- n16_MUX_uxn_opcodes_h_l1194_c7_e20b
n16_MUX_uxn_opcodes_h_l1194_c7_e20b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond,
n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue,
n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse,
n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e
tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c7_0b2e
n16_MUX_uxn_opcodes_h_l1197_c7_0b2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond,
n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1202_c7_141f
tmp16_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f
result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- n16_MUX_uxn_opcodes_h_l1202_c7_141f
n16_MUX_uxn_opcodes_h_l1202_c7_141f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond,
n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue,
n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse,
n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1205_c7_734a
tmp16_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- n16_MUX_uxn_opcodes_h_l1205_c7_734a
n16_MUX_uxn_opcodes_h_l1205_c7_734a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond,
n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue,
n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse,
n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc
BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left,
BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right,
BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32
BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left,
BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right,
BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d
sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins,
sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x,
sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y,
sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right,
BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1217_c31_0732
CONST_SR_8_uxn_opcodes_h_l1217_c31_0732 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x,
CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output,
 t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output,
 t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output,
 t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output,
 t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output,
 t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output,
 sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output,
 CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_77e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_df73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_2487 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_ea4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_d7dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_8840 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_eda5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_d82e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d5ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_ccab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_85fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1214_c7_a4fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1217_c21_9626_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1224_l1170_DUPLICATE_ea10_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_77e2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1176_c3_77e2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_85fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_85fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_df73 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1180_c3_df73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_d82e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1203_c3_d82e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d5ae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_d5ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_8840 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1195_c3_8840;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_ea4d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1188_c3_ea4d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_2487 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1185_c3_2487;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_d7dd := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1192_c3_d7dd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_eda5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1200_c3_eda5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y := resize(to_signed(-2, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1209_c30_de5d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_ins;
     sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_x;
     sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output := sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1179_c11_f78a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1217_c31_0732] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output := CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_f6e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1202_c11_8fbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1187_c11_ae07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1190_c11_0e66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_013a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c11_3a6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1219_c11_44fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1174_c6_1b3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1214_c7_a4fd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1194_c11_c5e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1214_c11_9a87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1174_c6_1b3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1179_c11_f78a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_013a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1187_c11_ae07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1190_c11_0e66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1194_c11_c5e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c11_3a6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1202_c11_8fbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_f6e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1214_c11_9a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1219_c11_44fa_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1191_l1206_l1183_l1198_DUPLICATE_d5cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1174_l1194_l1205_l1197_l1202_DUPLICATE_ebeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1194_l1205_l1197_l1202_DUPLICATE_8a41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_aa76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1219_l1214_l1174_l1194_l1197_l1202_DUPLICATE_0ca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1187_l1182_l1179_l1190_l1214_l1174_l1194_l1197_l1202_DUPLICATE_ef67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1209_c30_de5d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1174_c1_3855] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1206_c3_8ebc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_left;
     BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output := BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1219_c7_0df2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1217_c21_9626] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1217_c21_9626_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1217_c31_0732_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1191_c3_334e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_left;
     BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output := BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1219_c7_0df2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1191_c3_334e_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1206_c3_8ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1217_c21_9626_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1184_l1199_DUPLICATE_25e9_return_output;
     VAR_printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1174_c1_3855_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1219_c7_0df2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;

     -- printf_uxn_opcodes_h_l1175_c3_2547[uxn_opcodes_h_l1175_c3_2547] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1175_c3_2547_uxn_opcodes_h_l1175_c3_2547_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_XOR[uxn_opcodes_h_l1207_c11_9e32] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_left;
     BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output := BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output;

     -- n16_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1214_c7_a4fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1214_c7_a4fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     -- t16_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1212_c21_ccab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_ccab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1207_c11_9e32_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1212_c21_ccab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1205_c7_734a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_734a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1202_c7_141f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1202_c7_141f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c7_0b2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- n16_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c7_0b2e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1194_c7_e20b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1194_c7_e20b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1190_c7_f21f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1190_c7_f21f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1187_c7_5991] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output := result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1187_c7_5991_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1182_c7_adaf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1182_c7_adaf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1179_c7_1d1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1179_c7_1d1b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1174_c2_da4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1224_l1170_DUPLICATE_ea10 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1224_l1170_DUPLICATE_ea10_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1174_c2_da4a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1224_l1170_DUPLICATE_ea10_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1224_l1170_DUPLICATE_ea10_return_output;
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
