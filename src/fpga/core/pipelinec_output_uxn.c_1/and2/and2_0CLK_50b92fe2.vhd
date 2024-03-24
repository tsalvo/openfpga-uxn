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
-- BIN_OP_EQ[uxn_opcodes_h_l940_c6_91f8]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l940_c2_af67]
signal t16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l940_c2_af67]
signal n16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c2_af67]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l940_c2_af67]
signal tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l953_c11_ed56]
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l953_c7_8a9b]
signal tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l956_c11_f9fb]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c7_70f7]
signal t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c7_70f7]
signal n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_70f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_70f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_70f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_70f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c7_70f7]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c7_70f7]
signal tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l961_c11_53c9]
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l961_c7_b296]
signal t16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l961_c7_b296]
signal n16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_b296]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_b296]
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_b296]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_b296]
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l961_c7_b296]
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l961_c7_b296]
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l962_c3_a641]
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l965_c11_5afc]
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l965_c7_6ebb]
signal tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_af8c]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_51b3]
signal n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_51b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_51b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_51b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_51b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_51b3]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_51b3]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l970_c3_a0a6]
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l971_c11_71b7]
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l972_c30_23f9]
signal sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_e280]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_e72e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_e72e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_e72e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_e72e]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l980_c31_f778]
signal CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8
BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output);

-- t16_MUX_uxn_opcodes_h_l940_c2_af67
t16_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l940_c2_af67_cond,
t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- n16_MUX_uxn_opcodes_h_l940_c2_af67
n16_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l940_c2_af67_cond,
n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67
result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l940_c2_af67
tmp16_MUX_uxn_opcodes_h_l940_c2_af67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond,
tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue,
tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse,
tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56
BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output);

-- t16_MUX_uxn_opcodes_h_l953_c7_8a9b
t16_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- n16_MUX_uxn_opcodes_h_l953_c7_8a9b
n16_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b
result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b
tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond,
tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue,
tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse,
tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb
BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c7_70f7
t16_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c7_70f7
n16_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7
result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c7_70f7
tmp16_MUX_uxn_opcodes_h_l956_c7_70f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond,
tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9
BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output);

-- t16_MUX_uxn_opcodes_h_l961_c7_b296
t16_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l961_c7_b296_cond,
t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- n16_MUX_uxn_opcodes_h_l961_c7_b296
n16_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l961_c7_b296_cond,
n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- tmp16_MUX_uxn_opcodes_h_l961_c7_b296
tmp16_MUX_uxn_opcodes_h_l961_c7_b296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond,
tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue,
tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse,
tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l962_c3_a641
BIN_OP_OR_uxn_opcodes_h_l962_c3_a641 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left,
BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right,
BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc
BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output);

-- n16_MUX_uxn_opcodes_h_l965_c7_6ebb
n16_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb
result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb
tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond,
tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue,
tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse,
tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c
BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_51b3
n16_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3
result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_51b3
tmp16_MUX_uxn_opcodes_h_l969_c7_51b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6
BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left,
BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right,
BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7
BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left,
BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right,
BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l972_c30_23f9
sp_relative_shift_uxn_opcodes_h_l972_c30_23f9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins,
sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x,
sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y,
sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280
BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e
result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l980_c31_f778
CONST_SR_8_uxn_opcodes_h_l980_c31_f778 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x,
CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output,
 t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output,
 t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output,
 t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output,
 t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output,
 BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output,
 n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output,
 sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output,
 CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_5744 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_66df : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_ce82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_ef33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_2340 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_223a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_75f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_745c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_1a03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_aa71_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_81cc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l984_l936_DUPLICATE_60e1_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_66df := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_66df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_ef33 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_ef33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_1a03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_1a03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_223a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_223a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_5744 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_5744;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_ce82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_ce82;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_745c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_745c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_2340 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_2340;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_e280] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l972_c30_23f9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_ins;
     sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_x;
     sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output := sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_81cc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_81cc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l961_c11_53c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c6_91f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l965_c11_5afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_left;
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output := BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c11_f9fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_af67_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_af8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l980_c31_f778] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x <= VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output := CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_af67_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l953_c11_ed56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_left;
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output := BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_91f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_ed56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_f9fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_53c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_5afc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_af8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_e280_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l966_l957_l970_l962_DUPLICATE_a75f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l961_l956_l953_l977_l965_DUPLICATE_49cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l961_l956_l953_l977_l969_l965_DUPLICATE_121d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l961_l956_l953_l969_l965_DUPLICATE_c652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_81cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_81cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l961_l956_l953_l940_l977_l965_DUPLICATE_7975_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_23f9_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l970_c3_a0a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_left;
     BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output := BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l962_c3_a641] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_left;
     BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output := BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l980_c21_aa71] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_aa71_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_f778_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_e72e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_e72e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_e72e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_a641_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_a0a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_aa71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_7824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_e72e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- t16_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output := t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l971_c11_71b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_left;
     BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output := BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_e72e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     -- t16_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l975_c21_75f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_75f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_71b7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- n16_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_75f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_n16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- n16_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output := n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- t16_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_51b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_51b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_t16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output := tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output := t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- n16_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l965_c7_6ebb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output := result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_6ebb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- n16_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l961_c7_b296] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_cond;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output := result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b296_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l956_c7_70f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output := n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_70f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l953_c7_8a9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output := tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_8a9b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_af67_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l940_c2_af67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l984_l936_DUPLICATE_60e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l984_l936_DUPLICATE_60e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_af67_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_af67_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l984_l936_DUPLICATE_60e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l984_l936_DUPLICATE_60e1_return_output;
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
