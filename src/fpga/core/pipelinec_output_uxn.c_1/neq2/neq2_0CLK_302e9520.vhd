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
-- Submodules: 66
entity neq2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_302e9520;
architecture arch of neq2_0CLK_302e9520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_7a16]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_66fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_c80e]
signal n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1221_c3_e926[uxn_opcodes_h_l1221_c3_e926]
signal printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_759e]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_5590]
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1225_c7_5590]
signal t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_5590]
signal n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_a6c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c7_e55e]
signal n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_0ea3]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_ae6b]
signal n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1234_c3_59c4]
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_ef01]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_a546]
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1237_c7_a546]
signal n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_21e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_601a]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_601a]
signal n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_b34f]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1244_c30_fa0c]
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_abca]
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1247_c21_45bf]
signal MUX_uxn_opcodes_h_l1247_c21_45bf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_45bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_ce57]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_1ff4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_1ff4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_1ff4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_c80e
t16_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_c80e
n16_MUX_uxn_opcodes_h_l1220_c2_c80e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

-- printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926
printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926 : entity work.printf_uxn_opcodes_h_l1221_c3_e926_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- t16_MUX_uxn_opcodes_h_l1225_c7_5590
t16_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_5590
n16_MUX_uxn_opcodes_h_l1225_c7_5590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c7_e55e
t16_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c7_e55e
n16_MUX_uxn_opcodes_h_l1228_c7_e55e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond,
n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_ae6b
t16_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_ae6b
n16_MUX_uxn_opcodes_h_l1233_c7_ae6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4
BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- n16_MUX_uxn_opcodes_h_l1237_c7_a546
n16_MUX_uxn_opcodes_h_l1237_c7_a546 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond,
n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue,
n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse,
n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_601a
n16_MUX_uxn_opcodes_h_l1241_c7_601a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f
BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c
sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins,
sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x,
sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y,
sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output);

-- MUX_uxn_opcodes_h_l1247_c21_45bf
MUX_uxn_opcodes_h_l1247_c21_45bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1247_c21_45bf_cond,
MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue,
MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse,
MUX_uxn_opcodes_h_l1247_c21_45bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77
CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output,
 MUX_uxn_opcodes_h_l1247_c21_45bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_d935 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_0ba4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_fa91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_053b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_0582 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_1ad5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1255_l1216_DUPLICATE_b294_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_d935 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_d935;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_053b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_053b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_0582 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_0582;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_fa91 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_fa91;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_0ba4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_0ba4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_759e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_1ad5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_1ad5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_a6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_ce57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_7a16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_21e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_0ea3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_ef01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1244_c30_fa0c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_ins;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_x;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output := sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_7a16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_759e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a6c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_0ea3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_ef01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_21e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_ce57_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1242_l1238_l1234_DUPLICATE_c8bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_008a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_370a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_2a91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_e65a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_1ad5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_1ad5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_19f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_fa0c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_1ff4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_1ff4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_66fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_b34f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1234_c3_59c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_left;
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output := BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_1ff4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_59c4_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_b34f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1230_l1239_DUPLICATE_3f77_return_output;
     VAR_printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_66fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_1ff4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_abca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- printf_uxn_opcodes_h_l1221_c3_e926[uxn_opcodes_h_l1221_c3_e926] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1221_c3_e926_uxn_opcodes_h_l1221_c3_e926_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_abca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- MUX[uxn_opcodes_h_l1247_c21_45bf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1247_c21_45bf_cond <= VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_cond;
     MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue <= VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iftrue;
     MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse <= VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_return_output := MUX_uxn_opcodes_h_l1247_c21_45bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue := VAR_MUX_uxn_opcodes_h_l1247_c21_45bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_601a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_601a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     -- n16_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_a546] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output := result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_a546_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_ae6b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- n16_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_ae6b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_e55e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_e55e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_5590] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output := result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_5590_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_c80e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1255_l1216_DUPLICATE_b294 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1255_l1216_DUPLICATE_b294_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_c80e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1255_l1216_DUPLICATE_b294_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1255_l1216_DUPLICATE_b294_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
