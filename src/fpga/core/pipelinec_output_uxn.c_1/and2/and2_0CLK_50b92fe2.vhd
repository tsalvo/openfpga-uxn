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
-- BIN_OP_EQ[uxn_opcodes_h_l940_c6_9a0d]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_6ec4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l953_c11_2670]
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_b7fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l956_c11_971a]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c7_56fc]
signal tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c7_56fc]
signal n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c7_56fc]
signal t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c7_56fc]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_56fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_56fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_56fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_56fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l961_c11_0271]
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_7d3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l962_c3_8118]
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l965_c11_0625]
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l965_c7_1d85]
signal tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l965_c7_1d85]
signal n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l965_c7_1d85]
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_1d85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_1d85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_1d85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_1d85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_8e7a]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_11cb]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_11cb]
signal n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_11cb]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_11cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_11cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_11cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_11cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l970_c3_d328]
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l971_c11_0a04]
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l972_c30_cec9]
signal sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_fece]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6935]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6935]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l980_c31_b3c4]
signal CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d
BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4
tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- n16_MUX_uxn_opcodes_h_l940_c2_6ec4
n16_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- t16_MUX_uxn_opcodes_h_l940_c2_6ec4
t16_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4
result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670
BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output);

-- tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe
tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- n16_MUX_uxn_opcodes_h_l953_c7_b7fe
n16_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- t16_MUX_uxn_opcodes_h_l953_c7_b7fe
t16_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe
result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a
BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c7_56fc
tmp16_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c7_56fc
n16_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c7_56fc
t16_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc
result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271
BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output);

-- tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f
tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- n16_MUX_uxn_opcodes_h_l961_c7_7d3f
n16_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- t16_MUX_uxn_opcodes_h_l961_c7_7d3f
t16_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f
result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l962_c3_8118
BIN_OP_OR_uxn_opcodes_h_l962_c3_8118 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left,
BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right,
BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625
BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output);

-- tmp16_MUX_uxn_opcodes_h_l965_c7_1d85
tmp16_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- n16_MUX_uxn_opcodes_h_l965_c7_1d85
n16_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85
result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a
BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_11cb
tmp16_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_11cb
n16_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb
result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l970_c3_d328
BIN_OP_OR_uxn_opcodes_h_l970_c3_d328 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left,
BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right,
BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04
BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left,
BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right,
BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output);

-- sp_relative_shift_uxn_opcodes_h_l972_c30_cec9
sp_relative_shift_uxn_opcodes_h_l972_c30_cec9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins,
sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x,
sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y,
sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece
BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output);

-- CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4
CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x,
CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output,
 tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output,
 tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output,
 tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output,
 tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output,
 BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output,
 sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output,
 CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_7cd8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_a771 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_2ed6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_3155 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_c201 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_9d96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_dc58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_c4e1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0860 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_1633_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_088f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l984_l936_DUPLICATE_d250_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_9d96 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_9d96;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0860 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0860;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_3155 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_3155;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_2ed6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_2ed6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_a771 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_a771;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_c201 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_c201;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_c4e1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_c4e1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_7cd8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_7cd8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l980_c31_b3c4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output := CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c6_9a0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c11_971a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l965_c11_0625] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_left;
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output := BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l961_c11_0271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_left;
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output := BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_8e7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l972_c30_cec9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_ins;
     sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_x;
     sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output := sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_fece] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_088f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_088f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l953_c11_2670] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_left;
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output := BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_9a0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_2670_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_971a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_0271_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_0625_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_8e7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_fece_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l970_l957_l966_l962_DUPLICATE_0332_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l977_l965_l961_l956_l953_DUPLICATE_3e33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l977_l969_l965_l961_l956_l953_DUPLICATE_3ec1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l969_l965_l961_l956_l953_DUPLICATE_41ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_088f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_088f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l977_l940_l965_l961_l956_l953_DUPLICATE_ad7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_cec9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6935] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l980_c21_1633] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_1633_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_b3c4_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l962_c3_8118] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_left;
     BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output := BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l970_c3_d328] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_left;
     BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output := BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_8118_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_d328_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_1633_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l967_l958_DUPLICATE_218a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6935_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6935] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l971_c11_0a04] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_left;
     BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output := BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6935_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l975_c21_dc58] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_dc58_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_0a04_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- n16_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- t16_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_dc58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_11cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;

     -- t16_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- n16_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_11cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l965_c7_1d85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output := result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_1d85_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     -- n16_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l961_c7_7d3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_7d3f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l956_c7_56fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_56fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l953_c7_b7fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_b7fe_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l940_c2_6ec4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l984_l936_DUPLICATE_d250 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l984_l936_DUPLICATE_d250_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_6ec4_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l984_l936_DUPLICATE_d250_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l984_l936_DUPLICATE_d250_return_output;
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
