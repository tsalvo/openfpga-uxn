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
-- BIN_OP_EQ[uxn_opcodes_h_l870_c6_5f71]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c2_9614]
signal n16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c2_9614]
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l870_c2_9614]
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c2_9614]
signal t16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_0c5f]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_0605]
signal n16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_0605]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_0605]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_0605]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_0605]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_0605]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_0605]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l883_c7_0605]
signal t16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l886_c11_0e86]
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l886_c7_453d]
signal n16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l886_c7_453d]
signal tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_453d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_453d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l886_c7_453d]
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_453d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_453d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l886_c7_453d]
signal t16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_780c]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l891_c7_53f8]
signal n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l891_c7_53f8]
signal tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_53f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_53f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_53f8]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_53f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_53f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l891_c7_53f8]
signal t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l892_c3_1629]
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l895_c11_52ac]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_9dd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_0d8f]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_5ffe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l900_c3_0517]
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l901_c11_844a]
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l902_c30_fae8]
signal sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l907_c11_06c9]
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l907_c7_2c1a]
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_2c1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_2c1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_2c1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l910_c31_94b3]
signal CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71
BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c2_9614
n16_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c2_9614_cond,
n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c2_9614
tmp16_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond,
tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c2_9614
t16_MUX_uxn_opcodes_h_l870_c2_9614 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c2_9614_cond,
t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue,
t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse,
t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f
BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_0605
n16_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_0605_cond,
n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_0605
tmp16_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605
result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- t16_MUX_uxn_opcodes_h_l883_c7_0605
t16_MUX_uxn_opcodes_h_l883_c7_0605 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l883_c7_0605_cond,
t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue,
t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse,
t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86
BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output);

-- n16_MUX_uxn_opcodes_h_l886_c7_453d
n16_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l886_c7_453d_cond,
n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l886_c7_453d
tmp16_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond,
tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d
result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- t16_MUX_uxn_opcodes_h_l886_c7_453d
t16_MUX_uxn_opcodes_h_l886_c7_453d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l886_c7_453d_cond,
t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue,
t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse,
t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c
BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output);

-- n16_MUX_uxn_opcodes_h_l891_c7_53f8
n16_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l891_c7_53f8
tmp16_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8
result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- t16_MUX_uxn_opcodes_h_l891_c7_53f8
t16_MUX_uxn_opcodes_h_l891_c7_53f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond,
t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue,
t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse,
t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l892_c3_1629
BIN_OP_OR_uxn_opcodes_h_l892_c3_1629 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left,
BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right,
BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac
BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c7_9dd9
n16_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9
tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9
result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f
BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output);

-- n16_MUX_uxn_opcodes_h_l899_c7_5ffe
n16_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe
tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe
result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l900_c3_0517
BIN_OP_OR_uxn_opcodes_h_l900_c3_0517 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left,
BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right,
BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left,
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right,
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l902_c30_fae8
sp_relative_shift_uxn_opcodes_h_l902_c30_fae8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins,
sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x,
sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y,
sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9
BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a
result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l910_c31_94b3
CONST_SR_8_uxn_opcodes_h_l910_c31_94b3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x,
CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output,
 n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output,
 n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output,
 n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output,
 n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output,
 n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output,
 sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output,
 CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_2965 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_1c38 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_eb52 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8ef1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_0e63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l901_c3_e951 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_5366 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_032d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d8a9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_df00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_2c03_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_0a53_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l866_l914_DUPLICATE_f964_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_eb52 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_eb52;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_5366 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_5366;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_df00 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_df00;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_0e63 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_0e63;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d8a9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d8a9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8ef1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_8ef1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_1c38 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_1c38;
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_2965 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_2965;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l910_c31_94b3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output := CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c11_52ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c6_5f71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_0a53 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_0a53_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_0c5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_780c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9614_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9614_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l902_c30_fae8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_ins;
     sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_x;
     sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output := sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l886_c11_0e86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_left;
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output := BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l907_c11_06c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_0d8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_5f71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_0c5f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_0e86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_780c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_52ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_0d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_06c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l892_l900_l887_l896_DUPLICATE_b681_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l907_l886_l891_l895_l883_DUPLICATE_b330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l907_l886_l891_l895_l899_l883_DUPLICATE_0fbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l886_l891_l895_l899_l883_DUPLICATE_90b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_0a53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_0a53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l907_l886_l870_l891_l895_l883_DUPLICATE_d497_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_fae8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_2c1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_2c1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l900_c3_0517] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_left;
     BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output := BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l910_c21_2c03] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_2c03_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_94b3_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l892_c3_1629] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_left;
     BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output := BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_2c1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_1629_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_0517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_2c03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_3019_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l907_c7_2c1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;

     -- t16_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- n16_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l901_c11_844a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l901_c3_e951 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_844a_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_2c1a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_tmp16_uxn_opcodes_h_l901_c3_e951;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l905_c21_032d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_032d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l901_c3_e951);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- n16_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- t16_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output := t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_032d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_t16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output := t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l899_c7_5ffe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output := result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;

     -- n16_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_5ffe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_t16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l895_c7_9dd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- n16_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output := n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- t16_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output := t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_n16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_9dd9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output := tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output := n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_53f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_53f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l886_c7_453d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output := result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output;

     -- n16_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output := n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_453d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output := tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_0605] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_0605_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9614_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l870_c2_9614] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l866_l914_DUPLICATE_f964 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l866_l914_DUPLICATE_f964_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9614_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9614_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l866_l914_DUPLICATE_f964_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l866_l914_DUPLICATE_f964_return_output;
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
