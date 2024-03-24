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
-- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_94c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2252_c2_72e4]
signal t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_f6bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2265_c7_dbff]
signal t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_1ca7]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c7_f6ed]
signal t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_3a19]
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2272_c7_11e8]
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2274_c3_0571]
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_cf1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2276_c7_98ff]
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2277_c3_c173]
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2278_c30_3cbd]
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2279_c20_f557]
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2279_c12_e4f2]
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2279_c36_4cd5]
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2279_c12_9563]
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_0002]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_edea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_edea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_edea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_edea]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2287_c31_9c41]
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c2_72e4
n16_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4
tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- t8_MUX_uxn_opcodes_h_l2252_c2_72e4
t8_MUX_uxn_opcodes_h_l2252_c2_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond,
t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue,
t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse,
t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output);

-- n16_MUX_uxn_opcodes_h_l2265_c7_dbff
n16_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff
tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- t8_MUX_uxn_opcodes_h_l2265_c7_dbff
t8_MUX_uxn_opcodes_h_l2265_c7_dbff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond,
t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue,
t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse,
t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c7_f6ed
n16_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed
tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c7_f6ed
t8_MUX_uxn_opcodes_h_l2268_c7_f6ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond,
t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right,
BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output);

-- n16_MUX_uxn_opcodes_h_l2272_c7_11e8
n16_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8
tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond,
tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2274_c3_0571
CONST_SL_8_uxn_opcodes_h_l2274_c3_0571 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x,
CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output);

-- n16_MUX_uxn_opcodes_h_l2276_c7_98ff
n16_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff
tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond,
tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173
BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right,
BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd
sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins,
sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x,
sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y,
sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557
BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right,
BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2
BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right,
BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5
CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x,
CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563
BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right,
BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41
CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x,
CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output,
 n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output,
 n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output,
 CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output,
 n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output,
 sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output,
 CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output,
 CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_37cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_c8f3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_6321 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_e5db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_178c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_a824_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_638a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_d0d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_46c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_5160_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_ad96_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2247_l2291_DUPLICATE_d029_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_6321 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2266_c3_6321;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_c8f3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2257_c3_c8f3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_d0d0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_d0d0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_e5db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2270_c3_e5db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_178c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_178c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_638a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2285_c3_638a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_37cd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2262_c3_37cd;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c11_1ca7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2265_c11_f6bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2279_c20_f557] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_left;
     BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output := BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2272_c11_3a19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c6_94c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2287_c31_9c41] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output := CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_5160 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_5160_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2276_c11_cf1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2278_c30_3cbd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_ins;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_x;
     sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output := sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_ad96 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_ad96_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_0002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2279_c36_4cd5] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output := CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2279_c20_f557_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c6_94c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2265_c11_f6bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c11_1ca7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2272_c11_3a19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2276_c11_cf1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_0002_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_5160_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2277_l2273_DUPLICATE_5160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2265_l2268_l2284_l2272_DUPLICATE_72b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2276_l2272_l2268_l2265_l2284_DUPLICATE_d5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2265_l2276_l2268_l2272_DUPLICATE_480c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_ad96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2284_l2272_DUPLICATE_ad96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2272_l2268_l2265_l2252_l2284_DUPLICATE_b607_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right := VAR_CONST_SR_4_uxn_opcodes_h_l2279_c36_4cd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2252_c2_72e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2278_c30_3cbd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_edea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2274_c3_0571] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output := CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_edea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2277_c3_c173] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_left;
     BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output := BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_edea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2287_c21_46c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_46c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2287_c31_9c41_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2277_c3_c173_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2287_c21_46c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2274_c3_0571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2279_c12_e4f2] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_left;
     BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output := BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output;

     -- t8_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_edea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;

     -- n16_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2279_c12_e4f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_edea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2279_c12_9563] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_left;
     BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output := BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2282_c21_a824] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_a824_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2279_c12_9563_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- n16_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2282_c21_a824_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2276_c7_98ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2276_c7_98ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2272_c7_11e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2272_c7_11e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c7_f6ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c7_f6ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2265_c7_dbff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2265_c7_dbff_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c2_72e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2247_l2291_DUPLICATE_d029 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2247_l2291_DUPLICATE_d029_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c2_72e4_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2247_l2291_DUPLICATE_d029_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2247_l2291_DUPLICATE_d029_return_output;
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
