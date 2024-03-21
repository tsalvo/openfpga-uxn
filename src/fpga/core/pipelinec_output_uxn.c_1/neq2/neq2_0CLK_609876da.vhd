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
-- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_7ff4]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_4df5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_df5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_9b9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_24bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_5e0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_de4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1299_c7_6943]
signal n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1299_c7_6943]
signal t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_6943]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_6943]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_6943]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_6943]
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_6943]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1300_c3_7452]
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_3cfb]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_8989]
signal n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8989]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8989]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8989]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_8989]
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8989]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1306_c30_ef14]
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_4508]
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1308_c7_8854]
signal n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_8854]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_8854]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_8854]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_8854]
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_8854]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1309_c3_814f]
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_17d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1313_c21_7a9e]
signal MUX_uxn_opcodes_h_l1313_c21_7a9e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c2_4df5
n16_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c2_4df5
t16_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_9b9b
n16_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_9b9b
t16_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c7_5e0e
n16_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c7_5e0e
t16_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1299_c7_6943
n16_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- t16_MUX_uxn_opcodes_h_l1299_c7_6943
t16_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452
BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right,
BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_8989
n16_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14
sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins,
sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x,
sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y,
sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right,
BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output);

-- n16_MUX_uxn_opcodes_h_l1308_c7_8854
n16_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f
BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right,
BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output);

-- MUX_uxn_opcodes_h_l1313_c21_7a9e
MUX_uxn_opcodes_h_l1313_c21_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1313_c21_7a9e_cond,
MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue,
MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse,
MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output,
 n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output,
 sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output,
 n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output,
 MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_97cb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_e5f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_9e4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_4240 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_1d6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_50e4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_817e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_9d72_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1317_l1274_DUPLICATE_f1bc_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_e5f0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_e5f0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_1d6c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_1d6c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_50e4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1310_c3_50e4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_817e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1312_c3_817e;
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_4240 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1297_c3_4240;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_97cb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1283_c3_97cb;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_9e4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1292_c3_9e4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1308_c11_4508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_left;
     BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output := BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c6_7ff4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_3cfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c11_de4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_df5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1306_c30_ef14] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_ins;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_x;
     sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output := sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c11_24bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_9d72 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_9d72_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c6_7ff4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_df5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c11_24bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c11_de4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_3cfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1308_c11_4508_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1295_l1304_l1300_l1309_DUPLICATE_a6f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1294_l1308_l1299_DUPLICATE_46d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_b6a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1294_l1291_l1308_l1303_l1299_DUPLICATE_cfad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_9d72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1303_l1308_DUPLICATE_9d72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1291_l1278_l1308_l1303_l1299_DUPLICATE_6bcb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1278_c2_4df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1306_c30_ef14_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1309_c3_814f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_left;
     BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output := BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1300_c3_7452] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_left;
     BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output := BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1300_c3_7452_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1309_c3_814f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1296_l1305_DUPLICATE_5266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c21_17d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- n16_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- t16_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c21_17d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     -- t16_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- MUX[uxn_opcodes_h_l1313_c21_7a9e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1313_c21_7a9e_cond <= VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_cond;
     MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue <= VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iftrue;
     MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse <= VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output := MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue := VAR_MUX_uxn_opcodes_h_l1313_c21_7a9e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1308_c7_8854] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output := result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1308_c7_8854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1303_c7_8989] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output := result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1303_c7_8989_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1299_c7_6943] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output := result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1299_c7_6943_return_output;
     -- n16_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c7_5e0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c7_5e0e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1291_c7_9b9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1291_c7_9b9b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c2_4df5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1317_l1274_DUPLICATE_f1bc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1317_l1274_DUPLICATE_f1bc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c2_4df5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1317_l1274_DUPLICATE_f1bc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1317_l1274_DUPLICATE_f1bc_return_output;
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
