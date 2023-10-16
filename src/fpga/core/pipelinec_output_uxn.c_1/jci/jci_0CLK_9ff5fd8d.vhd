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
entity jci_0CLK_9ff5fd8d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_9ff5fd8d;
architecture arch of jci_0CLK_9ff5fd8d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l68_c6_efa2]
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_3214]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l68_c2_0749]
signal tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_0749]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l68_c2_0749]
signal t8_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l69_c3_3de3[uxn_opcodes_h_l69_c3_3de3]
signal printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l73_c11_1cc0]
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l73_c7_28b6]
signal tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_28b6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l73_c7_28b6]
signal t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_01a8]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_e36f]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_e36f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l76_c7_e36f]
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_e36f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_e36f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_e36f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_e36f]
signal t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l82_c11_69ca]
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l82_c7_d6a6]
signal tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_d6a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_d6a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l82_c7_d6a6]
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_d6a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_f42e]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_0223]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_0223]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_0223]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_0223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l88_c3_c7c2]
signal CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l89_c22_b193]
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_174a]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_38c8]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_38c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l91_c7_38c8]
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_38c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_5857]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1ddf]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_9532]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9532]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9532]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_c718]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_688d]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_83ba]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_1a27]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_8395]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_ac12]
signal MUX_uxn_opcodes_h_l97_c22_ac12_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_ac12_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_ac12_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_ac12_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8d51]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_af58]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_af58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fc62( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2
BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output);

-- tmp16_MUX_uxn_opcodes_h_l68_c2_0749
tmp16_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond,
tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749
result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- t8_MUX_uxn_opcodes_h_l68_c2_0749
t8_MUX_uxn_opcodes_h_l68_c2_0749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l68_c2_0749_cond,
t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue,
t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse,
t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

-- printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3
printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3 : entity work.printf_uxn_opcodes_h_l69_c3_3de3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0
BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l73_c7_28b6
tmp16_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6
result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- t8_MUX_uxn_opcodes_h_l73_c7_28b6
t8_MUX_uxn_opcodes_h_l73_c7_28b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond,
t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue,
t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse,
t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8
BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_e36f
tmp16_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f
result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_e36f
t8_MUX_uxn_opcodes_h_l76_c7_e36f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond,
t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca
BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6
tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond,
tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6
result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e
BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_0223
tmp16_MUX_uxn_opcodes_h_l86_c7_0223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223
result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output);

-- CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2
CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x,
CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left,
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right,
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a
BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_38c8
tmp16_MUX_uxn_opcodes_h_l91_c7_38c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8
result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_9532
tmp16_MUX_uxn_opcodes_h_l94_c7_9532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_c718
BIN_OP_OR_uxn_opcodes_h_l95_c3_c718 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d
BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output);

-- MUX_uxn_opcodes_h_l97_c22_ac12
MUX_uxn_opcodes_h_l97_c22_ac12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_ac12_cond,
MUX_uxn_opcodes_h_l97_c22_ac12_iftrue,
MUX_uxn_opcodes_h_l97_c22_ac12_iffalse,
MUX_uxn_opcodes_h_l97_c22_ac12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output,
 tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output,
 tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output,
 CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output,
 MUX_uxn_opcodes_h_l97_c22_ac12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8e6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_ac0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_28b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_0df6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l89_c3_50d0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l92_c3_b202 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_ac12_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_ac12_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_fa61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l104_l63_DUPLICATE_3714_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8e6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_8e6d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_0df6 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_0df6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_ac0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_ac0b;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_8d51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_174a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_5857] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l89_c22_b193] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_left;
     BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output := BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_01a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_28b6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l82_c11_69ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_fa61 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_fa61_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1ddf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_688d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l73_c11_1cc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_83ba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l68_c6_efa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_f42e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_efa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_1cc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_01a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_69ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_f42e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_174a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1ddf_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_ac12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_688d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_8d51_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l89_c3_50d0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_b193_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l92_c3_b202 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_5857_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_83ba_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_fa61_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_fa61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_b9bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_dbc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l82_l76_l73_l99_l94_l91_l86_DUPLICATE_5a40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l82_l76_l73_l99_l68_l91_l86_DUPLICATE_8415_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_0334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue := VAR_result_u16_value_uxn_opcodes_h_l89_c3_50d0;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l92_c3_b202;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_d6a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_3214] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l88_c3_c7c2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output := CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_af58] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_af58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_c718] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_c718_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_c7c2_return_output;
     VAR_printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_3214_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_af58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_af58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_1a27] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output;

     -- printf_uxn_opcodes_h_l69_c3_3de3[uxn_opcodes_h_l69_c3_3de3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l69_c3_3de3_uxn_opcodes_h_l69_c3_3de3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9532] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- t8_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_9532] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_1a27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9532_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_t8_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9532_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_38c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- t8_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output := t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_38c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_8395] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_38c8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_8395_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l68_c2_0749_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l86_c7_0223] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_0223] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output;

     -- MUX[uxn_opcodes_h_l97_c22_ac12] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_ac12_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_ac12_cond;
     MUX_uxn_opcodes_h_l97_c22_ac12_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iftrue;
     MUX_uxn_opcodes_h_l97_c22_ac12_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_ac12_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_ac12_return_output := MUX_uxn_opcodes_h_l97_c22_ac12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_0223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_ac12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_0223_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_0223_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_0223_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_d6a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9532] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l82_c7_d6a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_cond;
     tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output := tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_d6a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9532_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l91_c7_38c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_38c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_0223] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_0223_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output := tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l82_c7_d6a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_d6a6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_0749_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l76_c7_e36f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output := result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_e36f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l73_c7_28b6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output := result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;

     -- Submodule level 11
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_28b6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l68_c2_0749] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_cond;
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output := result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l104_l63_DUPLICATE_3714 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l104_l63_DUPLICATE_3714_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fc62(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_0749_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_0749_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l104_l63_DUPLICATE_3714_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l104_l63_DUPLICATE_3714_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
