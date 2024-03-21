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
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l854_c6_1193]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l854_c2_f89d]
signal n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l854_c2_f89d]
signal t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l854_c2_f89d]
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_f89d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l867_c11_3c04]
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l867_c7_223d]
signal n16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l867_c7_223d]
signal t16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l867_c7_223d]
signal tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_223d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_223d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_223d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l867_c7_223d]
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_223d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_8c49]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c7_c70d]
signal n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c7_c70d]
signal t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c7_c70d]
signal tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_c70d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_c70d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_c70d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c7_c70d]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_c70d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_2858]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_8ed3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_0b1b]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_86fc]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l879_c7_7a66]
signal n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l879_c7_7a66]
signal tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_7a66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_7a66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_7a66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l879_c7_7a66]
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_7a66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_3555]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_7a67]
signal n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_7a67]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_7a67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_7a67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_7a67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_7a67]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_7a67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l884_c3_3661]
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_dae2]
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l886_c30_c241]
signal sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_d45a]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_f6f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_f6f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_f6f7]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_f6f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l894_c31_d6f7]
signal CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193
BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output);

-- n16_MUX_uxn_opcodes_h_l854_c2_f89d
n16_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- t16_MUX_uxn_opcodes_h_l854_c2_f89d
t16_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l854_c2_f89d
tmp16_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04
BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output);

-- n16_MUX_uxn_opcodes_h_l867_c7_223d
n16_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l867_c7_223d_cond,
n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- t16_MUX_uxn_opcodes_h_l867_c7_223d
t16_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l867_c7_223d_cond,
t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l867_c7_223d
tmp16_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond,
tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d
result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49
BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c7_c70d
n16_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c7_c70d
t16_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c7_c70d
tmp16_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d
result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858
BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_8ed3
n16_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- t16_MUX_uxn_opcodes_h_l875_c7_8ed3
t16_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3
tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3
result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b
BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc
BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output);

-- n16_MUX_uxn_opcodes_h_l879_c7_7a66
n16_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- tmp16_MUX_uxn_opcodes_h_l879_c7_7a66
tmp16_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66
result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555
BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_7a67
n16_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_7a67
tmp16_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67
result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l884_c3_3661
BIN_OP_OR_uxn_opcodes_h_l884_c3_3661 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left,
BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right,
BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l886_c30_c241
sp_relative_shift_uxn_opcodes_h_l886_c30_c241 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins,
sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x,
sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y,
sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a
BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7
CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x,
CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output,
 n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output,
 n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output,
 n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output,
 n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output,
 BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output,
 sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output,
 CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0379 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_e87a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_9d8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_2dfa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_4d5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l885_c3_d4fc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_38dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_8953_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_388d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_31cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_2a84_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_d85f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l898_l850_DUPLICATE_cd79_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_9d8e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_9d8e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_31cd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_31cd;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_4d5e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_4d5e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0379 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_0379;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_388d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_388d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_2dfa := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_2dfa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_e87a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_e87a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_38dd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_38dd;
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_2858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f89d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_8c49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_3555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_86fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l886_c30_c241] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_ins;
     sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_x;
     sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output := sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_d45a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l894_c31_d6f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output := CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f89d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c6_1193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l867_c11_3c04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_left;
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output := BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_d85f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_d85f_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_1193_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_3c04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_8c49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_2858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_86fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_3555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_d45a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l876_l884_l871_DUPLICATE_b31f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l879_l875_l870_l867_DUPLICATE_648f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l883_l879_l875_l870_l867_DUPLICATE_e8b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_9181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_d85f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_d85f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l891_l879_l875_l870_l867_DUPLICATE_6741_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_c241_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l894_c21_2a84] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_2a84_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_d6f7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_0b1b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_f6f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_f6f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l884_c3_3661] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_left;
     BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output := BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_f6f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0b1b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_3661_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_2a84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_630f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;
     -- n16_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_dae2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_f6f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l885_c3_d4fc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_dae2_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f6f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_tmp16_uxn_opcodes_h_l885_c3_d4fc;
     -- t16_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- n16_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l889_c21_8953] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_8953_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l885_c3_d4fc);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_8953_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     -- t16_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output := t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_7a67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_7a67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- n16_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l879_c7_7a66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output := result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- t16_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_7a66_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- n16_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output := n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l875_c7_8ed3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output := result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_8ed3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output := tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- n16_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l870_c7_c70d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_c70d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l867_c7_223d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output := result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_223d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l854_c2_f89d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l898_l850_DUPLICATE_cd79 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l898_l850_DUPLICATE_cd79_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_f89d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l898_l850_DUPLICATE_cd79_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l898_l850_DUPLICATE_cd79_return_output;
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
