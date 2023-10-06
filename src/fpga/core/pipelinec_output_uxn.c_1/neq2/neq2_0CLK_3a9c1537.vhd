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
-- BIN_OP_EQ[uxn_opcodes_h_l1471_c6_08c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1471_c1_2cf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1471_c2_9afc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1472_c3_94c9[uxn_opcodes_h_l1472_c3_94c9]
signal printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_03c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1477_c7_2591]
signal n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1477_c7_2591]
signal t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1477_c7_2591]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_c452]
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1480_c7_ecf1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_81e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1485_c7_246d]
signal n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1485_c7_246d]
signal t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c7_246d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_7a3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1488_c7_4d0f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1489_c3_c7dc]
signal BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_db41]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1492_c7_aa54]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_4b89]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1495_c7_dc75]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_3e14]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1500_c7_2a99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_c5d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_b74b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1504_c3_a732]
signal BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1507_c32_e3f4]
signal BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1507_c32_e55f]
signal BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1507_c32_a9bd]
signal MUX_uxn_opcodes_h_l1507_c32_a9bd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_1b4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1509_c7_4f62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1509_c7_4f62]
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_4f62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_4f62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_4f62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1513_c24_3bad]
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1513_c24_db4c]
signal MUX_uxn_opcodes_h_l1513_c24_db4c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1513_c24_db4c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_c9c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_2960]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_2960]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0
BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output);

-- n16_MUX_uxn_opcodes_h_l1471_c2_9afc
n16_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- t16_MUX_uxn_opcodes_h_l1471_c2_9afc
t16_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc
result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

-- printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9
printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9 : entity work.printf_uxn_opcodes_h_l1472_c3_94c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output);

-- n16_MUX_uxn_opcodes_h_l1477_c7_2591
n16_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- t16_MUX_uxn_opcodes_h_l1477_c7_2591
t16_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right,
BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output);

-- n16_MUX_uxn_opcodes_h_l1480_c7_ecf1
n16_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- t16_MUX_uxn_opcodes_h_l1480_c7_ecf1
t16_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1
result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output);

-- n16_MUX_uxn_opcodes_h_l1485_c7_246d
n16_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- t16_MUX_uxn_opcodes_h_l1485_c7_246d
t16_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output);

-- n16_MUX_uxn_opcodes_h_l1488_c7_4d0f
n16_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- t16_MUX_uxn_opcodes_h_l1488_c7_4d0f
t16_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f
result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc
BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left,
BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right,
BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output);

-- n16_MUX_uxn_opcodes_h_l1492_c7_aa54
n16_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output);

-- n16_MUX_uxn_opcodes_h_l1495_c7_dc75
n16_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75
result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75
result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output);

-- n16_MUX_uxn_opcodes_h_l1500_c7_2a99
n16_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1503_c7_b74b
n16_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b
result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732
BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left,
BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right,
BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4
BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left,
BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right,
BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f
BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left,
BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right,
BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output);

-- MUX_uxn_opcodes_h_l1507_c32_a9bd
MUX_uxn_opcodes_h_l1507_c32_a9bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1507_c32_a9bd_cond,
MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue,
MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse,
MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62
result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond,
result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad
BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left,
BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right,
BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output);

-- MUX_uxn_opcodes_h_l1513_c24_db4c
MUX_uxn_opcodes_h_l1513_c24_db4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1513_c24_db4c_cond,
MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue,
MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse,
MUX_uxn_opcodes_h_l1513_c24_db4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output,
 n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output,
 n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output,
 n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output,
 n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output,
 n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output,
 n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output,
 n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output,
 n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output,
 n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output,
 MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output,
 MUX_uxn_opcodes_h_l1513_c24_db4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_06b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4aa1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_1b15 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b361 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8c5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_64b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_770d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_4ccb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_48db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1503_l1509_DUPLICATE_448a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1520_l1467_DUPLICATE_3456_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_06b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_06b2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_1b15 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_1b15;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_4ccb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_4ccb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_64b8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_64b8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_770d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1498_c3_770d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4aa1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_4aa1;
     VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b361 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b361;
     VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8c5d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8c5d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_48db := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1512_c3_48db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_c5d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1471_c6_08c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_4b89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_1b4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1480_c11_c452] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_left;
     BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output := BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_7a3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_03c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_3e14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1507_c32_e3f4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_left;
     BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output := BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_db41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_c9c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1513_c24_3bad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1503_l1509_DUPLICATE_448a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1503_l1509_DUPLICATE_448a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_81e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1507_c32_e3f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c6_08c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_03c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1480_c11_c452_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_81e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_7a3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_db41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4b89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_3e14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_c5d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_1b4d_return_output;
     VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c24_3bad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_c9c1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1489_l1496_l1481_l1504_DUPLICATE_d5f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1515_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_50f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1477_l1500_DUPLICATE_0c67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1495_l1492_l1488_l1485_l1480_l1503_l1477_l1500_DUPLICATE_e612_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1515_l1485_l1480_l1503_l1477_l1500_DUPLICATE_be00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1503_l1509_DUPLICATE_448a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1503_l1509_DUPLICATE_448a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1471_l1495_l1492_l1488_l1485_l1509_l1480_l1503_l1477_l1500_DUPLICATE_a41f_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1489_c3_c7dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1509_c7_4f62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_2960] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1507_c32_e55f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_left;
     BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output := BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1471_c1_2cf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_2960] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1504_c3_a732] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_left;
     BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output := BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_4f62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;

     -- MUX[uxn_opcodes_h_l1513_c24_db4c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1513_c24_db4c_cond <= VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_cond;
     MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue <= VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iftrue;
     MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse <= VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_return_output := MUX_uxn_opcodes_h_l1513_c24_db4c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1507_c32_e55f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1489_c3_c7dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1504_c3_a732_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1482_l1497_DUPLICATE_074f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue := VAR_MUX_uxn_opcodes_h_l1513_c24_db4c_return_output;
     VAR_printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1471_c1_2cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_2960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_2960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_4f62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1509_c7_4f62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output := result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- MUX[uxn_opcodes_h_l1507_c32_a9bd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1507_c32_a9bd_cond <= VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_cond;
     MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue <= VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iftrue;
     MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse <= VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output := MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_4f62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- printf_uxn_opcodes_h_l1472_c3_94c9[uxn_opcodes_h_l1472_c3_94c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1472_c3_94c9_uxn_opcodes_h_l1472_c3_94c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue := VAR_MUX_uxn_opcodes_h_l1507_c32_a9bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c7_4f62_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- t16_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1503_c7_b74b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1503_c7_b74b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- t16_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_2a99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1500_c7_2a99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     -- t16_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- n16_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1495_c7_dc75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output := result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1495_c7_dc75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     -- n16_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_aa54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;

     -- t16_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_aa54_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1488_c7_4d0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1488_c7_4d0f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_246d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_246d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- n16_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1480_c7_ecf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1480_c7_ecf1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- n16_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c7_2591] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1477_c7_2591_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1471_c2_9afc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1520_l1467_DUPLICATE_3456 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1520_l1467_DUPLICATE_3456_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1471_c2_9afc_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1520_l1467_DUPLICATE_3456_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1520_l1467_DUPLICATE_3456_return_output;
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
