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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_c9bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_d772]
signal t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_d772]
signal n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_d772]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_69cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_2d10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_96e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_d03c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_b5c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_e248]
signal t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_e248]
signal n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_e248]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_e248]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_e248]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_e248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_e248]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_10dc]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_8cfd]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_2367]
signal n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_2367]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_2367]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_2367]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_2367]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_2367]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_3c7e]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_1945]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_6135]
signal n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_6135]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_6135]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_6135]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_6135]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_6135]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_0d53]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_5481]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_d3cb]
signal MUX_uxn_opcodes_h_l1312_c21_d3cb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_d772
t16_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_d772
n16_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_2d10
t16_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_2d10
n16_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_d03c
t16_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_d03c
n16_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_e248
t16_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_e248
n16_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc
BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_2367
n16_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e
sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_6135
n16_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53
BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_d3cb
MUX_uxn_opcodes_h_l1312_c21_d3cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_d3cb_cond,
MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue,
MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse,
MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output,
 MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_8a25 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_5b73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_4977 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_8c1c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ff5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_c5ad : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_582e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_fc82_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1316_l1273_DUPLICATE_7d77_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_5b73 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_5b73;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_582e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_582e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_8a25 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_8a25;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_4977 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_4977;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_c5ad := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_c5ad;
     VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ff5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ff5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_8c1c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_8c1c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_d772_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_69cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_c9bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_d772_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_8cfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_fc82 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_fc82_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_96e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_b5c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_3c7e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_1945] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_c9bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_69cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_96e0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_b5c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_8cfd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_1945_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1294_l1303_l1308_DUPLICATE_b102_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_1b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1307_l1302_DUPLICATE_10a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_fc82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_fc82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1298_l1293_l1290_l1277_l1307_l1302_DUPLICATE_10a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_d772_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_d772_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_d772_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_3c7e_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_0d53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_10dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_10dc_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_0d53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_3fcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_5481] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_5481_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- t16_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_d3cb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_d3cb_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_cond;
     MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output := MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_d3cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_6135] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_6135_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     -- t16_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_2367] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_2367_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_e248] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_e248_return_output;
     -- n16_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_d03c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_d03c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_2d10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_2d10_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_d772] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1316_l1273_DUPLICATE_7d77 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1316_l1273_DUPLICATE_7d77_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_d772_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_d772_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1316_l1273_DUPLICATE_7d77_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1316_l1273_DUPLICATE_7d77_return_output;
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
