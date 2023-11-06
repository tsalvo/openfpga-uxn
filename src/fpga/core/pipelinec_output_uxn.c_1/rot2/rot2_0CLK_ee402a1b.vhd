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
-- Submodules: 137
entity rot2_0CLK_ee402a1b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_ee402a1b;
architecture arch of rot2_0CLK_ee402a1b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2550_c6_e108]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c1_437b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2550_c2_105d]
signal n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c2_105d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2550_c2_105d]
signal l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2550_c2_105d]
signal t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2551_c3_a33c[uxn_opcodes_h_l2551_c3_a33c]
signal printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_6dc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2555_c7_40f6]
signal t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_746b]
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2558_c7_60e2]
signal t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_010b]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2563_c7_b243]
signal n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_b243]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2563_c7_b243]
signal l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2563_c7_b243]
signal t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2564_c3_c8cd]
signal BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_7bf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2567_c7_6db3]
signal l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_1b44]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2571_c7_798e]
signal n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_798e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2571_c7_798e]
signal l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2572_c3_3f90]
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_17f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2575_c7_aad2]
signal l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_c7d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2578_c7_d8a2]
signal l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_57da]
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2583_c7_66a3]
signal l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_d91b]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : signed(3 downto 0);

-- l16_MUX[uxn_opcodes_h_l2586_c7_eac5]
signal l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2587_c3_2b15]
signal BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2589_c30_d392]
signal sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_3644]
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2594_c7_3a02]
signal result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_3a02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_3a02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_3a02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_3a02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2597_c31_d873]
signal CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_0cab]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_7d3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_7d3c]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_7d3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_7d3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2603_c11_1f9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c7_f0d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2603_c7_f0d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c7_f0d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c7_f0d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2605_c31_ff45]
signal CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_b306]
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2607_c7_6498]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2607_c7_6498]
signal result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_6498]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_6498]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2611_c11_e0ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2611_c7_1a8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2611_c7_1a8f]
signal result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2611_c7_1a8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2611_c7_1a8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2613_c31_e35c]
signal CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2615_c11_4a81]
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c7_f8d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c7_f8d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108
BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output);

-- n16_MUX_uxn_opcodes_h_l2550_c2_105d
n16_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d
result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- l16_MUX_uxn_opcodes_h_l2550_c2_105d
l16_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- t16_MUX_uxn_opcodes_h_l2550_c2_105d
t16_MUX_uxn_opcodes_h_l2550_c2_105d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond,
t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue,
t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse,
t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

-- printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c
printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c : entity work.printf_uxn_opcodes_h_l2551_c3_a33c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output);

-- n16_MUX_uxn_opcodes_h_l2555_c7_40f6
n16_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- l16_MUX_uxn_opcodes_h_l2555_c7_40f6
l16_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- t16_MUX_uxn_opcodes_h_l2555_c7_40f6
t16_MUX_uxn_opcodes_h_l2555_c7_40f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond,
t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue,
t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse,
t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output);

-- n16_MUX_uxn_opcodes_h_l2558_c7_60e2
n16_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2
result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2
result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- l16_MUX_uxn_opcodes_h_l2558_c7_60e2
l16_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- t16_MUX_uxn_opcodes_h_l2558_c7_60e2
t16_MUX_uxn_opcodes_h_l2558_c7_60e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond,
t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue,
t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse,
t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output);

-- n16_MUX_uxn_opcodes_h_l2563_c7_b243
n16_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243
result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- l16_MUX_uxn_opcodes_h_l2563_c7_b243
l16_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- t16_MUX_uxn_opcodes_h_l2563_c7_b243
t16_MUX_uxn_opcodes_h_l2563_c7_b243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond,
t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue,
t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse,
t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd
BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left,
BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right,
BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output);

-- n16_MUX_uxn_opcodes_h_l2567_c7_6db3
n16_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3
result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- l16_MUX_uxn_opcodes_h_l2567_c7_6db3
l16_MUX_uxn_opcodes_h_l2567_c7_6db3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond,
l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue,
l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse,
l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output);

-- n16_MUX_uxn_opcodes_h_l2571_c7_798e
n16_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- l16_MUX_uxn_opcodes_h_l2571_c7_798e
l16_MUX_uxn_opcodes_h_l2571_c7_798e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond,
l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue,
l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse,
l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90
BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left,
BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right,
BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- l16_MUX_uxn_opcodes_h_l2575_c7_aad2
l16_MUX_uxn_opcodes_h_l2575_c7_aad2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond,
l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue,
l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse,
l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- l16_MUX_uxn_opcodes_h_l2578_c7_d8a2
l16_MUX_uxn_opcodes_h_l2578_c7_d8a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond,
l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue,
l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse,
l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right,
BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- l16_MUX_uxn_opcodes_h_l2583_c7_66a3
l16_MUX_uxn_opcodes_h_l2583_c7_66a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond,
l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue,
l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse,
l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- l16_MUX_uxn_opcodes_h_l2586_c7_eac5
l16_MUX_uxn_opcodes_h_l2586_c7_eac5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond,
l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue,
l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse,
l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15
BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left,
BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right,
BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2589_c30_d392
sp_relative_shift_uxn_opcodes_h_l2589_c30_d392 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins,
sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x,
sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y,
sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right,
BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02
result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond,
result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2597_c31_d873
CONST_SR_8_uxn_opcodes_h_l2597_c31_d873 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x,
CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2
result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45
CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x,
CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right,
BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498
result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond,
result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f
result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c
CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x,
CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left,
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right,
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6
CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output,
 n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output,
 n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output,
 n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output,
 n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output,
 n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output,
 n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output,
 sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output,
 CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_e2f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_ceb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_398f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_396a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_726f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_63ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_38db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_4c13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_8082 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2592_c21_d9ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_230a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_9780_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_2703 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2601_c21_325b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_47f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_fa81_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_516a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c21_8802_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_b199 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2613_c21_c761_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2611_l2567_DUPLICATE_ba3e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2620_l2546_DUPLICATE_e962_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_4c13 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_4c13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right := to_unsigned(12, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_ceb0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_ceb0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_8082 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_8082;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_726f := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_726f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_38db := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_38db;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_e2f0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_e2f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_516a := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_516a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_63ac := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2576_c3_63ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_396a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2565_c3_396a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_230a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_230a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_398f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_398f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_47f3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_47f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_2703 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_2703;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_b199 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_b199;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2583_c11_57da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2597_c31_d873] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output := CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2567_c11_7bf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2611_c11_e0ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2609_c21_8802] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c21_8802_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_6dc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_0cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_746b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2605_c31_ff45] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output := CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_010b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2603_c11_1f9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2613_c31_e35c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output := CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c11_d91b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2615_c11_4a81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2589_c30_d392] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_ins;
     sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_x;
     sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output := sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c6_e108] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2611_l2567_DUPLICATE_ba3e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2611_l2567_DUPLICATE_ba3e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_c7d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2594_c11_3644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_left;
     BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output := BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2575_c11_17f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2601_c21_325b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2601_c21_325b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_1b44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2607_c11_b306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_left;
     BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output := BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c6_e108_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_6dc5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_746b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_010b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2567_c11_7bf2_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_1b44_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2575_c11_17f7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_c7d7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2583_c11_57da_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c11_d91b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2594_c11_3644_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_0cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c11_1f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2607_c11_b306_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2611_c11_e0ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_4a81_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2579_l2572_l2559_l2568_l2587_l2564_DUPLICATE_8039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2601_c21_325b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2609_c21_8802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2586_l2558_l2583_l2555_l2578_DUPLICATE_73c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2607_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2586_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_af4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2594_l2563_l2558_l2583_l2555_l2578_DUPLICATE_333c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2607_l2550_l2575_l2603_l2571_l2599_l2567_l2594_l2563_l2615_l2558_l2583_l2611_l2555_l2578_DUPLICATE_6174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2611_l2567_DUPLICATE_ba3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2611_l2567_DUPLICATE_ba3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2550_l2575_l2571_l2567_l2563_l2558_l2583_l2611_l2555_l2578_DUPLICATE_aa9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2589_c30_d392_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2605_c21_fa81] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_fa81_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2605_c31_ff45_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2587_c3_2b15] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_left;
     BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output := BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2572_c3_3f90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_left;
     BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output := BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2550_c1_437b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c7_f8d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2564_c3_c8cd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_left;
     BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output := BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2611_c7_1a8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2594_c7_3a02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c7_f8d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2597_c21_9780] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_9780_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2597_c31_d873_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2613_c21_c761] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2613_c21_c761_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2613_c31_e35c_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2564_c3_c8cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2572_c3_3f90_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_9780_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2605_c21_fa81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2613_c21_c761_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2569_l2580_l2560_DUPLICATE_feb6_return_output;
     VAR_printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2550_c1_437b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_f8d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2592_c21_d9ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2592_c21_d9ae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2587_c3_2b15_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2611_c7_1a8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2611_c7_1a8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2607_c7_6498] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2611_c7_1a8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;

     -- printf_uxn_opcodes_h_l2551_c3_a33c[uxn_opcodes_h_l2551_c3_a33c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2551_c3_a33c_uxn_opcodes_h_l2551_c3_a33c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2592_c21_d9ae_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2611_c7_1a8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c7_f0d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2607_c7_6498] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output := result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2607_c7_6498] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2607_c7_6498] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;

     -- n16_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2607_c7_6498_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     -- n16_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_7d3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2603_c7_f0d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c7_f0d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c7_f0d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2603_c7_f0d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2594_c7_3a02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_7d3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_7d3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_7d3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_7d3c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2594_c7_3a02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2594_c7_3a02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output := result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;

     -- n16_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2594_c7_3a02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2594_c7_3a02_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c7_eac5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c7_eac5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2583_c7_66a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2583_c7_66a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_d8a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_d8a2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2575_c7_aad2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2575_c7_aad2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- l16_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c7_798e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- Submodule level 12
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_798e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2567_c7_6db3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2567_c7_6db3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_b243] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b243_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2558_c7_60e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;

     -- Submodule level 15
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2558_c7_60e2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_40f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_40f6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c2_105d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output;

     -- Submodule level 17
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2620_l2546_DUPLICATE_e962 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2620_l2546_DUPLICATE_e962_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c2_105d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c2_105d_return_output);

     -- Submodule level 18
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2620_l2546_DUPLICATE_e962_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2620_l2546_DUPLICATE_e962_return_output;
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
