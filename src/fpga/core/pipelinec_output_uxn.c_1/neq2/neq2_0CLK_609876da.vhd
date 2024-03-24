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
-- Submodules: 58
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_1ebe]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_ad0d]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_c602]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_947b]
signal t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_947b]
signal n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_947b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_947b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_947b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_947b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_947b]
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_f218]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_ee8f]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_504c]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_5591]
signal t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_5591]
signal n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_5591]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_5591]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_5591]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_5591]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_5591]
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1300_c3_4153]
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_6d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_8136]
signal n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8136]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8136]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8136]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8136]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_8136]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1306_c30_54e7]
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_4c59]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_a69c]
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1309_c3_0cf8]
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_99e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1313_c21_ae9f]
signal MUX_uxn_opcodes_h_l1313_c21_ae9f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c2_ad0d
t16_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c2_ad0d
n16_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_947b
t16_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_947b
n16_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c7_ee8f
t16_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c7_ee8f
n16_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_5591
t16_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_5591
n16_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153
BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_8136
n16_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7
sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins,
sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x,
sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y,
sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_a69c
n16_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8
BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output);

-- MUX_uxn_opcodes_h_l1313_c21_ae9f
MUX_uxn_opcodes_h_l1313_c21_ae9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1313_c21_ae9f_cond,
MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue,
MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse,
MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output,
 sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output,
 MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_6698 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_a7a6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_d6c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_918c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b4e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_5638 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_712a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_1988_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1317_l1274_DUPLICATE_9bed_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_d6c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_d6c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_918c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_918c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b4e2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_b4e2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_712a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_712a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_a7a6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_a7a6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_6698 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_6698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_5638 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_5638;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_6d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_f218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_1988 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_1988_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_1ebe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_c602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_4c59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_504c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1306_c30_54e7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_ins;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_x;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output := sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_1ebe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_c602_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_f218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_504c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_6d8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4c59_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_361f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1308_l1299_l1291_l1294_DUPLICATE_6ca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_5983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1308_l1303_DUPLICATE_129f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_1988_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1308_l1303_DUPLICATE_1988_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1299_l1294_l1291_l1278_l1308_l1303_DUPLICATE_27b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_54e7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1300_c3_4153] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_left;
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output := BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1309_c3_0cf8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_left;
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output := BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_4153_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_0cf8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_c3b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- n16_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_99e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_99e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- n16_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- MUX[uxn_opcodes_h_l1313_c21_ae9f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1313_c21_ae9f_cond <= VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_cond;
     MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue <= VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iftrue;
     MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse <= VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output := MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue := VAR_MUX_uxn_opcodes_h_l1313_c21_ae9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_a69c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_a69c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_8136] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8136_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_5591] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output := result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_5591_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_ee8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_ee8f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_947b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_947b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_ad0d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1317_l1274_DUPLICATE_9bed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1317_l1274_DUPLICATE_9bed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_ad0d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1317_l1274_DUPLICATE_9bed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1317_l1274_DUPLICATE_9bed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
