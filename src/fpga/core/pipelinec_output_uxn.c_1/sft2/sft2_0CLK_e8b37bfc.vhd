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
-- Submodules: 64
entity sft2_0CLK_e8b37bfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e8b37bfc;
architecture arch of sft2_0CLK_e8b37bfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_1318]
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2274_c2_15b8]
signal n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_07db]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c7_6883]
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2287_c7_6883]
signal t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_6883]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_6883]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_6883]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_6883]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2287_c7_6883]
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c7_6883]
signal n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_ca80]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2290_c7_9bcc]
signal n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_769e]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2294_c7_fadf]
signal n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2296_c3_9407]
signal CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_b9da]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2298_c7_0eab]
signal n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2299_c3_13d9]
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2300_c30_409b]
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2301_c20_b0c9]
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2301_c12_6c18]
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2301_c36_f9af]
signal CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2301_c12_d8e3]
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_22bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_93d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_93d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_93d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_93d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2309_c31_5c95]
signal CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8
tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- t8_MUX_uxn_opcodes_h_l2274_c2_15b8
t8_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- n16_MUX_uxn_opcodes_h_l2274_c2_15b8
n16_MUX_uxn_opcodes_h_l2274_c2_15b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond,
n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue,
n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse,
n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c7_6883
tmp16_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- t8_MUX_uxn_opcodes_h_l2287_c7_6883
t8_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c7_6883
n16_MUX_uxn_opcodes_h_l2287_c7_6883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond,
n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc
tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- t8_MUX_uxn_opcodes_h_l2290_c7_9bcc
t8_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- n16_MUX_uxn_opcodes_h_l2290_c7_9bcc
n16_MUX_uxn_opcodes_h_l2290_c7_9bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond,
n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue,
n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse,
n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf
tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- n16_MUX_uxn_opcodes_h_l2294_c7_fadf
n16_MUX_uxn_opcodes_h_l2294_c7_fadf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond,
n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue,
n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse,
n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2296_c3_9407
CONST_SL_8_uxn_opcodes_h_l2296_c3_9407 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x,
CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab
tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- n16_MUX_uxn_opcodes_h_l2298_c7_0eab
n16_MUX_uxn_opcodes_h_l2298_c7_0eab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond,
n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue,
n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse,
n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9
BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left,
BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right,
BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2300_c30_409b
sp_relative_shift_uxn_opcodes_h_l2300_c30_409b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins,
sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x,
sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y,
sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9
BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left,
BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right,
BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18
BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left,
BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right,
BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af
CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x,
CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3
BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left,
BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right,
BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95
CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x,
CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output,
 tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output,
 tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output,
 CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output,
 tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output,
 sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output,
 CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_5adb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_e0d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b7d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_c9aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_fbca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_0504_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_54d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_0cd2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_ea79_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_affa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_4dcb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2269_l2313_DUPLICATE_af53_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_5adb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2279_c3_5adb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_fbca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_fbca;
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_0cd2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2307_c3_0cd2;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_54d0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2308_c3_54d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_c9aa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_c9aa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b7d7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b7d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_e0d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_e0d8;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_769e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2300_c30_409b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_ins;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_x;
     sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output := sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_07db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output := result.is_ram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2301_c20_b0c9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_left;
     BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output := BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_affa LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_affa_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_4dcb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_4dcb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_b9da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2306_c11_22bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_1318] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_left;
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output := BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_ca80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l2309_c31_5c95] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output := CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output := result.is_vram_write;

     -- CONST_SR_4[uxn_opcodes_h_l2301_c36_f9af] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output := CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2301_c20_b0c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_1318_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_07db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_ca80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_769e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_b9da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2306_c11_22bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_affa_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2299_l2295_DUPLICATE_affa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2306_l2294_l2287_DUPLICATE_43e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2306_l2298_l2294_l2290_l2287_DUPLICATE_a819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2290_l2294_l2287_DUPLICATE_58b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_4dcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2306_l2294_DUPLICATE_4dcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2306_l2294_l2290_l2287_l2274_DUPLICATE_6ca7_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right := VAR_CONST_SR_4_uxn_opcodes_h_l2301_c36_f9af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2274_c2_15b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2300_c30_409b_return_output;
     -- t8_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2306_c7_93d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2296_c3_9407] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output := CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2299_c3_13d9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_left;
     BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output := BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2306_c7_93d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2309_c21_ea79] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_ea79_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2309_c31_5c95_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2306_c7_93d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2299_c3_13d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2309_c21_ea79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2296_c3_9407_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     -- n16_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2301_c12_6c18] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_left;
     BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output := BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2306_c7_93d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- t8_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2301_c12_6c18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2306_c7_93d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     -- n16_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2301_c12_d8e3] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_left;
     BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output := BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2304_c21_0504] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_0504_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2301_c12_d8e3_return_output);

     -- n16_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2304_c21_0504_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2298_c7_0eab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- n16_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2298_c7_0eab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2294_c7_fadf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2294_c7_fadf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2290_c7_9bcc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2290_c7_9bcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2287_c7_6883] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output := result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2287_c7_6883_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2274_c2_15b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2269_l2313_DUPLICATE_af53 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2269_l2313_DUPLICATE_af53_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_15b8_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2269_l2313_DUPLICATE_af53_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2269_l2313_DUPLICATE_af53_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
