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
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_c9a8]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_8674]
signal t16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_8674]
signal n16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_8674]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_8674]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_4f69]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_6f50]
signal t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_6f50]
signal n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_6f50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_6f50]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_6f50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_6f50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_6f50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_6f50]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_f4e0]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_e215]
signal t16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_e215]
signal n16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_e215]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_e215]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_e215]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_e215]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_e215]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_e215]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_7ca6]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_fb67]
signal t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_fb67]
signal n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_fb67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_fb67]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_fb67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_fb67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_fb67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_fb67]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_2257]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_d2ff]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_8ad5]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_9b9e]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_4bd8]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_aeec]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_4e24]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_d8a7]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_9be2]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_eb3d]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_eb3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_eb3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_eb3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_d3ed]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8
BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_8674
t16_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_8674_cond,
t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_8674
n16_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_8674_cond,
n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674
result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_8674
tmp16_MUX_uxn_opcodes_h_l853_c2_8674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_6f50
t16_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_6f50
n16_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50
result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_6f50
tmp16_MUX_uxn_opcodes_h_l866_c7_6f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0
BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_e215
t16_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_e215_cond,
t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_e215
n16_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_e215_cond,
n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215
result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_e215
tmp16_MUX_uxn_opcodes_h_l869_c7_e215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6
BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_fb67
t16_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_fb67
n16_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67
result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_fb67
tmp16_MUX_uxn_opcodes_h_l874_c7_fb67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_2257
BIN_OP_OR_uxn_opcodes_h_l875_c3_2257 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff
BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_8ad5
n16_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5
result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5
tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_4bd8
n16_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8
result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8
tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec
BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7
sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2
BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d
result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed
CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_b249 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a88a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_0546 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_4887 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_8569 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_fb88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_03f9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_8103_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_a0ce : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5d2d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3ed9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_94d5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l849_l897_DUPLICATE_a328_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_a0ce := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_a0ce;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5d2d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_5d2d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_8569 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_8569;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_b249 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_b249;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a88a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_a88a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_fb88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_fb88;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_4887 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_4887;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_0546 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_0546;
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_94d5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_94d5_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_d8a7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_8674_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_c9a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_d2ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_9b9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_f4e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_4f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_9be2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_7ca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_8674_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l893_c31_d3ed] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_c9a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4f69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_f4e0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_7ca6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_d2ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_9b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_9be2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l883_l870_DUPLICATE_a1af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l866_l890_l878_l874_l869_DUPLICATE_3719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l866_l890_l882_l878_l874_l869_DUPLICATE_b24b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l866_l882_l878_l874_l869_DUPLICATE_2b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_94d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_94d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l866_l853_l890_l878_l874_l869_DUPLICATE_586e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_d8a7_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_3ed9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3ed9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_d3ed_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_eb3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_2257] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_aeec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_eb3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_eb3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_2257_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_aeec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_3ed9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l880_l871_DUPLICATE_827a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_eb3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_4e24] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_03f9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_4e24_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_eb3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_03f9;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output := t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- n16_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_8103] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_8103_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_03f9);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_8103_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_4bd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_4bd8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output := n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- t16_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output := t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_8ad5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_8ad5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_fb67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_fb67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output := n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_e215] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_e215_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_6f50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_6f50_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_8674_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_8674] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l849_l897_DUPLICATE_a328 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l849_l897_DUPLICATE_a328_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_8674_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_8674_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l849_l897_DUPLICATE_a328_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l849_l897_DUPLICATE_a328_return_output;
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
