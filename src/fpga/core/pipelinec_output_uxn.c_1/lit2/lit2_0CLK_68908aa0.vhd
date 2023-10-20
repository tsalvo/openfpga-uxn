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
-- Submodules: 62
entity lit2_0CLK_68908aa0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_68908aa0;
architecture arch of lit2_0CLK_68908aa0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l226_c6_1139]
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l226_c2_28a6]
signal tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l226_c2_28a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l233_c11_4eeb]
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l233_c7_7d4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l237_c11_a128]
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l237_c7_8ece]
signal tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_8ece]
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l239_c3_3bde]
signal CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_1612]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_97d5]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_0eaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l243_c22_b0c9]
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l245_c11_ebc3]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c7_ec36]
signal tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_ec36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l246_c3_9b04]
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l248_c22_8b4c]
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l253_c11_2a8b]
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l253_c7_c992]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l253_c7_c992]
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_c992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l253_c7_c992]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_c992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l256_c31_6561]
signal CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l258_c11_32db]
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l258_c7_8071]
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l258_c7_8071]
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left,
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right,
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output);

-- tmp16_MUX_uxn_opcodes_h_l226_c2_28a6
tmp16_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6
result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6
result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb
BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left,
BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right,
BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b
tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b
result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b
result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128
BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output);

-- tmp16_MUX_uxn_opcodes_h_l237_c7_8ece
tmp16_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece
result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece
result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output);

-- CONST_SL_8_uxn_opcodes_h_l239_c3_3bde
CONST_SL_8_uxn_opcodes_h_l239_c3_3bde : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x,
CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5
BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa
tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa
result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa
result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left,
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right,
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3
BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c7_ec36
tmp16_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36
result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36
result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04
BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left,
BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right,
BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left,
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right,
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b
BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992
result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output);

-- CONST_SR_8_uxn_opcodes_h_l256_c31_6561
CONST_SR_8_uxn_opcodes_h_l256_c31_6561 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x,
CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db
BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left,
BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right,
BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output,
 tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output,
 tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output,
 tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output,
 CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output,
 BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output,
 CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_d3d9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_28a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l240_c3_929d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l243_c3_668b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l248_c3_e57b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_ec36_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_88bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_5ef1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_de93 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_24f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l246_l238_DUPLICATE_685b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l263_l221_DUPLICATE_029c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_88bc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_88bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_d3d9 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_d3d9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_de93 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_de93;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l233_c11_4eeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_1612] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_7d4b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_97d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l245_c11_ebc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l253_c11_2a8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l246_l238_DUPLICATE_685b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l246_l238_DUPLICATE_685b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l237_c11_a128] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_left;
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output := BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l258_c11_32db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_left;
     BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output := BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_28a6_return_output := result.sp_relative_shift;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_ec36_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l226_c6_1139] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_left;
     BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output := BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l243_c22_b0c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l248_c22_8b4c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l256_c31_6561] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x <= VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output := CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1139_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_4eeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_a128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_97d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_ebc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_2a8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_32db_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l240_c3_929d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_1612_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l243_c3_668b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_b0c9_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l248_c3_e57b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_8b4c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l246_l238_DUPLICATE_685b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l246_l238_DUPLICATE_685b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l237_l233_l258_l253_l245_DUPLICATE_1b2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_1a15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l237_l233_l226_l258_l253_DUPLICATE_7af4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_4e7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l233_l226_l253_DUPLICATE_5e43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_28a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_result_u16_value_uxn_opcodes_h_l240_c3_929d;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue := VAR_result_u16_value_uxn_opcodes_h_l243_c3_668b;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := VAR_result_u16_value_uxn_opcodes_h_l248_c3_e57b;
     -- BIN_OP_OR[uxn_opcodes_h_l246_c3_9b04] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_left;
     BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output := BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l256_c21_24f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_24f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_6561_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l258_c7_8071] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l258_c7_8071] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l239_c3_3bde] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x <= VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output := CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l253_c7_c992] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l253_c7_c992] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_24f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_3bde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_8071_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_c992_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_8071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_c992_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_c992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l251_c21_5ef1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_5ef1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_9b04_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_c992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l253_c7_c992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_cond;
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output := result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_5ef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_c992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_c992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_c992_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_ec36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_ec36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_0eaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_0eaa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_8ece] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_8ece_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l233_c7_7d4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_7d4b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l226_c2_28a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l263_l221_DUPLICATE_029c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l263_l221_DUPLICATE_029c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_28a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_28a6_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l263_l221_DUPLICATE_029c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a1b5_uxn_opcodes_h_l263_l221_DUPLICATE_029c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
