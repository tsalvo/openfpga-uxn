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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 61
entity jci_0CLK_af8c339b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_af8c339b;
architecture arch of jci_0CLK_af8c339b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_d39c]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_29b5]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_29b5]
signal t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c2_29b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_1cf3]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_c042]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_c042]
signal t8_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_c042]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_cfcd]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_7647]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_7647]
signal t8_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_7647]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l79_c7_7647]
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_7647]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_7647]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_7647]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_cc39]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_e327]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_e327]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_e327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_e327]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_e327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l89_c11_7052]
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l89_c7_39c8]
signal tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_39c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_39c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l89_c7_39c8]
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l91_c3_3bfe]
signal CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_434c]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1015]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_9c8a]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9c8a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9c8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9c8a]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c22_c748]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c11_5805]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l97_c7_07d9]
signal tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_07d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_07d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l97_c7_07d9]
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l98_c3_ba05]
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l100_c22_2009]
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c32_4bf6]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_c096]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_346c]
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l100_c22_52ba]
signal MUX_uxn_opcodes_h_l100_c22_52ba_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_52ba_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_52ba_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l100_c22_52ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l102_c11_31c0]
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l102_c7_2def]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l102_c7_2def]
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c
BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_29b5
tmp16_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_29b5
t8_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5
result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3
BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_c042
tmp16_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_c042
t8_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_c042_cond,
t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042
result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd
BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_7647
tmp16_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_7647
t8_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_7647_cond,
t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647
result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39
BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_e327
tmp16_MUX_uxn_opcodes_h_l85_c7_e327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right,
BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output);

-- tmp16_MUX_uxn_opcodes_h_l89_c7_39c8
tmp16_MUX_uxn_opcodes_h_l89_c7_39c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond,
tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue,
tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse,
tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8
result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe
CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x,
CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a
tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805
BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output);

-- tmp16_MUX_uxn_opcodes_h_l97_c7_07d9
tmp16_MUX_uxn_opcodes_h_l97_c7_07d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond,
tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9
result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05
BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left,
BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right,
BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009
BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left,
BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right,
BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right,
BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output);

-- MUX_uxn_opcodes_h_l100_c22_52ba
MUX_uxn_opcodes_h_l100_c22_52ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l100_c22_52ba_cond,
MUX_uxn_opcodes_h_l100_c22_52ba_iftrue,
MUX_uxn_opcodes_h_l100_c22_52ba_iffalse,
MUX_uxn_opcodes_h_l100_c22_52ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0
BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left,
BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right,
BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output,
 tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output,
 CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output,
 tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output,
 MUX_uxn_opcodes_h_l100_c22_52ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_e0f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_ef5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_c042_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_4c2f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l92_c3_32fb : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l95_c3_7a34 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_52ba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l100_c22_52ba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l90_l98_DUPLICATE_26cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l66_l107_DUPLICATE_bbd8_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_e0f6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l73_c3_e0f6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_4c2f := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_4c2f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_ef5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l77_c3_ef5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_434c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l100_c22_2009] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_left;
     BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output := BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l102_c11_31c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_c042_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l90_l98_DUPLICATE_26cb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l90_l98_DUPLICATE_26cb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_cfcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c11_5805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_1cf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l89_c11_7052] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_left;
     BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output := BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c32_4bf6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_cc39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_d39c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c22_c748] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l100_c22_52ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l100_c22_2009_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c11_31c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_d39c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_1cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_cfcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_cc39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l89_c11_7052_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_5805_return_output;
     VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c32_4bf6_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l92_c3_32fb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_434c_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l95_c3_7a34 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c22_c748_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l90_l98_DUPLICATE_26cb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l90_l98_DUPLICATE_26cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l79_l71_l76_DUPLICATE_5342_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l71_l97_l76_DUPLICATE_6f8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l97_DUPLICATE_bc40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l94_l89_l85_l79_l76_l102_l71_DUPLICATE_ab7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l71_l85_l76_DUPLICATE_6ed7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l92_c3_32fb;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l95_c3_7a34;
     -- t8_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output := t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l91_c3_3bfe] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x <= VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output := CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l102_c7_2def] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l102_c7_2def] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l98_c3_ba05] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_left;
     BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output := BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l85_c7_e327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right := VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l98_c3_ba05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l91_c3_3bfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l102_c7_2def_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l102_c7_2def_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l85_c7_e327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_07d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l97_c7_07d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_cond;
     tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output := tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- t8_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output := t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_07d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_c096] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_c096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l100_c42_346c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_9c8a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_9c8a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_9c8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l100_c42_346c_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l89_c7_39c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l89_c7_39c8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_cond;
     tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output := tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;

     -- MUX[uxn_opcodes_h_l100_c22_52ba] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l100_c22_52ba_cond <= VAR_MUX_uxn_opcodes_h_l100_c22_52ba_cond;
     MUX_uxn_opcodes_h_l100_c22_52ba_iftrue <= VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iftrue;
     MUX_uxn_opcodes_h_l100_c22_52ba_iffalse <= VAR_MUX_uxn_opcodes_h_l100_c22_52ba_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l100_c22_52ba_return_output := MUX_uxn_opcodes_h_l100_c22_52ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l89_c7_39c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue := VAR_MUX_uxn_opcodes_h_l100_c22_52ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l97_c7_07d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_e327] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_e327] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_e327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e327_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e327_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l97_c7_07d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e327_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_9c8a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_9c8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l89_c7_39c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l89_c7_39c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_e327] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e327_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l79_c7_7647] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_cond;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output := result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_7647_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l76_c7_c042] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_cond;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output := result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output;

     -- Submodule level 11
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_c042_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_29b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l66_l107_DUPLICATE_bbd8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l66_l107_DUPLICATE_bbd8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l71_c2_29b5_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l66_l107_DUPLICATE_bbd8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l66_l107_DUPLICATE_bbd8_return_output;
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
