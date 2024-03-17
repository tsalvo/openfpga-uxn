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
-- BIN_OP_EQ[uxn_opcodes_h_l854_c6_025b]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l854_c2_bdb3]
signal t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l867_c11_916c]
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l867_c7_a93d]
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_a93d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_a93d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_a93d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_a93d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l867_c7_a93d]
signal tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l867_c7_a93d]
signal n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l867_c7_a93d]
signal t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_50cb]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c7_b176]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_b176]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_b176]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_b176]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_b176]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c7_b176]
signal tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c7_b176]
signal n16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c7_b176]
signal t16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_85cb]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l875_c7_beee]
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_beee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_beee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_beee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_beee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_beee]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_beee]
signal n16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l875_c7_beee]
signal t16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_0491]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_bf38]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l879_c7_db98]
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_db98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_db98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_db98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_db98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l879_c7_db98]
signal tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l879_c7_db98]
signal n16_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_18c3]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_768c]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_768c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_768c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_768c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_768c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_768c]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_768c]
signal n16_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l884_c3_ffd2]
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_c70a]
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l886_c30_e516]
signal sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_9278]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_f911]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_f911]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_f911]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_f911]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l894_c31_ff12]
signal CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b
BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3
result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3
tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- n16_MUX_uxn_opcodes_h_l854_c2_bdb3
n16_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- t16_MUX_uxn_opcodes_h_l854_c2_bdb3
t16_MUX_uxn_opcodes_h_l854_c2_bdb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond,
t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue,
t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse,
t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c
BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d
result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l867_c7_a93d
tmp16_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- n16_MUX_uxn_opcodes_h_l867_c7_a93d
n16_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- t16_MUX_uxn_opcodes_h_l867_c7_a93d
t16_MUX_uxn_opcodes_h_l867_c7_a93d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond,
t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue,
t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse,
t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb
BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176
result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c7_b176
tmp16_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond,
tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c7_b176
n16_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c7_b176_cond,
n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c7_b176
t16_MUX_uxn_opcodes_h_l870_c7_b176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c7_b176_cond,
t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue,
t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse,
t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb
BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee
result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_beee
tmp16_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_beee
n16_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_beee_cond,
n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- t16_MUX_uxn_opcodes_h_l875_c7_beee
t16_MUX_uxn_opcodes_h_l875_c7_beee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l875_c7_beee_cond,
t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue,
t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse,
t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_0491
BIN_OP_OR_uxn_opcodes_h_l876_c3_0491 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38
BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98
result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- tmp16_MUX_uxn_opcodes_h_l879_c7_db98
tmp16_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond,
tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- n16_MUX_uxn_opcodes_h_l879_c7_db98
n16_MUX_uxn_opcodes_h_l879_c7_db98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l879_c7_db98_cond,
n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue,
n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse,
n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3
BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c
result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_768c
tmp16_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_768c
n16_MUX_uxn_opcodes_h_l883_c7_768c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_768c_cond,
n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2
BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left,
BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right,
BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l886_c30_e516
sp_relative_shift_uxn_opcodes_h_l886_c30_e516 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins,
sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x,
sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y,
sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output);

-- CONST_SR_8_uxn_opcodes_h_l894_c31_ff12
CONST_SR_8_uxn_opcodes_h_l894_c31_ff12 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x,
CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output,
 sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output,
 CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_1ff4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_2a4b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ffb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_d620 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_5ad4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_89c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l885_c3_db2a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_73d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_db10 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_d2e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_069d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_0fbf_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l898_l850_DUPLICATE_b18b_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_5ad4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_5ad4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_2a4b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_2a4b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ffb4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_ffb4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_1ff4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_1ff4;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_d620 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_d620;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_d2e7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_d2e7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_89c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_89c5;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_db10 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_db10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_0fbf LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_0fbf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l867_c11_916c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_left;
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output := BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l886_c30_e516] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_ins;
     sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_x;
     sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output := sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_85cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_50cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_bf38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_9278] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c6_025b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_18c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l894_c31_ff12] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x <= VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output := CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_025b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_916c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_50cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_85cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_bf38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_18c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9278_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l876_l880_l884_l871_DUPLICATE_0f83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l870_l867_l891_l879_l875_DUPLICATE_c311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l870_l867_l891_l883_l879_l875_DUPLICATE_0d00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l870_l867_l883_l879_l875_DUPLICATE_b73c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_0fbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_0fbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l870_l867_l854_l891_l879_l875_DUPLICATE_4317_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_e516_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l884_c3_ffd2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_left;
     BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output := BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_0491] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_f911] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_f911] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_f911] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l894_c21_069d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_069d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ff12_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_0491_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_ffd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_069d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l881_l872_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_f911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_f911_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_f911_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output := n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_c70a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_f911] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output;

     -- t16_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output := t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l885_c3_db2a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_c70a_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_f911_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_t16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_tmp16_uxn_opcodes_h_l885_c3_db2a;
     -- tmp16_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- n16_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output := n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- t16_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output := t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l889_c21_73d0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_73d0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l885_c3_db2a);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_73d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     -- t16_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output := n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_768c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output := tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_768c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     -- n16_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output := n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l879_c7_db98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output := result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- t16_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_db98_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- n16_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l875_c7_beee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output := result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output := tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_beee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l870_c7_b176] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- n16_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_b176_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l867_c7_a93d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output := result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_a93d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l854_c2_bdb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l898_l850_DUPLICATE_b18b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l898_l850_DUPLICATE_b18b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_bdb3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l898_l850_DUPLICATE_b18b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l898_l850_DUPLICATE_b18b_return_output;
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
