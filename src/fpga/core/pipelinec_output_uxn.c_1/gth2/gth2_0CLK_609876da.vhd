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
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1862_c6_52de]
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1862_c2_2dec]
signal t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1875_c11_e566]
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1875_c7_72b8]
signal t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_57f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1878_c7_5b57]
signal t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_23f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1883_c7_2cc4]
signal t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1884_c3_3436]
signal BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_7c45]
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1887_c7_e8fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_ff6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c7_07d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1892_c3_2ec3]
signal BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1893_c30_cedf]
signal sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1896_c21_d249]
signal BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1896_c21_461a]
signal MUX_uxn_opcodes_h_l1896_c21_461a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1896_c21_461a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1896_c21_461a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1896_c21_461a_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de
BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left,
BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right,
BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output);

-- n16_MUX_uxn_opcodes_h_l1862_c2_2dec
n16_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec
result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec
result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- t16_MUX_uxn_opcodes_h_l1862_c2_2dec
t16_MUX_uxn_opcodes_h_l1862_c2_2dec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond,
t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue,
t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse,
t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left,
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right,
BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output);

-- n16_MUX_uxn_opcodes_h_l1875_c7_72b8
n16_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8
result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8
result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8
result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- t16_MUX_uxn_opcodes_h_l1875_c7_72b8
t16_MUX_uxn_opcodes_h_l1875_c7_72b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond,
t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue,
t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse,
t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1878_c7_5b57
n16_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- t16_MUX_uxn_opcodes_h_l1878_c7_5b57
t16_MUX_uxn_opcodes_h_l1878_c7_5b57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond,
t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue,
t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse,
t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output);

-- n16_MUX_uxn_opcodes_h_l1883_c7_2cc4
n16_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- t16_MUX_uxn_opcodes_h_l1883_c7_2cc4
t16_MUX_uxn_opcodes_h_l1883_c7_2cc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond,
t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue,
t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse,
t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436
BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left,
BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right,
BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output);

-- n16_MUX_uxn_opcodes_h_l1887_c7_e8fd
n16_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1891_c7_07d2
n16_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3
BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left,
BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right,
BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf
sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins,
sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x,
sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y,
sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249
BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left,
BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right,
BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output);

-- MUX_uxn_opcodes_h_l1896_c21_461a
MUX_uxn_opcodes_h_l1896_c21_461a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1896_c21_461a_cond,
MUX_uxn_opcodes_h_l1896_c21_461a_iftrue,
MUX_uxn_opcodes_h_l1896_c21_461a_iffalse,
MUX_uxn_opcodes_h_l1896_c21_461a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59
CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output,
 n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output,
 n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output,
 n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output,
 n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output,
 n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output,
 n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output,
 MUX_uxn_opcodes_h_l1896_c21_461a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_eceb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1867_c3_fc65 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_15d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_f1ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1885_c3_4a90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_2ea2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1896_c21_461a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1896_c21_461a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1891_DUPLICATE_5a44_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1900_l1858_DUPLICATE_d13e_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_eceb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_eceb;
     VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1885_c3_4a90 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1885_c3_4a90;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_f1ae := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_f1ae;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_2ea2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1895_c3_2ea2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1867_c3_fc65 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1867_c3_fc65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_15d4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_15d4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y := resize(to_signed(-3, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1862_c6_52de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1875_c11_e566] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_left;
     BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output := BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_ff6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_23f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_7c45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1891_DUPLICATE_5a44 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1891_DUPLICATE_5a44_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_57f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1893_c30_cedf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_ins;
     sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_x;
     sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output := sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c6_52de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1875_c11_e566_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_57f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_23f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_7c45_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_ff6a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1879_l1888_l1892_l1884_DUPLICATE_1117_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_4c05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2c58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_DUPLICATE_2504_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1891_DUPLICATE_5a44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1891_DUPLICATE_5a44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1887_l1883_l1878_l1875_l1862_DUPLICATE_fc09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1862_c2_2dec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1893_c30_cedf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1884_c3_3436] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_left;
     BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output := BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1892_c3_2ec3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_left;
     BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output := BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1884_c3_3436_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1892_c3_2ec3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1880_l1889_DUPLICATE_dd59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1896_c21_d249] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_left;
     BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output := BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1896_c21_461a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1896_c21_d249_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     -- MUX[uxn_opcodes_h_l1896_c21_461a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1896_c21_461a_cond <= VAR_MUX_uxn_opcodes_h_l1896_c21_461a_cond;
     MUX_uxn_opcodes_h_l1896_c21_461a_iftrue <= VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iftrue;
     MUX_uxn_opcodes_h_l1896_c21_461a_iffalse <= VAR_MUX_uxn_opcodes_h_l1896_c21_461a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1896_c21_461a_return_output := MUX_uxn_opcodes_h_l1896_c21_461a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue := VAR_MUX_uxn_opcodes_h_l1896_c21_461a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- t16_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_07d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_07d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1887_c7_e8fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e8fd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_2cc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_2cc4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1878_c7_5b57] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output := result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_5b57_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1875_c7_72b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1875_c7_72b8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1862_c2_2dec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output := result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1900_l1858_DUPLICATE_d13e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1900_l1858_DUPLICATE_d13e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1862_c2_2dec_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1900_l1858_DUPLICATE_d13e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1900_l1858_DUPLICATE_d13e_return_output;
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
