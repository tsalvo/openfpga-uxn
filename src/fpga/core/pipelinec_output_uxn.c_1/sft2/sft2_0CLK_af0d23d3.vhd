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
-- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_a0f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_9d18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_f954]
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_64dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_4a13]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c7_8246]
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c7_8246]
signal n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c7_8246]
signal t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_8246]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_8246]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_8246]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_8246]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_8246]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_dc4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2272_c7_2901]
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2272_c7_2901]
signal n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_2901]
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_2901]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_2901]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_2901]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_2901]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2274_c3_4f4e]
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_4fb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_77ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2277_c3_94a2]
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2278_c30_56c4]
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2279_c20_85ab]
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2279_c12_8a71]
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2279_c36_7933]
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2279_c12_7fbe]
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_ea7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_a934]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_a934]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_a934]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_a934]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2287_c31_9620]
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18
tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c2_9d18
n16_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- t8_MUX_uxn_opcodes_h_l2252_c2_9d18
t8_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd
tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2265_c7_64dd
n16_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- t8_MUX_uxn_opcodes_h_l2265_c7_64dd
t8_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c7_8246
tmp16_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c7_8246
n16_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c7_8246
t8_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2272_c7_2901
tmp16_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- n16_MUX_uxn_opcodes_h_l2272_c7_2901
n16_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e
CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x,
CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad
tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- n16_MUX_uxn_opcodes_h_l2276_c7_77ad
n16_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2
BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4
sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins,
sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x,
sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y,
sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab
BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2279_c36_7933
CONST_SR_4_uxn_opcodes_h_l2279_c36_7933 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x,
CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe
BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2287_c31_9620
CONST_SR_8_uxn_opcodes_h_l2287_c31_9620 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x,
CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output,
 tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output,
 CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output,
 CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output,
 CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_2fae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_07f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_e796 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_dc0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5b3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_2577_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_8336 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_379f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ff28_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_b836_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_f1c0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2291_l2247_DUPLICATE_1a3d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_e796 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_e796;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_dc0d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_dc0d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5b3c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5b3c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_2fae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_2fae;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_8336 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_8336;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right := to_unsigned(15, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_379f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_379f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_07f3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_07f3;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_b836 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_b836_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2287_c31_9620] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output := CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output := result.is_pc_updated;

     -- BIN_OP_AND[uxn_opcodes_h_l2279_c20_85ab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_left;
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output := BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2278_c30_56c4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_ins;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_x;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output := sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_f1c0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_f1c0_return_output := result.stack_address_sp_offset;

     -- CONST_SR_4[uxn_opcodes_h_l2279_c36_7933] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output := CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_f954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_left;
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output := BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_ea7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_a0f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_dc4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_4a13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_4fb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_85ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_a0f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f954_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_4a13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_dc4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_4fb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_ea7c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_b836_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_b836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2272_l2265_l2268_DUPLICATE_2c83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2265_l2284_l2276_l2272_l2268_DUPLICATE_dea4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2272_l2265_l2276_l2268_DUPLICATE_b0f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_f1c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_f1c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2265_l2252_l2284_l2272_l2268_DUPLICATE_7e82_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right := VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_7933_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_9d18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_56c4_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2277_c3_94a2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_left;
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output := BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_a934] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2287_c21_ff28] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ff28_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9620_return_output);

     -- t8_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_a934] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_a934] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2274_c3_4f4e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output := CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_94a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ff28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_4f4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- t8_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_a934] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;

     -- n16_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2279_c12_8a71] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_left;
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output := BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_8a71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_a934_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2279_c12_7fbe] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_left;
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output := BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output;

     -- t8_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- n16_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2282_c21_2577] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_2577_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_7fbe_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- n16_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_2577_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     -- n16_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_77ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_77ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_2901] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output := result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_2901_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_8246] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_8246_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_64dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_64dd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_9d18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2291_l2247_DUPLICATE_1a3d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2291_l2247_DUPLICATE_1a3d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_9d18_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2291_l2247_DUPLICATE_1a3d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2291_l2247_DUPLICATE_1a3d_return_output;
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
