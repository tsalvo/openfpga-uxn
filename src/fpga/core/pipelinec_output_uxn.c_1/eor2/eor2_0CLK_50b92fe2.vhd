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
-- BIN_OP_EQ[uxn_opcodes_h_l1128_c6_9d17]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c2_b4d7]
signal t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_ae90]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_b131]
signal n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_b131]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_b131]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_b131]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_b131]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_b131]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_b131]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1141_c7_b131]
signal t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_6bbf]
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1144_c7_351f]
signal n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1144_c7_351f]
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_351f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_351f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1144_c7_351f]
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_351f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_351f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1144_c7_351f]
signal t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_3971]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1149_c7_2a51]
signal t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1150_c3_045b]
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_162c]
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1153_c7_0681]
signal n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1153_c7_0681]
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_0681]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_0681]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1153_c7_0681]
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_0681]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_0681]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_e812]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_7c96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1158_c3_1f64]
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1159_c11_998a]
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1160_c30_ce88]
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1165_c11_7e0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1165_c7_f487]
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1165_c7_f487]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1165_c7_f487]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1165_c7_f487]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1168_c31_ec52]
signal CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c2_b4d7
n16_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7
tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c2_b4d7
t16_MUX_uxn_opcodes_h_l1128_c2_b4d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond,
t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_b131
n16_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_b131
tmp16_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- t16_MUX_uxn_opcodes_h_l1141_c7_b131
t16_MUX_uxn_opcodes_h_l1141_c7_b131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond,
t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue,
t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse,
t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output);

-- n16_MUX_uxn_opcodes_h_l1144_c7_351f
n16_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1144_c7_351f
tmp16_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- t16_MUX_uxn_opcodes_h_l1144_c7_351f
t16_MUX_uxn_opcodes_h_l1144_c7_351f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond,
t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue,
t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse,
t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output);

-- n16_MUX_uxn_opcodes_h_l1149_c7_2a51
n16_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51
tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- t16_MUX_uxn_opcodes_h_l1149_c7_2a51
t16_MUX_uxn_opcodes_h_l1149_c7_2a51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond,
t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue,
t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse,
t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b
BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output);

-- n16_MUX_uxn_opcodes_h_l1153_c7_0681
n16_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1153_c7_0681
tmp16_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output);

-- n16_MUX_uxn_opcodes_h_l1157_c7_7c96
n16_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96
tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64
BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left,
BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right,
BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left,
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right,
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88
sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins,
sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x,
sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y,
sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52
CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x,
CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output,
 n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output,
 n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output,
 n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output,
 n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output,
 CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_7ce9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_de17 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_52af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_c6a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_4b62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_b82a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_22ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_6090 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_2b4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_6cdf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_987d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1172_l1124_DUPLICATE_75ec_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_b82a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_b82a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_2b4b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_2b4b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_7ce9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_7ce9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_de17 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_de17;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_6090 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_6090;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_c6a2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_c6a2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_52af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_52af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_4b62 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_4b62;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_6bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_3971] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_987d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_987d_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1160_c30_ce88] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_ins;
     sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_x;
     sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output := sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c6_9d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1168_c31_ec52] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output := CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_ae90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_162c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1165_c11_7e0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_e812] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_9d17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_ae90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_6bbf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_3971_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_162c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_e812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_7e0f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1150_l1154_l1158_l1145_DUPLICATE_10ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1149_l1144_l1141_l1165_l1153_DUPLICATE_ab1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1165_l1153_DUPLICATE_099f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1157_l1149_l1144_l1141_l1153_DUPLICATE_35a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_987d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_987d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1149_l1144_l1128_l1141_l1165_l1153_DUPLICATE_7c82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_ce88_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1150_c3_045b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_left;
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output := BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1158_c3_1f64] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_left;
     BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output := BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1168_c21_6cdf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_6cdf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_ec52_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1165_c7_f487] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1165_c7_f487] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1165_c7_f487] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_045b_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_1f64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_6cdf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_2cce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1165_c7_f487] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output := result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- n16_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1159_c11_998a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_left;
     BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output := BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- t16_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_f487_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- n16_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- t16_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1163_c21_22ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_22ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_998a_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_22ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1157_c7_7c96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output := result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;

     -- n16_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- t16_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7c96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1153_c7_0681] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output := result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_0681_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_2a51] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_2a51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1144_c7_351f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_351f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_b131] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_b131_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c2_b4d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1172_l1124_DUPLICATE_75ec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1172_l1124_DUPLICATE_75ec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_b4d7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1172_l1124_DUPLICATE_75ec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1172_l1124_DUPLICATE_75ec_return_output;
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
