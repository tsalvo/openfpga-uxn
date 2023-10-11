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
-- Submodules: 60
entity equ_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_1c7b7172;
architecture arch of equ_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1249_c6_8250]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1249_c1_5549]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1249_c2_d354]
signal t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c2_d354]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1249_c2_d354]
signal n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1250_c3_7c8b[uxn_opcodes_h_l1250_c3_7c8b]
signal printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1254_c11_aabf]
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1254_c7_b226]
signal t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c7_b226]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1254_c7_b226]
signal n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_c578]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1257_c7_d4f0]
signal n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_236d]
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_589c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1261_c7_589c]
signal n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1264_c11_793e]
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1264_c7_00ca]
signal n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1267_c32_76dd]
signal BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1267_c32_493b]
signal BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1267_c32_27e0]
signal MUX_uxn_opcodes_h_l1267_c32_27e0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1267_c32_27e0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1269_c11_779c]
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c7_5426]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c7_5426]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c7_5426]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1269_c7_5426]
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c7_5426]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1273_c24_b860]
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1273_c24_d61f]
signal MUX_uxn_opcodes_h_l1273_c24_d61f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1273_c24_d61f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_646d]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_721d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_721d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250
BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output);

-- t8_MUX_uxn_opcodes_h_l1249_c2_d354
t8_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354
result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- n8_MUX_uxn_opcodes_h_l1249_c2_d354
n8_MUX_uxn_opcodes_h_l1249_c2_d354 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond,
n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue,
n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse,
n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

-- printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b
printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b : entity work.printf_uxn_opcodes_h_l1250_c3_7c8b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left,
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right,
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output);

-- t8_MUX_uxn_opcodes_h_l1254_c7_b226
t8_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- n8_MUX_uxn_opcodes_h_l1254_c7_b226
n8_MUX_uxn_opcodes_h_l1254_c7_b226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond,
n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue,
n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse,
n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output);

-- t8_MUX_uxn_opcodes_h_l1257_c7_d4f0
t8_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- n8_MUX_uxn_opcodes_h_l1257_c7_d4f0
n8_MUX_uxn_opcodes_h_l1257_c7_d4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond,
n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue,
n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse,
n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right,
BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- n8_MUX_uxn_opcodes_h_l1261_c7_589c
n8_MUX_uxn_opcodes_h_l1261_c7_589c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond,
n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue,
n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse,
n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left,
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right,
BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca
result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- n8_MUX_uxn_opcodes_h_l1264_c7_00ca
n8_MUX_uxn_opcodes_h_l1264_c7_00ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond,
n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue,
n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse,
n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd
BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left,
BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right,
BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b
BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left,
BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right,
BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output);

-- MUX_uxn_opcodes_h_l1267_c32_27e0
MUX_uxn_opcodes_h_l1267_c32_27e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1267_c32_27e0_cond,
MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue,
MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse,
MUX_uxn_opcodes_h_l1267_c32_27e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left,
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right,
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860
BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left,
BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right,
BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output);

-- MUX_uxn_opcodes_h_l1273_c24_d61f
MUX_uxn_opcodes_h_l1273_c24_d61f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1273_c24_d61f_cond,
MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue,
MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse,
MUX_uxn_opcodes_h_l1273_c24_d61f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output,
 t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output,
 t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output,
 t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output,
 MUX_uxn_opcodes_h_l1267_c32_27e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output,
 MUX_uxn_opcodes_h_l1273_c24_d61f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_63a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_f45f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_427c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1262_c3_7ccf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1272_c3_32a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1264_l1269_DUPLICATE_e794_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1280_l1245_DUPLICATE_449a_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_f45f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_f45f;
     VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1262_c3_7ccf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1262_c3_7ccf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1272_c3_32a6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1272_c3_32a6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_63a5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_63a5;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_427c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1259_c3_427c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1273_c24_b860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_left;
     BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output := BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1264_c11_793e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1261_c11_236d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c6_8250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_c578] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_646d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1254_c11_aabf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1267_c32_76dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_left;
     BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output := BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1269_c11_779c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1264_l1269_DUPLICATE_e794 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1264_l1269_DUPLICATE_e794_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1267_c32_76dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c6_8250_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_aabf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_c578_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1261_c11_236d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1264_c11_793e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_779c_return_output;
     VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c24_b860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_646d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1264_l1261_DUPLICATE_ffec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1254_l1275_l1269_l1264_l1261_DUPLICATE_fa8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1261_DUPLICATE_9e5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1275_l1264_l1261_DUPLICATE_4d51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1264_l1269_DUPLICATE_e794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1264_l1269_DUPLICATE_e794_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1254_l1249_l1269_l1264_l1261_DUPLICATE_7ab6_return_output;
     -- n8_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_721d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output;

     -- MUX[uxn_opcodes_h_l1273_c24_d61f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1273_c24_d61f_cond <= VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_cond;
     MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue <= VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iftrue;
     MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse <= VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_return_output := MUX_uxn_opcodes_h_l1273_c24_d61f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1249_c1_5549] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c7_5426] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_721d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c7_5426] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1267_c32_493b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_left;
     BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output := BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1267_c32_493b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue := VAR_MUX_uxn_opcodes_h_l1273_c24_d61f_return_output;
     VAR_printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1249_c1_5549_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_721d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_721d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c7_5426] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c7_5426] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;

     -- t8_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- printf_uxn_opcodes_h_l1250_c3_7c8b[uxn_opcodes_h_l1250_c3_7c8b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1250_c3_7c8b_uxn_opcodes_h_l1250_c3_7c8b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- MUX[uxn_opcodes_h_l1267_c32_27e0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1267_c32_27e0_cond <= VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_cond;
     MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue <= VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iftrue;
     MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse <= VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_return_output := MUX_uxn_opcodes_h_l1267_c32_27e0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1269_c7_5426] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output := result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue := VAR_MUX_uxn_opcodes_h_l1267_c32_27e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_5426_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1264_c7_00ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;

     -- t8_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1264_c7_00ca_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1261_c7_589c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1261_c7_589c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_d4f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_d4f0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c7_b226] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_b226_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c2_d354] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1280_l1245_DUPLICATE_449a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1280_l1245_DUPLICATE_449a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1249_c2_d354_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c2_d354_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1280_l1245_DUPLICATE_449a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1280_l1245_DUPLICATE_449a_return_output;
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
