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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_5ad8]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_ed23]
signal n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_629e]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_0f1b]
signal n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_933b]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_f38a]
signal n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_81d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_5377]
signal t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_5377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_5377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_5377]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_5377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_5377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_5377]
signal n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_dc6b]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_54b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_0098]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_0098]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_0098]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_0098]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_0098]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_0098]
signal n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_ce85]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_9fc6]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_fd4b]
signal n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_8d41]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_c9c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_1b56]
signal MUX_uxn_opcodes_h_l1312_c21_1b56_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_1b56_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_ed23
t16_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_ed23
n16_MUX_uxn_opcodes_h_l1277_c2_ed23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_0f1b
t16_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_0f1b
n16_MUX_uxn_opcodes_h_l1290_c7_0f1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_f38a
t16_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_f38a
n16_MUX_uxn_opcodes_h_l1293_c7_f38a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_5377
t16_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_5377
n16_MUX_uxn_opcodes_h_l1298_c7_5377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b
BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_0098
n16_MUX_uxn_opcodes_h_l1302_c7_0098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85
sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_fd4b
n16_MUX_uxn_opcodes_h_l1307_c7_fd4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41
BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_1b56
MUX_uxn_opcodes_h_l1312_c21_1b56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_1b56_cond,
MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue,
MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse,
MUX_uxn_opcodes_h_l1312_c21_1b56_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output,
 MUX_uxn_opcodes_h_l1312_c21_1b56_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_3a0a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_d4db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_9327 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_36a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ca2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2ae3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_0755 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_53c6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1273_l1316_DUPLICATE_ad00_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_0755 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_0755;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2ae3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_2ae3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_36a5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_36a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ca2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_4ca2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_3a0a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_3a0a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_9327 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_9327;
     VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_d4db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_d4db;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_629e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_54b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_5ad8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_933b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_53c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_53c6_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_ce85] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_9fc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_81d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_5ad8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_629e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_933b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_81d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_54b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_9fc6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1308_l1294_l1303_DUPLICATE_5dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1293_l1307_l1298_l1290_DUPLICATE_ea30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_04c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_DUPLICATE_3e64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_53c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1307_l1302_DUPLICATE_53c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1307_l1302_l1298_l1293_l1290_l1277_DUPLICATE_8735_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_ed23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_ce85_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_dc6b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_8d41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_dc6b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_8d41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1295_l1304_DUPLICATE_f5ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_c9c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- t16_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_c9c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     -- t16_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_1b56] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_1b56_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_cond;
     MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_return_output := MUX_uxn_opcodes_h_l1312_c21_1b56_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_1b56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_fd4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_fd4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_0098] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_0098_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_5377] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_5377_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_f38a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_f38a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_0f1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_0f1b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_ed23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1273_l1316_DUPLICATE_ad00 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1273_l1316_DUPLICATE_ad00_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_ed23_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1273_l1316_DUPLICATE_ad00_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1273_l1316_DUPLICATE_ad00_return_output;
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
