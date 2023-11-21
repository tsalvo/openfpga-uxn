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
-- Submodules: 63
entity rot2_0CLK_666ea292 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_666ea292;
architecture arch of rot2_0CLK_666ea292 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2401_c6_6354]
signal BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2401_c2_0e1c]
signal t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_7b3d]
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2409_c7_9a0e]
signal t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_0902]
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2412_c7_9c2b]
signal t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_b0aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_c394]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2416_c7_c394]
signal l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2416_c7_c394]
signal n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2419_c30_fcd7]
signal sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_6da0]
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_3835]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2424_c7_3835]
signal l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2430_c11_2ee4]
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2430_c7_f06d]
signal result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2430_c7_f06d]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2430_c7_f06d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2430_c7_f06d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2430_c7_f06d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2434_c11_efb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2434_c7_be67]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2434_c7_be67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2434_c7_be67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8152( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_operation_16bit := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354
BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left,
BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right,
BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c
result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- l16_MUX_uxn_opcodes_h_l2401_c2_0e1c
l16_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- n16_MUX_uxn_opcodes_h_l2401_c2_0e1c
n16_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- t16_MUX_uxn_opcodes_h_l2401_c2_0e1c
t16_MUX_uxn_opcodes_h_l2401_c2_0e1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond,
t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue,
t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse,
t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- l16_MUX_uxn_opcodes_h_l2409_c7_9a0e
l16_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- n16_MUX_uxn_opcodes_h_l2409_c7_9a0e
n16_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- t16_MUX_uxn_opcodes_h_l2409_c7_9a0e
t16_MUX_uxn_opcodes_h_l2409_c7_9a0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond,
t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue,
t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse,
t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- l16_MUX_uxn_opcodes_h_l2412_c7_9c2b
l16_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- n16_MUX_uxn_opcodes_h_l2412_c7_9c2b
n16_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- t16_MUX_uxn_opcodes_h_l2412_c7_9c2b
t16_MUX_uxn_opcodes_h_l2412_c7_9c2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond,
t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue,
t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse,
t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394
result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- l16_MUX_uxn_opcodes_h_l2416_c7_c394
l16_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- n16_MUX_uxn_opcodes_h_l2416_c7_c394
n16_MUX_uxn_opcodes_h_l2416_c7_c394 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond,
n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue,
n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse,
n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7
sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins,
sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x,
sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y,
sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835
result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- l16_MUX_uxn_opcodes_h_l2424_c7_3835
l16_MUX_uxn_opcodes_h_l2424_c7_3835 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond,
l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue,
l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse,
l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left,
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right,
BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d
result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0
BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67
result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67
result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output,
 sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_7f8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8bc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_f419 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_0a96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_4afe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_ad2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2430_c7_f06d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2397_l2440_DUPLICATE_489c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_7f8a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_7f8a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_4afe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2427_c3_4afe;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8bc1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8bc1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_ad2f := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2431_c3_ad2f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_0a96 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_0a96;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_f419 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_f419;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins := VAR_ins;
     VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := l16;
     VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := n16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left := VAR_phase;
     VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_previous_stack_read;
     VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := VAR_previous_stack_read;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_previous_stack_read;
     VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_previous_stack_read;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2430_c11_2ee4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output := result.is_stack_operation_16bit;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2430_c7_f06d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_7b3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_0902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_left;
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output := BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_6da0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2401_c6_6354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2434_c11_efb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2419_c30_fcd7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_ins;
     sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_x;
     sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output := sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_b0aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;

     -- Submodule level 1
     VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2401_c6_6354_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_7b3d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0902_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_b0aa_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_6da0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2430_c11_2ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2434_c11_efb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2409_l2412_l2401_l2416_DUPLICATE_964f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2409_l2412_l2430_l2401_DUPLICATE_0f84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_7e22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2409_l2424_l2412_l2401_DUPLICATE_1b7a_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l2424_l2416_l2412_l2409_l2434_l2430_DUPLICATE_5c8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2424_l2412_l2409_l2401_l2434_l2430_DUPLICATE_bfa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2419_c30_fcd7_return_output;
     -- l16_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2434_c7_be67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2434_c7_be67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- t16_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2434_c7_be67] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- n16_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- Submodule level 2
     VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2434_c7_be67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2430_c7_f06d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;

     -- l16_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- Submodule level 3
     VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2430_c7_f06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2424_c7_3835] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_3835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2416_c7_c394] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;

     -- l16_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_c394_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_9c2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- Submodule level 6
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_9c2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2409_c7_9a0e] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9a0e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l2401_c2_0e1c] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2397_l2440_DUPLICATE_489c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2397_l2440_DUPLICATE_489c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8152(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2401_c2_0e1c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2397_l2440_DUPLICATE_489c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l2397_l2440_DUPLICATE_489c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
