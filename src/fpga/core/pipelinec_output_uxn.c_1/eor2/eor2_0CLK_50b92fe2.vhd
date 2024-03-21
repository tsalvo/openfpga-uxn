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
-- Submodules: 71
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_1036]
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_fca3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_27aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_9396]
signal n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1125_c7_9396]
signal t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_9396]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_9396]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_9396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_9396]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_9396]
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_9396]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_96ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_119d]
signal n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c7_119d]
signal t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_119d]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_119d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_119d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_119d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_119d]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_119d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_9007]
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1133_c7_6767]
signal n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1133_c7_6767]
signal t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1133_c7_6767]
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_6767]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_6767]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_6767]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_6767]
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_6767]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1134_c3_a5af]
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_2ef7]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1137_c7_902b]
signal n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1137_c7_902b]
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_902b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_902b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_902b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_902b]
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_902b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_c88e]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_a234]
signal n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_a234]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_a234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_a234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_a234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_a234]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_a234]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1142_c3_fcc5]
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_b015]
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1144_c30_c3d2]
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_9799]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_5402]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_5402]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_5402]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_5402]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1152_c31_ba74]
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output);

-- n16_MUX_uxn_opcodes_h_l1112_c2_fca3
n16_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- t16_MUX_uxn_opcodes_h_l1112_c2_fca3
t16_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3
tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_9396
n16_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- t16_MUX_uxn_opcodes_h_l1125_c7_9396
t16_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_9396
tmp16_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_119d
n16_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c7_119d
t16_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_119d
tmp16_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output);

-- n16_MUX_uxn_opcodes_h_l1133_c7_6767
n16_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- t16_MUX_uxn_opcodes_h_l1133_c7_6767
t16_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1133_c7_6767
tmp16_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af
BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output);

-- n16_MUX_uxn_opcodes_h_l1137_c7_902b
n16_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1137_c7_902b
tmp16_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_a234
n16_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_a234
tmp16_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5
BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2
sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins,
sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x,
sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y,
sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74
CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x,
CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output,
 n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output,
 n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output,
 n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output,
 sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output,
 CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78cd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_7f00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_ee8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_2ca0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_72e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_b041 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_d061_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_4dde : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_51d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_5fc9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_53dd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1156_l1108_DUPLICATE_6bce_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_2ca0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_2ca0;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_7f00 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_7f00;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_4dde := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_4dde;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_51d4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_51d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_72e5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_72e5;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78cd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78cd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_b041 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_b041;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_ee8a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_ee8a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_9007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_left;
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output := BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_c88e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_9799] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_53dd LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_53dd_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1152_c31_ba74] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output := CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_1036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_left;
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output := BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_96ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_27aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1144_c30_c3d2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_ins;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_x;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output := sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_2ef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_1036_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_27aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_96ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_9007_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_2ef7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_c88e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9799_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1138_l1142_l1129_l1134_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1137_l1133_l1128_l1125_DUPLICATE_e3bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1149_l1141_l1137_l1133_l1128_l1125_DUPLICATE_4b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1141_l1137_l1133_l1128_l1125_DUPLICATE_5ecc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_53dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_53dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1112_l1149_l1137_l1133_l1128_l1125_DUPLICATE_2b54_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_c3d2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_5402] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_5402] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1152_c21_5fc9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_5fc9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_ba74_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1142_c3_fcc5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_left;
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output := BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1134_c3_a5af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_left;
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output := BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_5402] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_a5af_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_fcc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_5fc9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_8ed2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_b015] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_left;
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output := BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- t16_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_5402] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_5402_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     -- t16_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1147_c21_d061] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_d061_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_b015_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- n16_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_d061_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     -- n16_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- t16_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_a234] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_a234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- t16_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_902b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_902b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_6767] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output := result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_6767_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_119d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_119d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_9396] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output := result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_9396_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_fca3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1156_l1108_DUPLICATE_6bce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1156_l1108_DUPLICATE_6bce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_fca3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1156_l1108_DUPLICATE_6bce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1156_l1108_DUPLICATE_6bce_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
