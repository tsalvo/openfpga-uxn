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
-- BIN_OP_EQ[uxn_opcodes_h_l870_c6_b872]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c2_9d78]
signal n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c2_9d78]
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l870_c2_9d78]
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c2_9d78]
signal t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_7bd2]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l883_c7_ccd2]
signal t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l886_c11_7f33]
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l886_c7_8351]
signal n16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l886_c7_8351]
signal tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_8351]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_8351]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_8351]
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l886_c7_8351]
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_8351]
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l886_c7_8351]
signal t16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_9a96]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l891_c7_a730]
signal n16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l891_c7_a730]
signal tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_a730]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_a730]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_a730]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_a730]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_a730]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l891_c7_a730]
signal t16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l892_c3_604b]
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l895_c11_e553]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_6fd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_3246]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l899_c7_34ae]
signal n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l899_c7_34ae]
signal tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_34ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_34ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_34ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l899_c7_34ae]
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_34ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l900_c3_ce44]
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l901_c11_0e5d]
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l902_c30_741b]
signal sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l907_c11_e2c3]
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_65ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l907_c7_65ae]
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_65ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_65ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l910_c31_1645]
signal CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872
BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c2_9d78
n16_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c2_9d78
tmp16_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c2_9d78
t16_MUX_uxn_opcodes_h_l870_c2_9d78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond,
t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue,
t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse,
t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2
BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_ccd2
n16_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2
tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2
result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- t16_MUX_uxn_opcodes_h_l883_c7_ccd2
t16_MUX_uxn_opcodes_h_l883_c7_ccd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond,
t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue,
t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse,
t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33
BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right,
BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output);

-- n16_MUX_uxn_opcodes_h_l886_c7_8351
n16_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l886_c7_8351_cond,
n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- tmp16_MUX_uxn_opcodes_h_l886_c7_8351
tmp16_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond,
tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351
result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- t16_MUX_uxn_opcodes_h_l886_c7_8351
t16_MUX_uxn_opcodes_h_l886_c7_8351 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l886_c7_8351_cond,
t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue,
t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse,
t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output);

-- n16_MUX_uxn_opcodes_h_l891_c7_a730
n16_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l891_c7_a730_cond,
n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- tmp16_MUX_uxn_opcodes_h_l891_c7_a730
tmp16_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond,
tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730
result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- t16_MUX_uxn_opcodes_h_l891_c7_a730
t16_MUX_uxn_opcodes_h_l891_c7_a730 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l891_c7_a730_cond,
t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue,
t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse,
t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l892_c3_604b
BIN_OP_OR_uxn_opcodes_h_l892_c3_604b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left,
BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right,
BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553
BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c7_6fd5
n16_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5
tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246
BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output);

-- n16_MUX_uxn_opcodes_h_l899_c7_34ae
n16_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l899_c7_34ae
tmp16_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae
result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44
BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left,
BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right,
BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left,
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right,
BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l902_c30_741b
sp_relative_shift_uxn_opcodes_h_l902_c30_741b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins,
sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x,
sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y,
sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3
BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae
result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output);

-- CONST_SR_8_uxn_opcodes_h_l910_c31_1645
CONST_SR_8_uxn_opcodes_h_l910_c31_1645 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x,
CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output,
 n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output,
 n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output,
 n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output,
 BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output,
 n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output,
 n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output,
 sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output,
 CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_27bc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_f4e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_60ca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_86b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_799d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l901_c3_7624 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_243c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_7971_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d839 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_9041 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_6791_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_e68f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l914_l866_DUPLICATE_af51_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_27bc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l875_c3_27bc;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_243c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_243c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_799d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_799d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_60ca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l884_c3_60ca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_9041 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_9041;
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_f4e8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l880_c3_f4e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d839 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l908_c3_d839;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_86b2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l889_c3_86b2;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9d78_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c6_b872] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_9a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9d78_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_e68f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_e68f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_3246] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l910_c31_1645] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x <= VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output := CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c11_e553] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l886_c11_7f33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_left;
     BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output := BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l902_c30_741b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_ins;
     sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_x;
     sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output := sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_7bd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l907_c11_e2c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c6_b872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_7bd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l886_c11_7f33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_9a96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_e553_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_3246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_e2c3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l887_l892_l896_l900_DUPLICATE_f8ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l895_l907_l883_l886_DUPLICATE_f601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l891_l895_l907_l883_l899_l886_DUPLICATE_f05a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l895_l883_l899_l886_DUPLICATE_bd04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_e68f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l895_l907_DUPLICATE_e68f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l895_l907_l870_l883_l886_DUPLICATE_d8f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l902_c30_741b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_65ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_65ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l892_c3_604b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_left;
     BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output := BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l910_c21_6791] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_6791_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l910_c31_1645_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l900_c3_ce44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_left;
     BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output := BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_65ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l892_c3_604b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l900_c3_ce44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l910_c21_6791_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l888_l897_DUPLICATE_7c83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;
     -- n16_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output := t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l907_c7_65ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l901_c11_0e5d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l901_c3_7624 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l901_c11_0e5d_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l907_c7_65ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_t16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_tmp16_uxn_opcodes_h_l901_c3_7624;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- t16_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output := t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l905_c21_7971] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_7971_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l901_c3_7624);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- n16_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l905_c21_7971_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_n16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l899_c7_34ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- n16_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output := n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- t16_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_n16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l899_c7_34ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     -- t16_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- n16_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output := n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l895_c7_6fd5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output := result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output := tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l895_c7_6fd5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_a730] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output := tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_a730_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l886_c7_8351] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_cond;
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output := result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- n16_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l886_c7_8351_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_ccd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_ccd2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l870_c2_9d78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l914_l866_DUPLICATE_af51 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l914_l866_DUPLICATE_af51_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c2_9d78_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l870_c2_9d78_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l914_l866_DUPLICATE_af51_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l914_l866_DUPLICATE_af51_return_output;
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
