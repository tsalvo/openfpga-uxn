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
-- Submodules: 57
entity jci_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_edc09f97;
architecture arch of jci_0CLK_edc09f97 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l72_c6_3bb0]
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_1db4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l72_c2_9aa5]
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l73_c3_1b48[uxn_opcodes_h_l73_c3_1b48]
signal printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_766c]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_8485]
signal t8_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_8485]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_8485]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l80_c11_cd40]
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l80_c7_de83]
signal t8_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_de83]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l80_c7_de83]
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_de83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_de83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_de83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l80_c7_de83]
signal tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_2f45]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_7adb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_7adb]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_7adb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_7adb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_7adb]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_fee6]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_f4dc]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_e0f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_e0f6]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_e0f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_e0f6]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l92_c3_fe1e]
signal CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_35ca]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_0162]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_0162]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_0162]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_0162]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_e878]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_650f]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_c054]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_e0e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_b896]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_49e5]
signal MUX_uxn_opcodes_h_l97_c22_49e5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_49e5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_49e5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_49e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_6106]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_e184]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_e184]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_660c( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0
BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output);

-- t8_MUX_uxn_opcodes_h_l72_c2_9aa5
t8_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5
tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond,
tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue,
tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse,
tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

-- printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48
printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48 : entity work.printf_uxn_opcodes_h_l73_c3_1b48_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c
BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_8485
t8_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_8485_cond,
t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_8485
tmp16_MUX_uxn_opcodes_h_l77_c7_8485 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output);

-- t8_MUX_uxn_opcodes_h_l80_c7_de83
t8_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l80_c7_de83_cond,
t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83
result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l80_c7_de83
tmp16_MUX_uxn_opcodes_h_l80_c7_de83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond,
tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue,
tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse,
tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45
BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb
result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_7adb
tmp16_MUX_uxn_opcodes_h_l86_c7_7adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc
BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6
result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6
tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e
CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x,
CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca
BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162
result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_0162
tmp16_MUX_uxn_opcodes_h_l94_c7_0162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_e878
BIN_OP_OR_uxn_opcodes_h_l95_c3_e878 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f
BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output);

-- MUX_uxn_opcodes_h_l97_c22_49e5
MUX_uxn_opcodes_h_l97_c22_49e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_49e5_cond,
MUX_uxn_opcodes_h_l97_c22_49e5_iftrue,
MUX_uxn_opcodes_h_l97_c22_49e5_iffalse,
MUX_uxn_opcodes_h_l97_c22_49e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106
BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output,
 t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output,
 t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output,
 CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output,
 MUX_uxn_opcodes_h_l97_c22_49e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_25d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_013b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8485_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_6371 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_4460 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_49e5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_49e5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_7cd9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l104_l67_DUPLICATE_03d0_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_6371 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_6371;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_013b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_013b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_25d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_25d0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_2f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8485_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_f4dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_35ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_766c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_650f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_c054] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_6106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_fee6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l80_c11_cd40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_left;
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output := BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l72_c6_3bb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_7cd9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_7cd9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_3bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_766c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cd40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_2f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_f4dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_35ca_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_49e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_650f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_6106_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_4460 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_fee6_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_c054_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_7cd9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l91_l95_DUPLICATE_7cd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l80_l72_l77_DUPLICATE_6057_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l94_l72_l77_l90_DUPLICATE_fc79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_082a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_dbc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_6a9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_4460;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_1db4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output;

     -- t8_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output := t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_e184] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_7adb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_e878] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_e184] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l92_c3_fe1e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output := CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_e878_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_fe1e_return_output;
     VAR_printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_1db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_e184_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_e184_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_t8_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l94_c7_0162] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_0162] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_0162] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_e0e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- printf_uxn_opcodes_h_l73_c3_1b48[uxn_opcodes_h_l73_c3_1b48] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l73_c3_1b48_uxn_opcodes_h_l73_c3_1b48_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output := t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_e0e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_0162_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_0162_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_0162_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_e0f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;

     -- t8_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_b896] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_e0f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_e0f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_b896_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l86_c7_7adb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_7adb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;

     -- MUX[uxn_opcodes_h_l97_c22_49e5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_49e5_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_49e5_cond;
     MUX_uxn_opcodes_h_l97_c22_49e5_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iftrue;
     MUX_uxn_opcodes_h_l97_c22_49e5_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_49e5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_49e5_return_output := MUX_uxn_opcodes_h_l97_c22_49e5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_7adb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_49e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output := tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_0162] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_0162_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_e0f6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_e0f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_7adb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_7adb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l80_c7_de83] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_cond;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output := result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_de83_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c7_8485] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8485_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l72_c2_9aa5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output := result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l104_l67_DUPLICATE_03d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l104_l67_DUPLICATE_03d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_660c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9aa5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l104_l67_DUPLICATE_03d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l104_l67_DUPLICATE_03d0_return_output;
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
