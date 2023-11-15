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
-- Submodules: 114
entity rot2_0CLK_6006c90f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_6006c90f;
architecture arch of rot2_0CLK_6006c90f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2539_c6_8075]
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c1_37c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2539_c2_76bb]
signal l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2540_c3_c2a7[uxn_opcodes_h_l2540_c3_c2a7]
signal printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_1c39]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2544_c7_1eb6]
signal l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2547_c11_8255]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2547_c7_b696]
signal n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c7_b696]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2547_c7_b696]
signal t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2547_c7_b696]
signal l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_65f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2552_c7_1599]
signal n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_1599]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2552_c7_1599]
signal t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2552_c7_1599]
signal l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2553_c3_c5c1]
signal BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_284e]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2556_c7_8047]
signal n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2556_c7_8047]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2556_c7_8047]
signal l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_73ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2561_c7_4ba0]
signal l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2562_c3_7b43]
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_9a80]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2565_c7_f5db]
signal l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2569_c30_5b5b]
signal sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_6645]
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2574_c7_1c71]
signal l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2575_c3_ce25]
signal BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2578_c31_8c15]
signal CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_86fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_26fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_26fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_26fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_26fe]
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_04c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_1f3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_1f3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_1f3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_1f3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2586_c31_16a8]
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_02b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_f70d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_f70d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_f70d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_f70d]
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_7542]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_b4ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_b4ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_b4ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_b4ef]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2594_c31_2477]
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_92de]
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_c0c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_c0c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075
BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left,
BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right,
BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output);

-- n16_MUX_uxn_opcodes_h_l2539_c2_76bb
n16_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb
result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb
result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- t16_MUX_uxn_opcodes_h_l2539_c2_76bb
t16_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- l16_MUX_uxn_opcodes_h_l2539_c2_76bb
l16_MUX_uxn_opcodes_h_l2539_c2_76bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond,
l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue,
l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse,
l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

-- printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7
printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7 : entity work.printf_uxn_opcodes_h_l2540_c3_c2a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output);

-- n16_MUX_uxn_opcodes_h_l2544_c7_1eb6
n16_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- t16_MUX_uxn_opcodes_h_l2544_c7_1eb6
t16_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- l16_MUX_uxn_opcodes_h_l2544_c7_1eb6
l16_MUX_uxn_opcodes_h_l2544_c7_1eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond,
l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue,
l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse,
l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output);

-- n16_MUX_uxn_opcodes_h_l2547_c7_b696
n16_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696
result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- t16_MUX_uxn_opcodes_h_l2547_c7_b696
t16_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- l16_MUX_uxn_opcodes_h_l2547_c7_b696
l16_MUX_uxn_opcodes_h_l2547_c7_b696 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond,
l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue,
l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse,
l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2552_c7_1599
n16_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- t16_MUX_uxn_opcodes_h_l2552_c7_1599
t16_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- l16_MUX_uxn_opcodes_h_l2552_c7_1599
l16_MUX_uxn_opcodes_h_l2552_c7_1599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond,
l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue,
l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse,
l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1
BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left,
BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right,
BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output);

-- n16_MUX_uxn_opcodes_h_l2556_c7_8047
n16_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047
result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- l16_MUX_uxn_opcodes_h_l2556_c7_8047
l16_MUX_uxn_opcodes_h_l2556_c7_8047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond,
l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue,
l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse,
l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2561_c7_4ba0
n16_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- l16_MUX_uxn_opcodes_h_l2561_c7_4ba0
l16_MUX_uxn_opcodes_h_l2561_c7_4ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond,
l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue,
l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse,
l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43
BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- l16_MUX_uxn_opcodes_h_l2565_c7_f5db
l16_MUX_uxn_opcodes_h_l2565_c7_f5db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond,
l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue,
l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse,
l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b
sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins,
sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x,
sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y,
sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right,
BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71
result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- l16_MUX_uxn_opcodes_h_l2574_c7_1c71
l16_MUX_uxn_opcodes_h_l2574_c7_1c71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond,
l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue,
l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse,
l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25
BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left,
BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right,
BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15
CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x,
CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8
CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x,
CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2594_c31_2477
CONST_SR_8_uxn_opcodes_h_l2594_c31_2477 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x,
CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738
CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output,
 n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output,
 n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output,
 n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output,
 n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output,
 n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output,
 n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output,
 sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output,
 CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output,
 CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output,
 CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_b4f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2545_c3_c1c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_cdee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_3fce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_f979 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_f0b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_b603 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2572_c21_4a02_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_9196 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c21_5d28_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_9996 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c21_bd87_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_fa91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_4ca4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_bb93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_554f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_6246 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2592_c7_b4ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_11b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2601_l2535_DUPLICATE_904a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_f0b4 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_f0b4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_b603 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_b603;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_cdee := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_cdee;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_f979 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_f979;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_9196 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_9196;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right := to_unsigned(12, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_bb93 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_bb93;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_6246 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_6246;
     VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_fa91 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_fa91;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2545_c3_c1c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2545_c3_c1c5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_9996 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2581_c3_9996;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_3fce := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2554_c3_3fce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_b4f5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_b4f5;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l2586_c31_16a8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output := CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_9a80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_65f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_92de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2572_c21_4a02] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2572_c21_4a02_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2539_c6_8075] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_left;
     BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output := BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2582_c21_bd87] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c21_bd87_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2574_c11_6645] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_left;
     BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output := BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_73ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2578_c31_8c15] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output := CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2569_c30_5b5b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_ins;
     sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_x;
     sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output := sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_1c39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_7542] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_284e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2592_c7_b4ef] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2592_c7_b4ef_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_04c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2594_c31_2477] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output := CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_86fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_02b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2590_c21_554f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_554f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c11_8255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2539_c6_8075_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_1c39_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c11_8255_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_65f5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_284e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_73ae_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_9a80_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2574_c11_6645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_86fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_04c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_02b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_7542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_92de_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2548_l2557_l2575_l2553_l2566_l2562_DUPLICATE_bed9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2572_c21_4a02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c21_bd87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_554f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2565_l2539_l2561_l2556_DUPLICATE_cea3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2565_l2596_l2561_l2592_l2556_l2588_DUPLICATE_97e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2552_l2547_l2574_l2544_l2539_l2561_l2556_DUPLICATE_777a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2584_l2552_l2580_l2547_l2574_l2544_l2539_l2596_l2561_l2592_l2556_l2588_DUPLICATE_31ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2552_l2547_l2544_l2539_l2561_l2592_l2556_DUPLICATE_4c85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2592_c7_b4ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2569_c30_5b5b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2578_c21_5d28] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c21_5d28_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c31_8c15_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2553_c3_c5c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_left;
     BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output := BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2562_c3_7b43] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_left;
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output := BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2586_c21_4ca4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_4ca4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_16a8_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2539_c1_37c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_b4ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2575_c3_ce25] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_left;
     BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output := BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_c0c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2594_c21_11b6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_11b6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_2477_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2553_c3_c5c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_7b43_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2575_c3_ce25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c21_5d28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_4ca4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_11b6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2549_l2567_l2558_DUPLICATE_7738_return_output;
     VAR_printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2539_c1_37c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_c0c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_b4ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_b4ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_b4ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_f70d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- printf_uxn_opcodes_h_l2540_c3_c2a7[uxn_opcodes_h_l2540_c3_c2a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2540_c3_c2a7_uxn_opcodes_h_l2540_c3_c2a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- l16_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- Submodule level 3
     VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_b4ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     -- l16_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- n16_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- t16_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_f70d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_f70d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_1f3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_f70d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_f70d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_26fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_1f3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_1f3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- l16_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_1f3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- t16_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_1f3b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_26fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_26fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_26fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- t16_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- l16_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_26fe_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- n16_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- l16_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2574_c7_1c71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2574_c7_1c71_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- l16_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2565_c7_f5db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output := result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;

     -- n16_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c7_f5db_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- l16_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_4ba0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_4ba0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- l16_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2556_c7_8047] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output := result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;

     -- Submodule level 10
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2556_c7_8047_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_1599] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_1599_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c7_b696] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c7_b696_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2544_c7_1eb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2544_c7_1eb6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2539_c2_76bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2601_l2535_DUPLICATE_904a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2601_l2535_DUPLICATE_904a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2539_c2_76bb_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2601_l2535_DUPLICATE_904a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2601_l2535_DUPLICATE_904a_return_output;
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
