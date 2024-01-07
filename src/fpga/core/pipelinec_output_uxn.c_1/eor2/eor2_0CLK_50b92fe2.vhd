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
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_5a3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_1313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_1313]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_1313]
signal t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_1313]
signal n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_873d]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_6e77]
signal n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_0887]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_ff66]
signal n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_0445]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_fd30]
signal n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_22a6]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_d36a]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_1c02]
signal n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_08e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_d967]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_d967]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_d967]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_d967]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_d967]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_d967]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_d967]
signal n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_c81b]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_d21e]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_1edf]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_b430]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_33d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_33d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_33d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_33d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_352c]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_1313
tmp16_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_1313
t16_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_1313
n16_MUX_uxn_opcodes_h_l1111_c2_1313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77
tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_6e77
t16_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_6e77
n16_MUX_uxn_opcodes_h_l1124_c7_6e77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66
tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_ff66
t16_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_ff66
n16_MUX_uxn_opcodes_h_l1127_c7_ff66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30
tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_fd30
t16_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_fd30
n16_MUX_uxn_opcodes_h_l1132_c7_fd30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6
BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02
tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_1c02
n16_MUX_uxn_opcodes_h_l1136_c7_1c02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_d967
tmp16_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_d967
n16_MUX_uxn_opcodes_h_l1140_c7_d967 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b
BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf
sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_352c
CONST_SR_8_uxn_opcodes_h_l1151_c31_352c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_50b4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6cf0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_b2cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_d9bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_40dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_0586 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0784_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_f254 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_9dec : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_875b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_601d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1155_l1107_DUPLICATE_927c_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_50b4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_50b4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_9dec := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_9dec;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_0586 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_0586;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_40dc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_40dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_f254 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_f254;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6cf0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_6cf0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_d9bb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_d9bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_b2cd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_b2cd;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_0887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_1313_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_b430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_08e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_5a3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_d36a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_352c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_0445] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_873d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_1edf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_601d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_601d_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_1313_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5a3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_873d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_0887_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_0445_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_d36a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_08e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_b430_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_d4c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1136_l1132_DUPLICATE_5b90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1127_l1124_l1148_l1140_l1136_l1132_DUPLICATE_fe48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1127_l1124_l1140_l1136_l1132_DUPLICATE_eb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_601d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_601d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1127_l1124_l1111_l1148_l1136_l1132_DUPLICATE_44bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_1edf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_c81b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_33d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_22a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_875b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_875b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_352c_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_33d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_33d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_22a6_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_c81b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_875b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_b843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_33d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_d21e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_33d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_0784] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0784_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_d21e_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0784_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_d967] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_d967_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_1c02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_1c02_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     -- n16_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_fd30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_fd30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_ff66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ff66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6e77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6e77_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_1313] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1155_l1107_DUPLICATE_927c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1155_l1107_DUPLICATE_927c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_1313_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_1313_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1155_l1107_DUPLICATE_927c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1155_l1107_DUPLICATE_927c_return_output;
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
