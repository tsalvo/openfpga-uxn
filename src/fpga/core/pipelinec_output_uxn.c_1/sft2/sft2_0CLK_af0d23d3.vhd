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
-- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_8050]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c2_d28b]
signal n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_7802]
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_04de]
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_04de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_04de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_04de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_04de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2265_c7_04de]
signal t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2265_c7_04de]
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2265_c7_04de]
signal n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_a614]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c7_d5a7]
signal n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_85a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_0576]
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_0576]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_0576]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_0576]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_0576]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2272_c7_0576]
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2272_c7_0576]
signal n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2274_c3_cbac]
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_b44e]
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2276_c7_41c1]
signal n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2277_c3_0d48]
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2278_c30_6ae1]
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2279_c20_deb7]
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2279_c12_74c3]
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2279_c36_9959]
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2279_c12_3e9c]
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_4299]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_4b18]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_4b18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_4b18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_4b18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2287_c31_472e]
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- t8_MUX_uxn_opcodes_h_l2252_c2_d28b
t8_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b
tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c2_d28b
n16_MUX_uxn_opcodes_h_l2252_c2_d28b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond,
n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- t8_MUX_uxn_opcodes_h_l2265_c7_04de
t8_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2265_c7_04de
tmp16_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- n16_MUX_uxn_opcodes_h_l2265_c7_04de
n16_MUX_uxn_opcodes_h_l2265_c7_04de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond,
n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue,
n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse,
n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c7_d5a7
t8_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7
tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c7_d5a7
n16_MUX_uxn_opcodes_h_l2268_c7_d5a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond,
n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2272_c7_0576
tmp16_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- n16_MUX_uxn_opcodes_h_l2272_c7_0576
n16_MUX_uxn_opcodes_h_l2272_c7_0576 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond,
n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue,
n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse,
n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac
CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x,
CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1
tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2276_c7_41c1
n16_MUX_uxn_opcodes_h_l2276_c7_41c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond,
n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue,
n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse,
n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48
BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1
sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins,
sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x,
sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y,
sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7
BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3
BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2279_c36_9959
CONST_SR_4_uxn_opcodes_h_l2279_c36_9959 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x,
CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c
BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2287_c31_472e
CONST_SR_8_uxn_opcodes_h_l2287_c31_472e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x,
CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output,
 CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output,
 sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output,
 CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output,
 CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_8d1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_2290 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_7612 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_80b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_e949 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_06ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_4fe0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_0a3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ad1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_f996_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_bc71_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2291_l2247_DUPLICATE_c92d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_e949 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_e949;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_8d1b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_8d1b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_0a3c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_0a3c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_7612 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_7612;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_80b2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_80b2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_2290 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_2290;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_4fe0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_4fe0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_b44e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_85a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_f996 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_f996_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_4299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2279_c20_deb7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_left;
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output := BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output := result.u8_value;

     -- CONST_SR_4[uxn_opcodes_h_l2279_c36_9959] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output := CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_8050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_bc71 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_bc71_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2287_c31_472e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output := CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2278_c30_6ae1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_ins;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_x;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output := sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_a614] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_7802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_left;
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output := BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_deb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_8050_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_7802_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_a614_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_85a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_b44e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_4299_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_f996_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2273_l2277_DUPLICATE_f996_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2268_l2284_l2272_l2265_DUPLICATE_d5af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2276_l2272_l2268_l2265_DUPLICATE_91a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2268_l2272_l2265_l2276_DUPLICATE_adae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_bc71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_bc71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2272_l2268_l2265_l2252_DUPLICATE_498b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right := VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_9959_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_d28b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_6ae1_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2287_c21_ad1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ad1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_472e_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2274_c3_cbac] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output := CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output;

     -- t8_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2277_c3_0d48] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_left;
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output := BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_4b18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_4b18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_4b18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_0d48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_ad1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_cbac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_4b18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2279_c12_74c3] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_left;
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output := BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_74c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_4b18_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2279_c12_3e9c] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_left;
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output := BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- t8_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2282_c21_06ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_06ab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_3e9c_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_06ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- n16_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_41c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_41c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_0576] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output := result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_0576_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_d5a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_d5a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_04de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_04de_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_d28b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2291_l2247_DUPLICATE_c92d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2291_l2247_DUPLICATE_c92d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_d28b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2291_l2247_DUPLICATE_c92d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2291_l2247_DUPLICATE_c92d_return_output;
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
