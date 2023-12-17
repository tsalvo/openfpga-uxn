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
-- BIN_OP_EQ[uxn_opcodes_h_l1134_c6_fd99]
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1134_c2_c566]
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c2_c566]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1134_c2_c566]
signal t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1134_c2_c566]
signal n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_e5a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1147_c7_2ad9]
signal n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_bb49]
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1150_c7_4ca8]
signal n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_91f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1155_c7_1595]
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_1595]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_1595]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_1595]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_1595]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_1595]
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1155_c7_1595]
signal t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1155_c7_1595]
signal n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1156_c3_8a88]
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_c1ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1159_c7_2600]
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_2600]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_2600]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_2600]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_2600]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_2600]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_2600]
signal n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_5c6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1163_c7_4870]
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4870]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4870]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4870]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4870]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4870]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_4870]
signal n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1164_c3_6fd8]
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1165_c11_b230]
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1166_c30_61ba]
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_db60]
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_2ccd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_2ccd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1171_c7_2ccd]
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_2ccd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1174_c31_63c7]
signal CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left,
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right,
BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1134_c2_c566
tmp16_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- t16_MUX_uxn_opcodes_h_l1134_c2_c566
t16_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- n16_MUX_uxn_opcodes_h_l1134_c2_c566
n16_MUX_uxn_opcodes_h_l1134_c2_c566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond,
n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue,
n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse,
n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9
tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- t16_MUX_uxn_opcodes_h_l1147_c7_2ad9
t16_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- n16_MUX_uxn_opcodes_h_l1147_c7_2ad9
n16_MUX_uxn_opcodes_h_l1147_c7_2ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond,
n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue,
n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse,
n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right,
BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8
tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- t16_MUX_uxn_opcodes_h_l1150_c7_4ca8
t16_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- n16_MUX_uxn_opcodes_h_l1150_c7_4ca8
n16_MUX_uxn_opcodes_h_l1150_c7_4ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond,
n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue,
n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse,
n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1155_c7_1595
tmp16_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- t16_MUX_uxn_opcodes_h_l1155_c7_1595
t16_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- n16_MUX_uxn_opcodes_h_l1155_c7_1595
n16_MUX_uxn_opcodes_h_l1155_c7_1595 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond,
n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue,
n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse,
n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88
BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left,
BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right,
BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1159_c7_2600
tmp16_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_2600
n16_MUX_uxn_opcodes_h_l1159_c7_2600 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1163_c7_4870
tmp16_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_4870
n16_MUX_uxn_opcodes_h_l1163_c7_4870 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8
BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left,
BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right,
BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left,
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right,
BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba
sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins,
sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x,
sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y,
sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7
CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x,
CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output,
 tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output,
 tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output,
 tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output,
 sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output,
 CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_c7cb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7252 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_e385 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_9f2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_a45c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_3bcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_744e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_b23d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_92c3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_eb6a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1159_DUPLICATE_5a5e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1130_l1178_DUPLICATE_411e_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_c7cb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1139_c3_c7cb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7252 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_7252;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_92c3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1172_c3_92c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_9f2c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1153_c3_9f2c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_3bcf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1168_c3_3bcf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_a45c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_a45c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_e385 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_e385;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_b23d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1173_c3_b23d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_5c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1174_c31_63c7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output := CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1150_c11_bb49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_left;
     BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output := BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_c1ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_91f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_c566_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1166_c30_61ba] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_ins;
     sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_x;
     sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output := sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_db60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_c566_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1159_DUPLICATE_5a5e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1159_DUPLICATE_5a5e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1134_c6_fd99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1147_c11_e5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1134_c6_fd99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1147_c11_e5a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1150_c11_bb49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_91f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_c1ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_5c6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_db60_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1160_l1164_l1151_l1156_DUPLICATE_307c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1147_DUPLICATE_d054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1159_l1163_l1155_l1150_l1147_DUPLICATE_53bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1163_l1155_l1150_l1147_DUPLICATE_38de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1159_DUPLICATE_5a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1159_DUPLICATE_5a5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1171_l1159_l1155_l1150_l1134_l1147_DUPLICATE_63d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1166_c30_61ba_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1156_c3_8a88] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_left;
     BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output := BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_2ccd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1164_c3_6fd8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_left;
     BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output := BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1174_c21_eb6a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_eb6a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1174_c31_63c7_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_2ccd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_2ccd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1156_c3_8a88_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1164_c3_6fd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1174_c21_eb6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1161_l1152_DUPLICATE_694f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;
     -- t16_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- n16_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1165_c11_b230] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_left;
     BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output := BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1171_c7_2ccd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1171_c7_2ccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     -- t16_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1169_c21_744e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_744e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1165_c11_b230_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1169_c21_744e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4870] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;

     -- n16_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- t16_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4870_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_2600] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- t16_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- n16_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_2600_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1155_c7_1595] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output := result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1155_c7_1595_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- n16_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1150_c7_4ca8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1150_c7_4ca8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1147_c7_2ad9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1147_c7_2ad9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1134_c2_c566] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output := result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1130_l1178_DUPLICATE_411e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1130_l1178_DUPLICATE_411e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1134_c2_c566_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1134_c2_c566_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1130_l1178_DUPLICATE_411e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1130_l1178_DUPLICATE_411e_return_output;
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
