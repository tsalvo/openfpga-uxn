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
entity neq_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_1c7b7172;
architecture arch of neq_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1345_c6_1d02]
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1345_c1_e417]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1345_c2_6c54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1346_c3_bccc[uxn_opcodes_h_l1346_c3_bccc]
signal printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_5fd9]
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1350_c7_00da]
signal n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1350_c7_00da]
signal t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_00da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_3fca]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_01b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_eb84]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1357_c7_1898]
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_1898]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_27bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_3f5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1363_c32_4d16]
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1363_c32_4fc0]
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1363_c32_af55]
signal MUX_uxn_opcodes_h_l1363_c32_af55_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_af55_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_af55_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1363_c32_af55_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_a4e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_88b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_88b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_88b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_88b6]
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_88b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1369_c24_8b78]
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1369_c24_c514]
signal MUX_uxn_opcodes_h_l1369_c24_c514_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_c514_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_c514_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1369_c24_c514_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_e305]
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_c6ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_c6ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left,
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right,
BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output);

-- n8_MUX_uxn_opcodes_h_l1345_c2_6c54
n8_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- t8_MUX_uxn_opcodes_h_l1345_c2_6c54
t8_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

-- printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc
printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc : entity work.printf_uxn_opcodes_h_l1346_c3_bccc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right,
BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output);

-- n8_MUX_uxn_opcodes_h_l1350_c7_00da
n8_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- t8_MUX_uxn_opcodes_h_l1350_c7_00da
t8_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output);

-- n8_MUX_uxn_opcodes_h_l1353_c7_01b1
n8_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- t8_MUX_uxn_opcodes_h_l1353_c7_01b1
t8_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output);

-- n8_MUX_uxn_opcodes_h_l1357_c7_1898
n8_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output);

-- n8_MUX_uxn_opcodes_h_l1360_c7_3f5f
n8_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16
BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left,
BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right,
BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0
BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left,
BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right,
BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output);

-- MUX_uxn_opcodes_h_l1363_c32_af55
MUX_uxn_opcodes_h_l1363_c32_af55 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1363_c32_af55_cond,
MUX_uxn_opcodes_h_l1363_c32_af55_iftrue,
MUX_uxn_opcodes_h_l1363_c32_af55_iffalse,
MUX_uxn_opcodes_h_l1363_c32_af55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left,
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right,
BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output);

-- MUX_uxn_opcodes_h_l1369_c24_c514
MUX_uxn_opcodes_h_l1369_c24_c514 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1369_c24_c514_cond,
MUX_uxn_opcodes_h_l1369_c24_c514_iftrue,
MUX_uxn_opcodes_h_l1369_c24_c514_iffalse,
MUX_uxn_opcodes_h_l1369_c24_c514_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right,
BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output,
 n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output,
 n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output,
 n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output,
 n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output,
 n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output,
 MUX_uxn_opcodes_h_l1363_c32_af55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output,
 MUX_uxn_opcodes_h_l1369_c24_c514_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_1b4f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_8f62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_7fad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_1c33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_af55_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1363_c32_af55_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_9d83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_c514_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1369_c24_c514_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_3fa8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1376_l1341_DUPLICATE_c0c5_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_1c33 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1358_c3_1c33;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_7fad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_7fad;
     VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_8f62 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_8f62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_1b4f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_1b4f;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_9d83 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_9d83;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_3fa8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_3fa8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1350_c11_5fd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_eb84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_3fca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1365_c11_a4e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1369_c24_8b78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1360_c11_27bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1371_c11_e305] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_left;
     BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output := BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1345_c6_1d02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1363_c32_4d16] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_left;
     BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output := BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1363_c32_4d16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1345_c6_1d02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c11_5fd9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_3fca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_eb84_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1360_c11_27bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c11_a4e2_return_output;
     VAR_MUX_uxn_opcodes_h_l1369_c24_c514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c24_8b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1371_c11_e305_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1360_DUPLICATE_4634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1371_l1365_l1360_DUPLICATE_3bf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_DUPLICATE_ff6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1371_l1360_DUPLICATE_9fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_3fa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1365_l1360_DUPLICATE_3fa8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1357_l1353_l1350_l1345_l1365_l1360_DUPLICATE_a7e7_return_output;
     -- MUX[uxn_opcodes_h_l1369_c24_c514] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1369_c24_c514_cond <= VAR_MUX_uxn_opcodes_h_l1369_c24_c514_cond;
     MUX_uxn_opcodes_h_l1369_c24_c514_iftrue <= VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iftrue;
     MUX_uxn_opcodes_h_l1369_c24_c514_iffalse <= VAR_MUX_uxn_opcodes_h_l1369_c24_c514_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1369_c24_c514_return_output := MUX_uxn_opcodes_h_l1369_c24_c514_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1365_c7_88b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1365_c7_88b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1345_c1_e417] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1371_c7_c6ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output;

     -- n8_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1371_c7_c6ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1363_c32_4fc0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_left;
     BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output := BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1363_c32_af55_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1363_c32_4fc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue := VAR_MUX_uxn_opcodes_h_l1369_c24_c514_return_output;
     VAR_printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1345_c1_e417_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1371_c7_c6ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     -- t8_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1365_c7_88b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- printf_uxn_opcodes_h_l1346_c3_bccc[uxn_opcodes_h_l1346_c3_bccc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1346_c3_bccc_uxn_opcodes_h_l1346_c3_bccc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1365_c7_88b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1365_c7_88b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;

     -- MUX[uxn_opcodes_h_l1363_c32_af55] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1363_c32_af55_cond <= VAR_MUX_uxn_opcodes_h_l1363_c32_af55_cond;
     MUX_uxn_opcodes_h_l1363_c32_af55_iftrue <= VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iftrue;
     MUX_uxn_opcodes_h_l1363_c32_af55_iffalse <= VAR_MUX_uxn_opcodes_h_l1363_c32_af55_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1363_c32_af55_return_output := MUX_uxn_opcodes_h_l1363_c32_af55_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue := VAR_MUX_uxn_opcodes_h_l1363_c32_af55_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1365_c7_88b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- n8_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1360_c7_3f5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1360_c7_3f5f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- n8_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_1898] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1357_c7_1898_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_01b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_01b1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c7_00da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1350_c7_00da_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1345_c2_6c54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1376_l1341_DUPLICATE_c0c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1376_l1341_DUPLICATE_c0c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1345_c2_6c54_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1376_l1341_DUPLICATE_c0c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1376_l1341_DUPLICATE_c0c5_return_output;
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
