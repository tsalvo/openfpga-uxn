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
entity and2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_50b92fe2;
architecture arch of and2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l956_c6_c11c]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c2_c492]
signal n16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c2_c492]
signal tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l956_c2_c492]
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c2_c492]
signal t16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_be11]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_5441]
signal n16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_5441]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_5441]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_5441]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_5441]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_5441]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_5441]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l969_c7_5441]
signal t16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l972_c11_96ae]
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l972_c7_cbea]
signal n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l972_c7_cbea]
signal tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_cbea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_cbea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_cbea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l972_c7_cbea]
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_cbea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l972_c7_cbea]
signal t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_abe7]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_6af7]
signal n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l977_c7_6af7]
signal tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6af7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6af7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_6af7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6af7]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6af7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l977_c7_6af7]
signal t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l978_c3_1c79]
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_b5a2]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l981_c7_03e5]
signal n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l981_c7_03e5]
signal tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_03e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_03e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_03e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l981_c7_03e5]
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_03e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l985_c11_23d4]
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l985_c7_247c]
signal n16_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l985_c7_247c]
signal tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_247c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_247c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_247c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l985_c7_247c]
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_247c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l986_c3_5cdf]
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l987_c11_8968]
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l988_c30_1a27]
signal sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_cc2b]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_5654]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_5654]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_5654]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_5654]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l996_c31_6c09]
signal CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c
BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c2_c492
n16_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c2_c492_cond,
n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c2_c492
tmp16_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond,
tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492
result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c2_c492
t16_MUX_uxn_opcodes_h_l956_c2_c492 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c2_c492_cond,
t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue,
t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse,
t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11
BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_5441
n16_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_5441_cond,
n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_5441
tmp16_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441
result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- t16_MUX_uxn_opcodes_h_l969_c7_5441
t16_MUX_uxn_opcodes_h_l969_c7_5441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l969_c7_5441_cond,
t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue,
t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse,
t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae
BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right,
BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output);

-- n16_MUX_uxn_opcodes_h_l972_c7_cbea
n16_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l972_c7_cbea
tmp16_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea
result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- t16_MUX_uxn_opcodes_h_l972_c7_cbea
t16_MUX_uxn_opcodes_h_l972_c7_cbea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond,
t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue,
t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse,
t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7
BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_6af7
n16_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l977_c7_6af7
tmp16_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- t16_MUX_uxn_opcodes_h_l977_c7_6af7
t16_MUX_uxn_opcodes_h_l977_c7_6af7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond,
t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue,
t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse,
t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79
BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left,
BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right,
BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2
BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output);

-- n16_MUX_uxn_opcodes_h_l981_c7_03e5
n16_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l981_c7_03e5
tmp16_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5
result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4
BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output);

-- n16_MUX_uxn_opcodes_h_l985_c7_247c
n16_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l985_c7_247c_cond,
n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l985_c7_247c
tmp16_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond,
tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c
result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf
BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left,
BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right,
BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l987_c11_8968
BIN_OP_AND_uxn_opcodes_h_l987_c11_8968 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left,
BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right,
BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output);

-- sp_relative_shift_uxn_opcodes_h_l988_c30_1a27
sp_relative_shift_uxn_opcodes_h_l988_c30_1a27 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins,
sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x,
sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y,
sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b
BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654
result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output);

-- CONST_SR_8_uxn_opcodes_h_l996_c31_6c09
CONST_SR_8_uxn_opcodes_h_l996_c31_6c09 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x,
CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output,
 n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output,
 n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output,
 n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output,
 n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output,
 sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output,
 CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7f63 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_4a13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_29b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_e42d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_e059 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_27f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_452f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_d09d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_0846 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_f912_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_eabf_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1000_l952_DUPLICATE_cb29_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_d09d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l994_c3_d09d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_e42d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_e42d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_0846 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_0846;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_29b7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l970_c3_29b7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_27f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_27f0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_4a13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l966_c3_4a13;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_e059 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_e059;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7f63 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l961_c3_7f63;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l996_c31_6c09] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x <= VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output := CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l985_c11_23d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l988_c30_1a27] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_ins;
     sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_x;
     sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y <= VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output := sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_b5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c6_c11c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_abe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_be11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_cc2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_eabf LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_eabf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_c492_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l972_c11_96ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_c492_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c6_c11c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_be11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l972_c11_96ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_abe7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_b5a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_23d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_cc2b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l982_l986_l973_l978_DUPLICATE_9601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l981_l969_l972_l977_l993_DUPLICATE_f242_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_l993_DUPLICATE_3d96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l981_l969_l985_l972_l977_DUPLICATE_13df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_eabf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l981_l993_DUPLICATE_eabf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l981_l969_l972_l977_l956_l993_DUPLICATE_ac85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l988_c30_1a27_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_5654] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l996_c21_f912] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_f912_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l996_c31_6c09_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_5654] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l978_c3_1c79] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_left;
     BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output := BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_5654] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l986_c3_5cdf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_left;
     BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output := BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l978_c3_1c79_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right := VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l986_c3_5cdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l996_c21_f912_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l983_l974_DUPLICATE_dd2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_5654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_5654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_5654_return_output;
     -- n16_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output := n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l987_c11_8968] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_left;
     BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output := BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_5654] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output;

     -- t16_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_5654_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     -- n16_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l991_c21_452f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_452f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l987_c11_8968_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output := tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l991_c21_452f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_t16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- t16_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output := t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l985_c7_247c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output := result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_247c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_t16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     -- t16_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output := t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- n16_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l981_c7_03e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_n16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_03e5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output := n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6af7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6af7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l972_c7_cbea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output := result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- n16_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output := n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l972_c7_cbea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_5441] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output := tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_5441_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l956_c2_c492_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l956_c2_c492] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1000_l952_DUPLICATE_cb29 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1000_l952_DUPLICATE_cb29_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c2_c492_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l956_c2_c492_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1000_l952_DUPLICATE_cb29_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1000_l952_DUPLICATE_cb29_return_output;
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
