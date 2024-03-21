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
entity sft2_0CLK_af0d23d3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_af0d23d3;
architecture arch of sft2_0CLK_af0d23d3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_ad4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_cf87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_7af9]
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2265_c7_6379]
signal n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2265_c7_6379]
signal t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2265_c7_6379]
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_6379]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_6379]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_6379]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_6379]
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_6379]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_1868]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_1ecb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_8a18]
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_e9ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2274_c3_3491]
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_dc7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_fe43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2277_c3_b032]
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2278_c30_ec40]
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2279_c20_6f29]
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2279_c12_8b6d]
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2279_c36_3ffc]
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2279_c12_bbdb]
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_d0b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_da35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_da35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_da35]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_da35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2287_c31_af9d]
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c2_cf87
n16_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- t8_MUX_uxn_opcodes_h_l2252_c2_cf87
t8_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87
tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output);

-- n16_MUX_uxn_opcodes_h_l2265_c7_6379
n16_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- t8_MUX_uxn_opcodes_h_l2265_c7_6379
t8_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2265_c7_6379
tmp16_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c7_1ecb
n16_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c7_1ecb
t8_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb
tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output);

-- n16_MUX_uxn_opcodes_h_l2272_c7_e9ee
n16_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee
tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2274_c3_3491
CONST_SL_8_uxn_opcodes_h_l2274_c3_3491 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x,
CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output);

-- n16_MUX_uxn_opcodes_h_l2276_c7_fe43
n16_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43
tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032
BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40
sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins,
sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x,
sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y,
sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29
BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc
CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x,
CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb
BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d
CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x,
CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output,
 n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output,
 n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output,
 CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output,
 n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output,
 sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output,
 CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output,
 CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_286e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_d220 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_371a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_feb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_4be6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_01e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_e0f7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_5f6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_694a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_5d1f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_015c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2291_l2247_DUPLICATE_6263_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_371a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_371a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_4be6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_4be6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right := to_unsigned(15, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_feb6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_feb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_e0f7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_e0f7;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_5f6e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_5f6e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_286e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_286e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_d220 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_d220;
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l2279_c20_6f29] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_left;
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output := BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_015c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_015c_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2287_c31_af9d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output := CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_8a18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_1868] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_ad4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_dc7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2278_c30_ec40] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_ins;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_x;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output := sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_5d1f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_5d1f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_d0b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output := result.is_ram_write;

     -- CONST_SR_4[uxn_opcodes_h_l2279_c36_3ffc] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output := CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_7af9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_6f29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_ad4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7af9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1868_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_8a18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_dc7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_d0b8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_5d1f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_5d1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_97ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2284_l2276_DUPLICATE_ac07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_ca23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_015c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_015c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_956b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right := VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_3ffc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_cf87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_ec40_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_da35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_da35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2277_c3_b032] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_left;
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output := BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2274_c3_3491] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output := CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_da35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;

     -- t8_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2287_c21_694a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_694a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_af9d_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_b032_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_694a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_3491_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_da35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- t8_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2279_c12_8b6d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_left;
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output := BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8b6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_da35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- t8_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2279_c12_bbdb] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_left;
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output := BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2282_c21_01e3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_01e3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_bbdb_return_output);

     -- n16_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_01e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- n16_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_fe43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output := result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_fe43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     -- n16_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_e9ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_e9ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_1ecb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_1ecb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_6379] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output := result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_6379_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_cf87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2291_l2247_DUPLICATE_6263 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2291_l2247_DUPLICATE_6263_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_cf87_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2291_l2247_DUPLICATE_6263_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2291_l2247_DUPLICATE_6263_return_output;
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
