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
-- BIN_OP_EQ[uxn_opcodes_h_l940_c6_3600]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l940_c2_5ea0]
signal t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l953_c11_9e36]
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l953_c7_2125]
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_2125]
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_2125]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_2125]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_2125]
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l953_c7_2125]
signal tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l953_c7_2125]
signal n16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l953_c7_2125]
signal t16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l956_c11_9011]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c7_a366]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_a366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_a366]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_a366]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_a366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c7_a366]
signal tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c7_a366]
signal n16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c7_a366]
signal t16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l961_c11_8a70]
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l961_c7_b0fc]
signal t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l962_c3_9729]
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l965_c11_1e59]
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l965_c7_4be3]
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_4be3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_4be3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_4be3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_4be3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l965_c7_4be3]
signal tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l965_c7_4be3]
signal n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_5e18]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_f82a]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_f82a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_f82a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_f82a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_f82a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_f82a]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_f82a]
signal n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l970_c3_fe3f]
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l971_c11_c0cf]
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l972_c30_19ca]
signal sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_0500]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_62d9]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_62d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_62d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_62d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l980_c31_9d5b]
signal CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600
BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0
result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0
tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- n16_MUX_uxn_opcodes_h_l940_c2_5ea0
n16_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- t16_MUX_uxn_opcodes_h_l940_c2_5ea0
t16_MUX_uxn_opcodes_h_l940_c2_5ea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond,
t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue,
t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse,
t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36
BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125
result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- tmp16_MUX_uxn_opcodes_h_l953_c7_2125
tmp16_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond,
tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- n16_MUX_uxn_opcodes_h_l953_c7_2125
n16_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l953_c7_2125_cond,
n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- t16_MUX_uxn_opcodes_h_l953_c7_2125
t16_MUX_uxn_opcodes_h_l953_c7_2125 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l953_c7_2125_cond,
t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue,
t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse,
t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011
BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366
result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c7_a366
tmp16_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond,
tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c7_a366
n16_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c7_a366_cond,
n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c7_a366
t16_MUX_uxn_opcodes_h_l956_c7_a366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c7_a366_cond,
t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue,
t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse,
t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70
BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc
tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- n16_MUX_uxn_opcodes_h_l961_c7_b0fc
n16_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- t16_MUX_uxn_opcodes_h_l961_c7_b0fc
t16_MUX_uxn_opcodes_h_l961_c7_b0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond,
t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue,
t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse,
t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l962_c3_9729
BIN_OP_OR_uxn_opcodes_h_l962_c3_9729 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left,
BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right,
BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59
BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3
result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l965_c7_4be3
tmp16_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- n16_MUX_uxn_opcodes_h_l965_c7_4be3
n16_MUX_uxn_opcodes_h_l965_c7_4be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond,
n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue,
n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse,
n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18
BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a
result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_f82a
tmp16_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_f82a
n16_MUX_uxn_opcodes_h_l969_c7_f82a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond,
n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f
BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left,
BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right,
BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf
BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left,
BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right,
BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l972_c30_19ca
sp_relative_shift_uxn_opcodes_h_l972_c30_19ca : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins,
sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x,
sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y,
sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500
BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9
result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b
CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x,
CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output,
 sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output,
 CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_c6ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_e308 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_29f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_414d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_846e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_da03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_719b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0211 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4f5d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_76f1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_eaa9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l984_l936_DUPLICATE_b3ef_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_e308 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_e308;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0211 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_0211;
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_c6ba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_c6ba;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_29f9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_29f9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_846e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_846e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4f5d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_4f5d;
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_da03 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_da03;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_414d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_414d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l953_c11_9e36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_left;
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output := BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c6_3600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_5e18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c11_9011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_0500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l965_c11_1e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_eaa9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_eaa9_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l980_c31_9d5b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output := CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l972_c30_19ca] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_ins;
     sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_x;
     sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output := sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l961_c11_8a70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_left;
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output := BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_3600_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_9e36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_9011_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_8a70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_1e59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_5e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_0500_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l962_l957_l966_l970_DUPLICATE_c680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_DUPLICATE_3060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l965_l961_l956_l953_l977_l969_DUPLICATE_e94b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l965_l961_l956_l953_l969_DUPLICATE_1936_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_eaa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l977_l965_DUPLICATE_eaa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l965_l961_l956_l953_l940_l977_DUPLICATE_9ea0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_19ca_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l980_c21_76f1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_76f1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_9d5b_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_62d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l962_c3_9729] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_left;
     BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output := BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_62d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l970_c3_fe3f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_left;
     BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output := BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_62d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_9729_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_fe3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_76f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_511d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;
     -- BIN_OP_AND[uxn_opcodes_h_l971_c11_c0cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_left;
     BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output := BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_62d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- t16_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_62d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_t16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- n16_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- t16_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output := t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l975_c21_719b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_719b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_c0cf_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_719b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_t16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_f82a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- n16_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output := t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_n16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_f82a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l965_c7_4be3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output := result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- n16_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output := n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- t16_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_n16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_4be3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output := tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- n16_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output := n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l961_c7_b0fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_b0fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l956_c7_a366] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output;

     -- n16_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output := tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_a366_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l953_c7_2125] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_cond;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output := result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_2125_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l940_c2_5ea0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l984_l936_DUPLICATE_b3ef LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l984_l936_DUPLICATE_b3ef_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_5ea0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l984_l936_DUPLICATE_b3ef_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l984_l936_DUPLICATE_b3ef_return_output;
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
