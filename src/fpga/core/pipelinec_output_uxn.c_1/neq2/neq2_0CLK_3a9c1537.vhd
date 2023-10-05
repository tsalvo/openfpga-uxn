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
entity neq2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_3a9c1537;
architecture arch of neq2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1276_c6_c38f]
signal BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1276_c1_2bef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1276_c2_d416]
signal n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1276_c2_d416]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1276_c2_d416]
signal t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1277_c3_8c77[uxn_opcodes_h_l1277_c3_8c77]
signal printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_0454]
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1282_c7_25ae]
signal t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_9135]
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1285_c7_f55e]
signal t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_6f29]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_1490]
signal n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_1490]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_1490]
signal t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_199f]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_05af]
signal n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_05af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_05af]
signal t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1294_c3_fac5]
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_9f15]
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1297_c7_1328]
signal n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_1328]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_fcb2]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_fcd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1305_c11_8e68]
signal BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1305_c7_3442]
signal n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1305_c7_3442]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_c57f]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_1a6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1309_c3_a899]
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1312_c32_20f1]
signal BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1312_c32_fa87]
signal BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c32_0d50]
signal MUX_uxn_opcodes_h_l1312_c32_0d50_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c32_0d50_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_8ff4]
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_5885]
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_5885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_5885]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_5885]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_5885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1318_c24_191a]
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1318_c24_c6ff]
signal MUX_uxn_opcodes_h_l1318_c24_c6ff_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1320_c11_e35a]
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1320_c7_a50f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1320_c7_a50f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f
BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left,
BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right,
BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output);

-- n16_MUX_uxn_opcodes_h_l1276_c2_d416
n16_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416
result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416
result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416
result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416
result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416
result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416
result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- t16_MUX_uxn_opcodes_h_l1276_c2_d416
t16_MUX_uxn_opcodes_h_l1276_c2_d416 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond,
t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue,
t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse,
t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

-- printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77
printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77 : entity work.printf_uxn_opcodes_h_l1277_c3_8c77_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output);

-- n16_MUX_uxn_opcodes_h_l1282_c7_25ae
n16_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae
result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae
result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- t16_MUX_uxn_opcodes_h_l1282_c7_25ae
t16_MUX_uxn_opcodes_h_l1282_c7_25ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond,
t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue,
t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse,
t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output);

-- n16_MUX_uxn_opcodes_h_l1285_c7_f55e
n16_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e
result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e
result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- t16_MUX_uxn_opcodes_h_l1285_c7_f55e
t16_MUX_uxn_opcodes_h_l1285_c7_f55e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond,
t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue,
t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse,
t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_1490
n16_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490
result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490
result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_1490
t16_MUX_uxn_opcodes_h_l1290_c7_1490 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_05af
n16_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af
result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_05af
t16_MUX_uxn_opcodes_h_l1293_c7_05af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5
BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output);

-- n16_MUX_uxn_opcodes_h_l1297_c7_1328
n16_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c7_fcd2
n16_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68
BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left,
BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right,
BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output);

-- n16_MUX_uxn_opcodes_h_l1305_c7_3442
n16_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442
result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442
result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442
result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442
result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442
result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442
result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_1a6b
n16_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899
BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1
BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left,
BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right,
BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87
BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left,
BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right,
BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output);

-- MUX_uxn_opcodes_h_l1312_c32_0d50
MUX_uxn_opcodes_h_l1312_c32_0d50 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c32_0d50_cond,
MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue,
MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse,
MUX_uxn_opcodes_h_l1312_c32_0d50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right,
BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a
BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left,
BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right,
BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output);

-- MUX_uxn_opcodes_h_l1318_c24_c6ff
MUX_uxn_opcodes_h_l1318_c24_c6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1318_c24_c6ff_cond,
MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue,
MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse,
MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left,
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right,
BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output,
 n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output,
 n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output,
 n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output,
 n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output,
 n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output,
 MUX_uxn_opcodes_h_l1312_c32_0d50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output,
 MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_5d75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_331e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_a14e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_ed29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_a387 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_8d21 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_6d4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1306_c3_c273 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_1e36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1314_DUPLICATE_be43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1325_l1272_DUPLICATE_b417_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_8d21 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_8d21;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_331e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_331e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_ed29 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_ed29;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_6d4a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1303_c3_6d4a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_a387 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1295_c3_a387;
     VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_1e36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_1e36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_a14e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_a14e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1306_c3_c273 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1306_c3_c273;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_5d75 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_5d75;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_9f15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_9135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_left;
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output := BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_0454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_left;
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output := BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c11_fcb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1318_c24_191a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1305_c11_8e68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1314_DUPLICATE_be43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1314_DUPLICATE_be43_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_c57f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_6f29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1276_c6_c38f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1320_c11_e35a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1314_c11_8ff4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1312_c32_20f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_left;
     BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output := BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_199f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1312_c32_20f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1276_c6_c38f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_0454_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_9135_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_6f29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_199f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_9f15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c11_fcb2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1305_c11_8e68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_c57f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1314_c11_8ff4_return_output;
     VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1318_c24_191a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1320_c11_e35a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1294_l1301_l1309_l1286_DUPLICATE_a73a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1285_DUPLICATE_bb32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1320_l1290_l1314_l1285_DUPLICATE_f868_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_99fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1300_l1297_l1293_l1290_l1285_DUPLICATE_eefd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1320_l1290_l1285_DUPLICATE_4b0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1314_DUPLICATE_be43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1314_DUPLICATE_be43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1308_l1282_l1305_l1276_l1300_l1297_l1293_l1290_l1314_l1285_DUPLICATE_85cd_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1312_c32_fa87] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_left;
     BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output := BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1276_c1_2bef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1320_c7_a50f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1314_c7_5885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1314_c7_5885] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1309_c3_a899] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_left;
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output := BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output;

     -- MUX[uxn_opcodes_h_l1318_c24_c6ff] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1318_c24_c6ff_cond <= VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_cond;
     MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue <= VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iftrue;
     MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse <= VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output := MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1320_c7_a50f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1294_c3_fac5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_left;
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output := BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1312_c32_fa87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_fac5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_a899_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1302_l1287_DUPLICATE_5376_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue := VAR_MUX_uxn_opcodes_h_l1318_c24_c6ff_return_output;
     VAR_printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1276_c1_2bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1320_c7_a50f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;
     -- t16_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1314_c7_5885] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output := result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;

     -- printf_uxn_opcodes_h_l1277_c3_8c77[uxn_opcodes_h_l1277_c3_8c77] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1277_c3_8c77_uxn_opcodes_h_l1277_c3_8c77_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1314_c7_5885] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- MUX[uxn_opcodes_h_l1312_c32_0d50] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c32_0d50_cond <= VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_cond;
     MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iftrue;
     MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_return_output := MUX_uxn_opcodes_h_l1312_c32_0d50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1314_c7_5885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c32_0d50_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1314_c7_5885_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_1a6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1308_c7_1a6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- t16_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1305_c7_3442] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1305_c7_3442_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- t16_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c7_fcd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1300_c7_fcd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     -- n16_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- t16_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_1328] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1297_c7_1328_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1293_c7_05af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output := result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_05af_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- n16_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_1490] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1290_c7_1490_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_f55e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1285_c7_f55e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1282_c7_25ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1282_c7_25ae_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1276_c2_d416] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1325_l1272_DUPLICATE_b417 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1325_l1272_DUPLICATE_b417_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1276_c2_d416_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1276_c2_d416_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1325_l1272_DUPLICATE_b417_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1325_l1272_DUPLICATE_b417_return_output;
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
